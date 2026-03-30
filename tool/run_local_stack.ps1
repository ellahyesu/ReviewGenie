$ErrorActionPreference = 'Stop'

$proxyJob = Start-Job -ScriptBlock {
  Set-Location 'C:\Users\KANGOROO\Documents\GitHub\ReviewGenie'
  node .\tool\naver_proxy_server.mjs
}

try {
  . $PROFILE
  flutter run -d chrome --web-hostname localhost --web-port 70
} finally {
  Stop-Job $proxyJob | Out-Null
  Remove-Job $proxyJob | Out-Null
}
