# JSP_Ditflix

<div id="top"></div>

<div align='center'>

<h1><b>프로젝트 제목</b></h1>
<h3><b>프로젝트 부제목</b></h3>

Notion: [프로젝트 노션 링크](https://)

</div>

<br>

## 0. 목차

1.  [팀원 소개](#1)
2.  [시작 가이드](#2)
3.  [브랜치 및 디렉토리 구조](#3)
4.  [Color 적용 방법](#4)
5.  [커밋 컨벤션](#5)
6.  [Package_yarn](#6)
7.  [기타](#7)

<br >

## <span id="1">🏃 1. 팀원 소개</span>

<div align="center">

| <img src="https://img.shields.io/badge/Project_Leader-FF5733" /> | <img src="https://img.shields.io/badge/Tech_Leader-%2300264B" /> | <img src="https://img.shields.io/badge/Documentation_Leader-%2310069F%20" /> | <img src="https://img.shields.io/badge/Design_Leader-blue" /> |
| :--------------------------------------------------------------: | :--------------------------------------------------------------: | :--------------------------------------------------------------------------: | :-----------------------------------------------------------: |
|      <img src="https://github.com/" width="120px;" alt=""/>      |      <img src="https://github.com/" width="120px;" alt=""/>      |            <img src="https://github.com/" width="120px;" alt=""/>            |    <img src="https://github.com/" width="120px;" alt=""/>     |
|           [팀원1 이름](https://github.com/팀원1아이디)           |           [팀원2 이름](https://github.com/팀원2아이디)           |                 [팀원3 이름](https://github.com/팀원3아이디)                 |         [팀원4 이름](https://github.com/팀원4아이디)          |
|                            기능1 설명                            |                            기능2 설명                            |                                  기능3 설명                                  |                          기능4 설명                           |

</div>

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

## <span id="2">🛠️ 2. 시작 가이드</span>

### 2.1 Installation

```shell
# 1. 클론하기
$ git clone https://github.com/CAREER-For-Me/Career-web.git .

# 2. 의존성 설치하기
$ yarn

# 3. 개발 서버 실행하기
$ yarn dev
```

<br>

### 2.2 브랜치 생성 가이드

① 브랜치 생성

- `feature/`로 시작하고 기능명을 붙이세요.
- e.g., `feature/login`, `feature/activityRecommend`

<br>

② 본인 브랜치에 push 후 `develop` 브랜치에 PR 보낸 후 카톡 남겨주세요.

<br>

③ PR 후 `develop` 브랜치에서 pull

<br>

④ main 브랜치는 건들지 말기

<br>

> 브랜치 활용 명령어

```shell
# 브랜치 생성
git branch feature/<기능명>

# 브랜치 이동
git switch feature/<기능명>

# 생성과 동시에 이동
git switch -c feature/<기능명>

# 브랜치 리스트 확인
git branch

# 브랜치 삭제 (삭제를 하기 위해선 다른 브랜치로 전환 후 삭제하셔야합니다.)
git branch -d <브랜치명>   # 안전 삭제
git branch -D <브랜치명>   # 강제 삭제
```

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

## 3. <span id="3">🗂️ 3. 브랜치 및 디렉토리 구조</span>

> 브랜치

- `main`
- `dev`
- `featuer/login`

<br>

> 디렉토리 구조

```shell

```

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

# 4. <span id="4">🎨 4. Color 적용 방법</span>

`tailwind.config.js` 파일에 프로젝트에서 사용할 색상을 정의해 뒀습니다.

```ts
extend: {
  colors: {
    careerForMe: {
      main: "#6D72FF",
      mainMedium: "#979AED",
      red: "#FF4238",
      redMedium: "#FF8E88",
      gray01: "#F4F4F4",
    },
    gray: {
      dark: "#737373",
      medium: "#B2B2B2",
      light: "#D2D2D2",
    },
  },
}
```

<br>

Tailwind에서 추가한 색상을 아래와 같이 사용할 수 있습니다.

```tsx
<p class="text-careerForMe-main">커리어 포미 색</p>
```

```tsx
<div class="bg-careerForMe-red">배경 색</div>
```

```tsx
<button class="border border-gray-medium">테두리 색</button>
```

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

## <span id="5">🤝 5. 커밋 컨벤션</span>

커밋 메시지 형식: `[타입] - 하려는 내용`

| **타입** | **설명**                                          | **예시**                                              |
| -------- | ------------------------------------------------- | ----------------------------------------------------- |
| feat     | 기능 구현                                         | [feat] - 페인페이지 레이아웃 구현                     |
| rename   | 파일/폴더 이름 변경 및 이동                       | [rename] - `src/old-folder`를 `src/new-folder`로 이동 |
| script   | 라이브러리 추가                                   | [script] - `supabase` 라이브러리 추가                 |
| fix      | 버그 수정                                         | [fix] - `supabase` env 미연결 문제 해결               |
| chore    | 빌드 업무 수정, 패키지 매니저 설정 수정           | [chore] - .env 설정 변경                              |
| refactor | 코드 리팩토링                                     | [refactor] - 함수 분리 및 코드 정리                   |
| style    | 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우 | [style] - 버튼 스타일 수정                            |
| test     | 테스트 코드, 리팩토링 테스트 코드 추가            | [test] - 유저 로그인 기능 테스트 추가                 |
| docs     | 문서 수정                                         | [docs] - API 문서 업데이트                            |

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

## <span id="6">⚙️ 6. Package_yarn</span>

다음은 이 프로젝트에서 사용 중인 주요 라이브러리 목록입니다.

이미 설치되어 있으므로, 별도로 추가할 필요는 없습니다.

```shell
yarn create next-app
```

```shell
yarn add axios
```

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

## <span id="7">7. 기타</span>

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>
