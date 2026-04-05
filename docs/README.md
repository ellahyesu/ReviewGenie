# ReviewGenie

ReviewGenie는 상품 검색, 별점 입력, 플랫폼별 문체 선택, AI 리뷰 생성까지 하나의 흐름으로 처리하는 Flutter 기반 프로토타입입니다.  
실제 상품 데이터를 기반으로 리뷰 초안을 빠르게 생성하는 것을 목표로 하며, 현재는 Naver Shopping 검색과 OpenAI 기반 텍스트 생성을 중심으로 구성되어 있습니다.

## 프로젝트 개요

이 프로젝트는 다음 사용자 흐름을 기준으로 설계되어 있습니다.

1. 상품 검색
2. 검색 결과에서 상품 선택
3. 별점 선택
4. 리뷰 게시 플랫폼 선택
5. 리뷰 생성
6. 결과 복사 및 활용

핵심 가치는 다음 두 가지입니다.

- 실데이터 기반 상품 검색 결과를 활용해 리뷰의 맥락을 구체화
- 별점과 플랫폼 톤을 반영해 실제 업로드 가능한 형태의 초안 생성

세부 요구사항은 [PRD.md](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/docs/PRD.md)에서 확인할 수 있습니다.

## 현재 구현 범위

- Flutter 단일 앱에서 검색, 선택, 생성 흐름 제공
- Riverpod 기반 상태 관리
- Freezed 기반 불변 모델 구성
- Dio 기반 외부 API 통신
- Shared Preferences 기반 최근 검색어 저장
- OpenAI API 미설정 시 템플릿 리뷰 폴백 제공
- Flutter web 환경에서 Naver 검색 API를 안전하게 호출하기 위한 로컬 프록시 제공

## 기술 스택

- Framework: Flutter
- Language: Dart 3
- State Management: Riverpod
- Networking: Dio
- Modeling: Freezed, json_serializable
- Local Storage: Shared Preferences
- AI Integration: OpenAI API

자세한 기술 선택 배경은 [TECH_STACK.md](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/docs/TECH_STACK.md)를 참고하면 됩니다.

## 아키텍처

프로젝트는 기능 중심 구조와 공통 계층 분리를 함께 사용합니다.

```text
lib/
  src/
    core/         공통 설정, 예외, 유틸리티
    data/         API 클라이언트, DTO, 리포지토리
    features/     검색, 평점, 생성 등 기능 단위 모듈
    providers/    전역 상태 관리
  main.dart
tool/
  naver_proxy_server.mjs
  run_naver_proxy.ps1
  run_local_stack.ps1
  run_web_local.ps1
docs/
  PRD.md
  ARCHITECTURE.md
  API_SPEC.md
  NAVER.md
  TECH_STACK.md
  README.md
```

전체 구조 설명은 [ARCHITECTURE.md](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/docs/ARCHITECTURE.md)에 정리되어 있습니다.

## 외부 연동 구조

### 1. 상품 검색

- 기본 검색 소스: Naver Shopping Search API
- Flutter mobile/desktop 환경: 직접 API 호출 가능
- Flutter web 환경: 브라우저 CORS 제약 때문에 직접 호출하지 않고 로컬 프록시 경유

현재 web 검색 경로는 다음과 같습니다.

```text
Flutter Web (localhost:70)
  -> Local Proxy (localhost:7070)
  -> Naver Open API
```

### 2. 리뷰 생성

- OpenAI API 키가 있으면 실제 생성 호출
- 키가 없거나 호출 실패 시 템플릿 기반 폴백 생성

외부 API 규격은 [API_SPEC.md](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/docs/API_SPEC.md)에서 확인할 수 있습니다.

## 환경 변수 설정

루트의 [`.env.example`](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/.env.example)를 복사해 `.env`를 생성한 뒤 값을 채웁니다.

```env
NAVER_CLIENT_ID=your_naver_client_id
NAVER_CLIENT_SECRET=your_naver_client_secret
NAVER_PROXY_BASE_URL=http://localhost:7070/api/naver
NAVER_PROXY_PORT=7070
FRONTEND_ORIGIN=http://localhost:70
OPENAI_API_KEY=your_openai_api_key
OPENAI_MODEL=gpt-4.1-mini
```

각 항목의 의미는 다음과 같습니다.

- `NAVER_CLIENT_ID`: Naver Open API Client ID
- `NAVER_CLIENT_SECRET`: Naver Open API Client Secret
- `NAVER_PROXY_BASE_URL`: Flutter web이 호출할 프록시 기본 URL
- `NAVER_PROXY_PORT`: 로컬 프록시 서버 포트
- `FRONTEND_ORIGIN`: 프록시가 허용할 프런트엔드 origin
- `OPENAI_API_KEY`: OpenAI API Key
- `OPENAI_MODEL`: 사용할 OpenAI 모델명

Naver 자격증명 발급 절차는 [NAVER.md](C:/Users/KANGOROO/Documents/GitHub/ReviewGenie/docs/NAVER.md)에 정리되어 있습니다.

## 실행 방법

### 1. 의존성 설치

```bash
flutter pub get
```

### 2. 코드 생성

Freezed 또는 JSON 모델 변경이 있었다면 아래 명령을 실행합니다.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. 로컬 웹 실행

기본 권장 방식은 아래 PowerShell 스크립트입니다.

```powershell
.\tool\run_web_local.ps1
```

이 스크립트는 다음을 함께 실행합니다.

- Naver 프록시 서버
- Flutter web 앱

실행 포트는 고정되어 있습니다.

- Flutter web: `http://localhost:70`
- Naver proxy: `http://localhost:7070`

직접 나눠서 실행하려면 아래 명령을 사용할 수 있습니다.

프록시만 실행:

```powershell
.\tool\run_naver_proxy.ps1
```

프록시 + 앱 동시 실행:

```powershell
.\tool\run_local_stack.ps1
```

Flutter만 직접 실행:

```bash
flutter run -d chrome --web-hostname localhost --web-port 70
```

## Naver Developers 설정

Flutter web 기준으로 아래 설정이 맞아야 합니다.

- 사용 API: `검색`
- 비로그인 오픈API 서비스 환경 > WEB 설정: `http://localhost:70`
- Android 앱 패키지명: `com.reviewgenie.review_genie`

중요한 점은, web에서는 브라우저가 Naver API를 직접 호출하지 않는다는 것입니다.  
실제 호출은 로컬 프록시가 담당하므로, 브라우저 CORS 문제를 우회할 수 있습니다.

## 검증 명령

개발 중 최소 검증 기준은 다음과 같습니다.

```bash
flutter analyze
flutter test
flutter build web
```

## 운영 관점 주의사항

- `NAVER_CLIENT_SECRET`와 `OPENAI_API_KEY`를 브라우저 코드에 직접 노출하는 구조는 운영용으로 적절하지 않습니다.
- 현재 로컬 프록시는 개발 편의를 위한 구조입니다.
- 실제 배포 단계에서는 별도 백엔드 또는 서버리스 프록시로 전환하는 것이 맞습니다.
