# ReviewGenie

ReviewGenie는 상품 검색, 별점 선택, 플랫폼 톤 선택, 리뷰 생성까지 한 화면에서 처리하는 Flutter 앱입니다.

## 비밀값 등록

이 프로젝트는 두 가지 방식을 지원합니다.

1. 로컬 개발용 `.env`
2. 빌드 시 주입하는 `--dart-define`

### 1) `.env` 방식

루트의 `.env.example` 파일을 복사해서 `.env`를 만들고 값을 채우면 됩니다.

```env
NAVER_CLIENT_ID=your_naver_client_id
NAVER_CLIENT_SECRET=your_naver_client_secret
NAVER_PROXY_BASE_URL=http://localhost:7070/api/naver
NAVER_PROXY_PORT=7070
FRONTEND_ORIGIN=http://localhost:70
OPENAI_API_KEY=your_openai_api_key
OPENAI_MODEL=gpt-4.1-mini
```

앱 실행:

```bash
flutter run -d chrome
```

네이버 검색 API를 Flutter web에서 직접 확인할 때는 포트를 `70`으로 고정해서 실행하는 편이 좋습니다.

```bash
flutter run -d chrome --web-hostname localhost --web-port 70
```

PowerShell에서는 아래 스크립트로 동일하게 실행할 수 있습니다.

```powershell
.\tool\run_web_local.ps1
```

`run_web_local.ps1` 는 네이버 프록시와 Flutter web을 같이 실행합니다.

브라우저에서는 네이버 검색 API를 직접 호출하지 않고 로컬 프록시를 거쳐야 합니다. 프록시만 실행하려면:

```powershell
.\tool\run_naver_proxy.ps1
```

프록시와 Flutter web을 같이 올리려면:

```powershell
.\tool\run_local_stack.ps1
```

기본 구성은 아래처럼 맞춰져 있습니다.

- Flutter web: `http://localhost:70`
- Naver proxy: `http://localhost:7070`
- Flutter web search base URL: `http://localhost:7070/api/naver`

이 경우 네이버 개발자센터의 `비로그인 오픈API 서비스 환경 > WEB`에는 `http://localhost:70` 를 등록하면 됩니다.

### 2) `--dart-define` 방식

터미널에서 직접 전달할 수도 있습니다.

```bash
flutter run -d chrome \
  --dart-define=NAVER_CLIENT_ID=your_id \
  --dart-define=NAVER_CLIENT_SECRET=your_secret \
  --dart-define=OPENAI_API_KEY=your_key \
  --dart-define=OPENAI_MODEL=gpt-4.1-mini
```

## 실무 기준

- 로컬 개발은 `.env`가 가장 편합니다.
- CI/CD, 릴리즈 빌드는 `--dart-define` 또는 백엔드 프록시가 더 안전합니다.
- 특히 웹 배포에서 `NAVER_CLIENT_SECRET`와 `OPENAI_API_KEY`를 클라이언트에 직접 넣는 건 운영용으로는 비권장입니다.

## 검증

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```
