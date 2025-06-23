<div id="top"></div>

<div align='center'>
<h1><b>JSP_Ditflix</b></h1>
<img src="https://img.shields.io/badge/프로젝트 기간-2025.04.03~2025.06.23-blue?style=flat&logo=&logoColor=white" />
</div>

<br>

## 0. 목차

1.  [프로젝트 소개](#1)
2.  [팀원 소개](#2)
3.  [사이트맵, ERD, 파일구조](#3)
4.  [기술스택](#4)

<br>

## <span id="1">🏃 1. 프로젝트 소개</span>
- 기존 OTT 플랫폼(ex. 넷플릭스, 디즈니+)의 미디어 시청 기능과 여러 미디어 매체 커뮤니케이션 웹 어플리케이션.
- 
<br>


## <span id="2">🏃 2. 팀원 소개</span>

<div align="center">

| 팀장 | 팀원 |
| :---: | :---: |
| <img src="https://github.com/sam3319.png" width="120px"/> | <img src="https://github.com/jihun5914.png" width="120px"/> |
| [이동현](https://github.com/sam3319) | [김지훈](https://github.com/jihun5914) |

</div>
<br>

## <span id="3">🏃 3. 사이트맵, ERD, 파일구조</span>


## 워크스페이스 구조 📁

```
📂 JSP_Ditflix/
├── 📂 src/main/java/
│   ├── 📂 DAO/                          # 데이터베이스 접근 객체
│   │   ├── 📂 Content/
│   │   │   └── 📄 ContentDAO.java       # 콘텐츠 데이터 접근
│   │   ├── 📂 FreeBoard/
│   │   │   ├── 📄 FreeBoardDAO.java     # 자유게시판 데이터 접근
│   │   │   └── 📄 FreeBoardCommentDAO.java # 댓글 데이터 접근
│   │   ├── 📂 ReviewBoard/
│   │   │   └── 📄 ReviewBoardDAO.java   # 리뷰게시판 데이터 접근
│   │   └── 📂 User/
│   │       ├── 📄 UsersDAO.java         # 사용자 데이터 접근
│   │       └── 📄 UserHistoryDAO.java   # 사용자 이력 관리
│   │
│   ├── 📂 DTO/                          # 데이터 전송 객체
│   │   ├── 📂 Content/
│   │   │   └── 📄 ContentDTO.java       # 콘텐츠 데이터 객체
│   │   ├── 📂 FreeBoard/
│   │   │   ├── 📄 FreeBoardDTO.java     # 자유게시판 데이터 객체
│   │   │   ├── 📄 FreeBoardCommentDTO.java # 댓글 데이터 객체
│   │   │   └── 📄 PageDTO.java          # 페이징 처리 객체
│   │   ├── 📂 ReviewBoard/
│   │   │   └── 📄 ReviewBoardDTO.java   # 리뷰게시판 데이터 객체
│   │   └── 📂 User/
│   │       ├── 📄 UsersDTO.java         # 사용자 데이터 객체
│   │       ├── 📄 UserHistoryDTO.java   # 사용자 이력 객체
│   │       └── 📄 UserMemberShipDTO.java # 멤버십 데이터 객체
│   │
│   ├── 📂 controller/                   # 요청 처리 컨트롤러
│   │   ├── 📂 Content/
│   │   │   └── 📄 ContentController.java # 콘텐츠 요청 처리
│   │   ├── 📂 FreeBoard/
│   │   │   └── 📄 FreeBoardController.java # 자유게시판 요청 처리
│   │   ├── 📂 Page/
│   │   │   └── 📄 PageController.java   # 페이지 라우팅 처리
│   │   ├── 📂 ReviewBoard/
│   │   │   └── 📄 ReviewBoardController.java # 리뷰게시판 요청 처리
│   │   └── 📂 User/
│   │       └── 📄 UserController.java   # 사용자 요청 처리
│   │
│   └── 📂 service/                      # 비즈니스 로직 서비스
│       ├── 📂 Content/
│       │   ├── 📄 ContentService.java   # 콘텐츠 비즈니스 로직
│       │   ├── 📄 ContentSearchService.java # 콘텐츠 검색 서비스
│       │   ├── 📄 ContentGenreSearchService.java # 장르별 검색 서비스
│       │   └── 📄 ContentModalSearchService.java # 모달 검색 서비스
│       ├── 📂 FreeBoard/
│       │   ├── 📄 FreeBoardService.java # 자유게시판 비즈니스 로직
│       │   ├── 📄 FreeBoardListService.java # 게시글 목록 서비스
│       │   ├── 📄 FreeBoardInsertService.java # 게시글 작성 서비스
│       │   ├── 📄 FreeBoardUpdateService.java # 게시글 수정 서비스
│       │   ├── 📄 FreeBoardDeleteService.java # 게시글 삭제 서비스
│       │   └── 📄 FreeBoardComment*.java # 댓글 관련 서비스들
│       ├── 📂 ReviewBoard/
│       │   ├── 📄 ReviewBoardService.java # 리뷰게시판 비즈니스 로직
│       │   └── 📄 ReviewBoard*.java     # 리뷰게시판 CRUD 서비스들
│       └── 📂 User/
│           ├── 📄 UserService.java      # 사용자 비즈니스 로직
│           ├── 📄 UserLoginService.java # 로그인 서비스
│           ├── 📄 UserInsertService.java # 회원가입 서비스
│           └── 📄 User*.java            # 기타 사용자 관련 서비스들
│
├── 📂 src/main/webapp/
│   ├── 📂 META-INF/
│   │   ├── 📄 MANIFEST.MF              # 매니페스트 파일
│   │   └── 📄 context.xml              # 컨텍스트 설정
│   │
│   ├── 📂 SQL/
│   │   ├── 📄 DITFILX.sql              # 데이터베이스 스키마
│   │   └── 📄 DitFlix_DataInsert.sql   # 초기 데이터 삽입
│   │
│   ├── 📂 WEB-INF/
│   │   ├── 📂 lib/                     # 외부 라이브러리
│   │   │   ├── 📄 gson-2.13.1.jar      # JSON 처리 라이브러리
│   │   │   ├── 📄 jstl-1.2.jar         # JSP 표준 태그 라이브러리
│   │   │   └── 📄 mariadb-java-client-3.5.2.jar # MariaDB 드라이버
│   │   └── 📂 views/                   # JSP 뷰 페이지들
│   │       ├── 📂 freeboardDir/        # 자유게시판 관련 JSP
│   │       │   ├── 📄 freeboard.jsp    # 자유게시판 목록
│   │       │   ├── 📄 freeboardPost.jsp # 게시글 상세보기
│   │       │   ├── 📄 freeboardWrite.jsp # 게시글 작성
│   │       │   └── 📄 freeboardEdit.jsp # 게시글 수정
│   │       ├── 📂 reviewboardDir/      # 리뷰게시판 관련 JSP
│   │       │   ├── 📄 reviewboard.jsp  # 리뷰게시판 목록
│   │       │   ├── 📄 reviewboardPost.jsp # 리뷰 상세보기
│   │       │   └── 📄 reviewboardWrite.jsp # 리뷰 작성
│   │       ├── 📄 index.jsp            # 메인 페이지
│   │       ├── 📄 loginForm.jsp        # 로그인 페이지
│   │       ├── 📄 joinForm.jsp         # 회원가입 페이지
│   │       ├── 📄 memberShip.jsp       # 멤버십 페이지
│   │       ├── 📄 myPage.jsp           # 마이페이지
│   │       └── 📄 search.jsp           # 검색 페이지
│   │
│   ├── 📂 css/                         # CSS 스타일시트
│   │   ├── 📄 index.css                # 메인 페이지 스타일
│   │   ├── 📄 loginForm.css            # 로그인 페이지 스타일
│   │   ├── 📄 joinForm.css             # 회원가입 페이지 스타일
│   │   ├── 📄 memberShip.css           # 멤버십 페이지 스타일
│   │   ├── 📄 myPage.css               # 마이페이지 스타일
│   │   ├── 📄 search.css               # 검색 페이지 스타일
│   │   ├── 📄 freeboard.css            # 자유게시판 스타일
│   │   ├── 📄 freeboardPost.css        # 게시글 상세 스타일
│   │   ├── 📄 freeboardWrite.css       # 게시글 작성 스타일
│   │   ├── 📄 freeboardEdit.css        # 게시글 수정 스타일
│   │   ├── 📄 reviewboard.css          # 리뷰게시판 스타일
│   │   ├── 📄 reviewboardPost.css      # 리뷰 상세 스타일
│   │   └── 📄 reviewboardWrite.css     # 리뷰 작성 스타일
│   │
│   ├── 📂 js/                          # JavaScript 파일들
│   │   ├── 📄 index.js                 # 메인 페이지 스크립트
│   │   ├── 📄 login.js                 # 로그인 스크립트
│   │   ├── 📄 join.js                  # 회원가입 스크립트
│   │   ├── 📄 memberShip.js            # 멤버십 스크립트
│   │   ├── 📄 myPage.js                # 마이페이지 스크립트
│   │   ├── 📄 search.js                # 검색 스크립트
│   │   ├── 📄 freeboardPost.js         # 게시글 상세 스크립트
│   │   ├── 📄 reviewboardPost.js       # 리뷰 상세 스크립트
│   │   └── 📄 reviewboardWrite.js      # 리뷰 작성 스크립트
│   │
│   ├── 📂 images/                      # 이미지 리소스
│   │   ├── 📂 posters/                 # 콘텐츠 포스터 (34개)
│   │   │   ├── 📄 Avengers_poster.webp # 어벤져스 포스터
│   │   │   ├── 📄 SpiderMan_poster.webp # 스파이더맨 포스터
│   │   │   ├── 📄 AttackonTitan_poster.webp # 진격의 거인 포스터
│   │   │   ├── 📄 DemonSlayer_poster.webp # 귀멸의 칼날 포스터
│   │   │   ├── 📄 ItaewonClass_poster.webp # 이태원 클라스 포스터
│   │   │   ├── 📄 StrangerThings_poster.webp # 스트레인저 띵스 포스터
│   │   │   └── 📄 ... (기타 28개 포스터)
│   │   └── 📂 thumbnails/              # 썸네일 이미지 (34개)
│   │       ├── 📄 Avengers_thumb.webp  # 어벤져스 썸네일
│   │       ├── 📄 SpiderMan_thumb.webp # 스파이더맨 썸네일
│   │       └── 📄 ... (기타 32개 썸네일)
│   │
│   ├── 📂 photo/                       # 기본 이미지
│   │   ├── 📂 default/
│   │   │   ├── 📄 banner1.webp         # 메인 배너 1
│   │   │   ├── 📄 banner2.webp         # 메인 배너 2
│   │   │   ├── 📄 banner3.webp         # 메인 배너 3
│   │   │   ├── 📄 membership.webp      # 멤버십 이미지
│   │   │   ├── 📄 profile1.png         # 기본 프로필 1
│   │   │   └── 📄 profile2.png         # 기본 프로필 2
│   │   └── 📂 review/
│   │       └── 📄 img.jpg              # 리뷰 기본 이미지
│   │
│   └── 📄 index.do                     # 진입점 파일
│
├── 📂 build/                           # 컴파일된 클래스 파일들
│   └── 📂 classes/
│       ├── 📂 DAO/                     # 컴파일된 DAO 클래스들
│       ├── 📂 DTO/                     # 컴파일된 DTO 클래스들
│       ├── 📂 controller/              # 컴파일된 Controller 클래스들
│       └── 📂 service/                 # 컴파일된 Service 클래스들
│
├── 📂 .settings/                       # Eclipse IDE 설정
├── 📄 .classpath                       # Eclipse 클래스패스 설정
└──  📄 .project                         # Eclipse 프로젝트 설정
```

<br>

## <span id="4">📚 4. 기술 스택</span>

### Environment

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)<img alt="eclipseide" src="https://img.shields.io/badge/eclipseide-2C2255.svg?&style=for-the-badge&logo=eclipseide&logoColor=white"/>


### Development

![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
<img alt="bootstrap" src="https://img.shields.io/badge/bootstrap-7952B3.svg?&style=for-the-badge&logo=bootstrap&logoColor=white"/>
<img alt="mariadb" src="https://img.shields.io/badge/mariadb-003545.svg?&style=for-the-badge&logo=mariadb&logoColor=white"/>
<img alt="apachetomcat" src="https://img.shields.io/badge/apachetomcat-F8DC75.svg?&style=for-the-badge&logo=apachetomcat&logoColor=black"/>


### Design



### Hosting



### Communication

![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white)![Discord](https://img.shields.io/badge/Discord-2D8CFF?style=for-the-badge&logo=Discord&logoColor=white)

<br>

<!-- Top Button -->
<p style='background: black; width: 32px; height: 32px; border-radius: 50%; display: flex; justify-content: center; align-items: center; margin-left: auto;'><a href="#top" style='color: white; '>▲</a></p>

<br>

