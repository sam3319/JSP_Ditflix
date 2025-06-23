<%
/**==================================================
 * 프로그램명 : OTT
 * 파일명 : memberShip.jsp
 * 작성일 : 2025. 6. 10.
 * 작성자 :  이동현
 * 변경이력 :
 * 프로그램 설명 : 멤버쉽 페이지(로그인 정보가 없을 경우 메인페이지가 된다.)
 *===================================================*/
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>멤버십 안내</title>
    <!-- 부트스트랩 CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7"
      crossorigin="anonymous">
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 커스텀 CSS -->
    <link rel="stylesheet" href="/css/memberShip.css">
  </head>
  <body>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
      crossorigin="anonymous"></script>

   <!-- 메인 컨텐츠 -->
    <div class="container-fluid mt-5 w-75">
      <!-- 히어로 섹션 -->
      <div class="hero-section">
        <div class="container">
          <div class="row">
            <div class="col-lg-8">
              <h1 class="display-4 fw-bold mb-4">프리미엄 멤버십으로<br>더 많은 혜택을
                누리세요</h1>
              <p class="lead mb-4">무제한 스트리밍, 독점 콘텐츠, 광고 없는 시청 경험까지.<br>지금 바로
                멤버십에 가입하고 특별한 혜택을 누려보세요.</p>
              <button class="btn custom-btn btn-lg memberBtn"
                onclick="mainMove()">멤버십 가입하기</button>
            </div>
          </div>
        </div>
      </div>

      <!-- 멤버십 혜택 섹션 -->
      <div class="benefits-section mb-5">
        <h2 class="text-center mb-5">멤버십 혜택</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-collection-play benefit-icon"></i>
              <h4>무제한 콘텐츠</h4>
              <p>수천 개의 영화, 드라마, 다큐멘터리를 언제 어디서나 무제한으로 시청하세요.</p>
            </div>
          </div>
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-star benefit-icon"></i>
              <h4>독점 콘텐츠</h4>
              <p>멤버십 회원만을 위한 특별 제작 콘텐츠와 선공개 작품을 만나보세요.</p>
            </div>
          </div>
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-download benefit-icon"></i>
              <h4>다운로드 지원</h4>
              <p>좋아하는 콘텐츠를 다운로드하여 오프라인에서도 시청할 수 있습니다.</p>
            </div>
          </div>
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-device-hdd benefit-icon"></i>
              <h4>멀티 디바이스</h4>
              <p>TV, 컴퓨터, 태블릿, 스마트폰 등 다양한 기기에서 시청할 수 있습니다.</p>
            </div>
          </div>
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-people benefit-icon"></i>
              <h4>프로필 공유</h4>
              <p>가족 구성원을 위한 개별 프로필을 만들어 맞춤형 경험을 제공합니다.</p>
            </div>
          </div>
          <div class="col">
            <div class="benefit-card text-center">
              <i class="bi bi-badge-hd benefit-icon"></i>
              <h4>고화질 스트리밍</h4>
              <p>최대 4K UHD 및 HDR 화질로 생생한 영상을 즐기세요.</p>
            </div>
          </div>
        </div>
      </div>

      <!-- 멤버십 플랜 섹션 -->
      <div class="membership-plans mb-5">
        <h2 class="text-center mb-5">멤버십 플랜</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
          <div class="col">
            <div class="membership-card">
              <h3>베이직</h3>
              <div class="price-container mt-4 mb-4">
                <span class="price">₩9,500</span>
                <span class="period">/월</span>
              </div>
              <ul class="feature-list">
                <li><i class="bi bi-check-circle-fill"></i> HD 화질 (720p)</li>
                <li><i class="bi bi-check-circle-fill"></i> 1개 디바이스 동시 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                  프로그램</li>
                <li><i class="bi bi-check-circle-fill"></i> 모바일 기기에서 시청</li>
                <li class="disabled"><i class="bi bi-x-circle-fill"></i> 광고 없는
                  시청</li>
                <li class="disabled"><i class="bi bi-x-circle-fill"></i> 다운로드
                  기능</li>
                <li class="disabled"><i class="bi bi-x-circle-fill"></i> 독점 콘텐츠
                  접근</li>
              </ul>
            </div>
          </div>
          <div class="col">
            <div class="membership-card popular">
              <span class="popular-badge">인기</span>
              <h3>스탠다드</h3>
              <div class="price-container mt-4 mb-4">
                <span class="price">₩13,500</span>
                <span class="period">/월</span>
              </div>
              <ul class="feature-list">
                <li><i class="bi bi-check-circle-fill"></i> Full HD 화질
                  (1080p)</li>
                <li><i class="bi bi-check-circle-fill"></i> 2개 디바이스 동시 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                  프로그램</li>
                <li><i class="bi bi-check-circle-fill"></i> 모든 기기에서 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 광고 없는 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 다운로드 기능</li>
                <li class="disabled"><i class="bi bi-x-circle-fill"></i> 독점 콘텐츠
                  접근</li>
              </ul>
            </div>
          </div>
          <div class="col">
            <div class="membership-card">
              <h3>프리미엄</h3>
              <div class="price-container mt-4 mb-4">
                <span class="price">₩17,000</span>
                <span class="period">/월</span>
              </div>
              <ul class="feature-list">
                <li><i class="bi bi-check-circle-fill"></i> 4K UHD + HDR 화질</li>
                <li><i class="bi bi-check-circle-fill"></i> 4개 디바이스 동시 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 무제한 영화 및 TV
                  프로그램</li>
                <li><i class="bi bi-check-circle-fill"></i> 모든 기기에서 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 광고 없는 시청</li>
                <li><i class="bi bi-check-circle-fill"></i> 다운로드 기능</li>
                <li><i class="bi bi-check-circle-fill"></i> 독점 콘텐츠 접근</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- 플랜 비교 테이블 -->
      <div class="comparison-section mb-5">
        <h2 class="text-center mb-5">플랜 비교</h2>
        <div class="table-responsive">
          <table class="comparison-table">
            <thead>
              <tr>
                <th>기능</th>
                <th>베이직</th>
                <th class="highlight">스탠다드</th>
                <th>프리미엄</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>월 구독료</td>
                <td>₩9,500</td>
                <td>₩13,500</td>
                <td>₩17,000</td>
              </tr>
              <tr>
                <td>화질</td>
                <td>HD (720p)</td>
                <td>Full HD (1080p)</td>
                <td>4K UHD + HDR</td>
              </tr>
              <tr>
                <td>동시 시청</td>
                <td>1 디바이스</td>
                <td>2 디바이스</td>
                <td>4 디바이스</td>
              </tr>
              <tr>
                <td>광고 없는 시청</td>
                <td><i class="bi bi-x-lg x-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
              </tr>
              <tr>
                <td>다운로드 기능</td>
                <td><i class="bi bi-x-lg x-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
              </tr>
              <tr>
                <td>독점 콘텐츠</td>
                <td><i class="bi bi-x-lg x-icon"></i></td>
                <td><i class="bi bi-x-lg x-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
              </tr>
              <tr>
                <td>모바일 시청</td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
              </tr>
              <tr>
                <td>TV 시청</td>
                <td><i class="bi bi-x-lg x-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
                <td><i class="bi bi-check-lg check-icon"></i></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- 사용자 후기 섹션 -->
      <div class="testimonials-section mb-5">
        <h2 class="text-center mb-5">회원 후기</h2>
        <div class="row row-cols-1 row-cols-md-2 g-4">
          <div class="col">
            <div class="testimonial-card">
              <div class="d-flex align-items-center">
                <img src="image/profile1.png" alt="User"
                  class="testimonial-avatar">
                <div>
                  <h5 class="mb-0">이동현</h5>
                  <p class="text-white mb-0">프리미엄 회원</p>
                </div>
              </div>
              <div class="testimonial-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
              </div>
              <p class="testimonial-quote">
                "프리미엄 멤버십으로 업그레이드한 후 4K 화질로 영화를 볼 수 있게 되어 정말 좋아요. 특히 독점 콘텐츠들이 정말 훌륭해서 매달 구독료가 아깝지 않습니다."
              </p>
            </div>
          </div>
          <div class="col">
            <div class="testimonial-card">
              <div class="d-flex align-items-center">
                <img src="/image/profile2.png" alt="User"
                  class="testimonial-avatar">
                <div>
                  <h5 class="mb-0">김지훈</h5>
                  <p class="text-white mb-0">스탠다드 회원</p>
                </div>
              </div>
              <div class="testimonial-rating">
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-half"></i>
              </div>
              <p class="testimonial-quote">
                "스탠다드 멤버십은 가성비가 정말 좋아요. 광고 없이 Full HD로 시청할 수 있고, 다운로드 기능이 있어서 출퇴근길에 지하철에서도 끊김 없이 볼 수 있어요."
              </p>
            </div>
          </div>

        </div>
      </div>

      <!-- FAQ 섹션 -->
      <div class="faq-section">
        <h2 class="text-center mb-5">자주 묻는 질문</h2>
        <div class="accordion" id="faqAccordion">
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
              <button class="accordion-button" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseOne"
                aria-expanded="true" aria-controls="collapseOne">
                멤버십은 언제든지 해지할 수 있나요?
              </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse show"
              aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                네, 언제든지 해지 가능합니다. 별도의 위약금이나 해지 수수료가 없으며, 해지 후에도 결제 주기 마지막 날까지는
                서비스를 이용하실 수 있습니다. 계정 설정에서 쉽게 해지하실 수 있으며, 나중에 다시 가입하시면 시청 기록과 프로필
                정보가 그대로 유지됩니다.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
              <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                aria-expanded="false" aria-controls="collapseTwo">
                멤버십 플랜은 언제든지 변경할 수 있나요?
              </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse"
              aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                네, 언제든지 멤버십 플랜을 업그레이드하거나 다운그레이드할 수 있습니다. 플랜 변경은 즉시 적용되며, 요금은 남은
                구독 기간에 따라 비례하여 조정됩니다. 계정 설정의 '멤버십 및 결제' 섹션에서 쉽게 변경하실 수 있습니다.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
              <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseThree"
                aria-expanded="false" aria-controls="collapseThree">
                여러 기기에서 동시에 시청할 수 있나요?
              </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse"
              aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                네, 멤버십 플랜에 따라 다른 기기에서 동시에 시청할 수 있습니다. 베이직 플랜은 1개, 스탠다드 플랜은 2개,
                프리미엄 플랜은 4개의 기기에서 동시 시청이 가능합니다. 각 프로필은 개별적인 시청 기록과 추천 목록을 유지합니다.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingFour">
              <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseFour"
                aria-expanded="false" aria-controls="collapseFour">
                다운로드한 콘텐츠는 얼마나 오래 볼 수 있나요?
              </button>
            </h2>
            <div id="collapseFour" class="accordion-collapse collapse"
              aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                다운로드한 콘텐츠는 일반적으로 30일 동안 유효합니다. 시청을 시작한 후에는 48시간 내에 시청을 완료해야 합니다.
                일부 콘텐츠는 라이선스 제한으로 인해 다운로드가 불가능하거나 다른 기간 제한이 있을 수 있습니다. 다운로드는
                스탠다드와 프리미엄 멤버십에서만 제공됩니다.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="headingFive">
              <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse" data-bs-target="#collapseFive"
                aria-expanded="false" aria-controls="collapseFive">
                독점 콘텐츠는 무엇인가요?
              </button>
            </h2>
            <div id="collapseFive" class="accordion-collapse collapse"
              aria-labelledby="headingFive" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                독점 콘텐츠는 우리 플랫폼에서만 볼 수 있는 오리지널 시리즈, 영화, 다큐멘터리입니다. 프리미엄 멤버십 회원은 모든
                독점 콘텐츠에 접근할 수 있으며, 일부 특별 콘텐츠는 조기 공개나 추가 보너스 콘텐츠를 제공합니다. 매달 새로운
                독점 콘텐츠가 추가됩니다.
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- CTA 섹션 -->
      <div class="cta-section text-center py-5">
        <h2 class="mb-4">지금 바로 시작하세요</h2>
        <p class="lead mb-4">첫 달 50% 할인 혜택을 놓치지 마세요.<br>언제든지 해지 가능합니다.</p>
        <button class="btn custom-btn btn-lg px-5 py-3 memberBtn"
          onclick="mainMove()">멤버십 가입하기</button>
      </div>
    </div>
  </body>
</html>
    
    <!-- 부트스트랩 JS -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
      crossorigin="anonymous"></script>
    <!-- 커스텀 JS -->
    <script src="js/memberShip.js"></script>
  </body>
</html>

