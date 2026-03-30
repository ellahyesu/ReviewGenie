import { createServer } from 'node:http';
import { readFileSync, existsSync } from 'node:fs';
import { resolve } from 'node:path';

const env = loadEnv(resolve(process.cwd(), '.env'));
const proxyPort = Number.parseInt(process.env.NAVER_PROXY_PORT ?? env.NAVER_PROXY_PORT ?? '7070', 10);
const allowedOrigin = process.env.FRONTEND_ORIGIN ?? env.FRONTEND_ORIGIN ?? 'http://localhost:70';
const naverClientId = process.env.NAVER_CLIENT_ID ?? env.NAVER_CLIENT_ID ?? '';
const naverClientSecret = process.env.NAVER_CLIENT_SECRET ?? env.NAVER_CLIENT_SECRET ?? '';

if (!naverClientId || !naverClientSecret) {
  console.error('Missing NAVER_CLIENT_ID or NAVER_CLIENT_SECRET in .env or process environment.');
  process.exit(1);
}

const server = createServer(async (request, response) => {
  applyCorsHeaders(response, allowedOrigin);

  if (request.method === 'OPTIONS') {
    response.writeHead(204);
    response.end();
    return;
  }

  const url = new URL(request.url ?? '/', `http://${request.headers.host ?? 'localhost'}`);

  if (request.method === 'GET' && url.pathname === '/health') {
    sendJson(response, 200, {
      ok: true,
      service: 'naver-proxy',
      allowedOrigin,
    });
    return;
  }

  if (
    request.method === 'GET' &&
    (url.pathname === '/api/naver/shop' || url.pathname === '/api/naver/shop.json')
  ) {
    const query = (url.searchParams.get('query') ?? '').trim();
    const display = sanitizePositiveInt(url.searchParams.get('display'), 12, 1, 100);
    const sort = sanitizeSort(url.searchParams.get('sort'));

    if (!query) {
      sendJson(response, 400, {
        error: 'Missing required query parameter: query',
      });
      return;
    }

    const upstreamUrl = new URL('https://openapi.naver.com/v1/search/shop.json');
    upstreamUrl.searchParams.set('query', query);
    upstreamUrl.searchParams.set('display', String(display));
    upstreamUrl.searchParams.set('sort', sort);

    try {
      const upstreamResponse = await fetch(upstreamUrl, {
        method: 'GET',
        headers: {
          'X-Naver-Client-Id': naverClientId,
          'X-Naver-Client-Secret': naverClientSecret,
        },
      });

      const bodyText = await upstreamResponse.text();
      response.writeHead(upstreamResponse.status, {
        'Content-Type': upstreamResponse.headers.get('content-type') ?? 'application/json; charset=utf-8',
      });
      response.end(bodyText);
    } catch (error) {
      sendJson(response, 502, {
        error: 'Failed to reach Naver shopping search API.',
        details: error instanceof Error ? error.message : String(error),
      });
    }
    return;
  }

  sendJson(response, 404, {
    error: 'Not found',
    path: url.pathname,
  });
});

server.listen(proxyPort, () => {
  console.log(`Naver proxy listening on http://localhost:${proxyPort}`);
  console.log(`Allowed frontend origin: ${allowedOrigin}`);
});

function applyCorsHeaders(response, allowedOriginValue) {
  response.setHeader('Access-Control-Allow-Origin', allowedOriginValue);
  response.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS');
  response.setHeader('Access-Control-Allow-Headers', 'Content-Type');
}

function sendJson(response, statusCode, payload) {
  response.writeHead(statusCode, {
    'Content-Type': 'application/json; charset=utf-8',
  });
  response.end(JSON.stringify(payload));
}

function sanitizePositiveInt(rawValue, fallback, min, max) {
  const parsed = Number.parseInt(rawValue ?? '', 10);
  if (!Number.isFinite(parsed)) {
    return fallback;
  }

  return Math.min(Math.max(parsed, min), max);
}

function sanitizeSort(rawValue) {
  const allowed = new Set(['sim', 'date', 'asc', 'dsc']);
  return allowed.has(rawValue ?? '') ? rawValue : 'sim';
}

function loadEnv(filePath) {
  if (!existsSync(filePath)) {
    return {};
  }

  const raw = readFileSync(filePath, 'utf8');
  const parsed = {};

  for (const line of raw.split(/\r?\n/)) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) {
      continue;
    }

    const separatorIndex = trimmed.indexOf('=');
    if (separatorIndex < 0) {
      continue;
    }

    const key = trimmed.slice(0, separatorIndex).trim();
    const value = trimmed.slice(separatorIndex + 1).trim();
    parsed[key] = stripWrappingQuotes(value);
  }

  return parsed;
}

function stripWrappingQuotes(value) {
  if (
    (value.startsWith('"') && value.endsWith('"')) ||
    (value.startsWith("'") && value.endsWith("'"))
  ) {
    return value.slice(1, -1);
  }

  return value;
}
