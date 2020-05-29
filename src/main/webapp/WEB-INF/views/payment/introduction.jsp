<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="swiper-container swiper-preloader swiper-btn-group swiper-btn-group-end text-white" 
  data-swiper='{
    "slidesPerView": 1,
    "spaceBetween": 0,
    "autoplay": false,
    "loop": true,
    "pagination": { "type": "bullets" }
  }'>

  <div class="swiper-wrapper h--400">
    <div class="swiper-slide h-100 bg-white overlay-dark overlay-opacity-1 bg-cover" style="background:url('${pageContext.request.getContextPath()}/resources/assets/images/payment/intro.png')">
      <div class="w--650" style="margin: 50px 200px;">
        <span class="m-0" style="font-size:2.5em;" data-swiper-parallax="-300">
          효과적으로 기업을 알릴 수 있는<br> 광고 서비스
        </span>
          <br><br>
        <span class="m-0" style="font-size:1.0em;" data-swiper-parallax="-400">
        기업 로고가 노출되어 주목도가 높으며,<br> 다양한 영역에 동시 노출됩니다.
        </span>
        <br><br>
        <button type="button" class="btn btn-success mb-1" onClick="location.href='/portfoli/app/payment/order'">서비스 이용하기</button>

      </div>
    </div>

    <div class="swiper-slide h-100 bg-white overlay-dark overlay-opacity-1 bg-cover" style="background:url('${pageContext.request.getContextPath()}/resources/assets/images/payment/intro2.png')">
      <div class="w--650" style="margin: 50px 200px;">
        <span class="m-0" style="font-size:2.5em;" data-swiper-parallax="-300">
        높은 효율을 보장하는<br> 인재추천 서비스
        </span><br><br>
        <span class="m-0" style="font-size:1.0em;" data-swiper-parallax="-400">
        등록한 공고를 기반으로<br> 기업에 적합한 인재를 열람 가능합니다.
        </span>
        <br><br>
        <button type="button" class="btn btn-success mb-1" onClick="location.href='#'">서비스 이용하기</button>
      </div>
    </div>
  </div>

  <!-- Add Arrows -->
  <div class="swiper-button-next swiper-button-white"></div>
  <div class="swiper-button-prev swiper-button-white"></div>

  <!-- Add Pagination -->
  <div class="swiper-pagination"></div>
</div>

        <!-- DOMAINS BAR -->
      <section class="pt-4 pb-0">
        <div class="container">
          <div class="row col-border text-center text-muted">
            <div class="col-6 col-md-3 mb-4 mb-5-xs">
              <h2 class="h6">
                <span class="font-weight-light">프리미엄</span> <span class="text-primary">채용 공고</span>
              </h2>
              <h3 class="h6 m-0">
                ￦2,000원 / 1일
              </h3>
            </div>
            <div class="col-6 col-md-3 mb-4 mb-5-xs">
              <h2 class="h6">
                <span class="font-weight-light">프리미엄</span> <span class="text-primary">채용 공고</span>
              </h2>
              <p class="h6 m-0">
                ￦10,000원 / 1주
              </p>
            </div>
            <div class="col-6 col-md-3 mb-4 mb-5-xs">
              <h2 class="h6">
                <span class="font-weight-light">공고 기반</span> <span class="text-primary">인재 추천</span>
              </h2>
              <h3 class="h6 m-0">
                ￦20,000원 / 20건
              </h3>
            </div>
            <div class="col-6 col-md-3 mb-4 mb-5-xs">
              <h2 class="h6">
                <span class="font-weight-light">공고 기반</span> <span class="text-primary">인재 추천</span>
              </h2>
              <p class="h6 m-0">
                ￦50,000원 / 50건
              </p>
            </div>
          </div>
        </div>
      </section>
      <!-- /DOMAINS BAR -->
      <br><br><br>
      
      <div class="row" style="margin-left: 200px;">
  <div class="col-3">
    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
      <a class="nav-link active" id="v-pills-a-tab" data-toggle="pill" href="#v-pills-a" role="tab" aria-controls="v-pills-home" aria-selected="true">프리미엄 채용 공고</a>
      <a class="nav-link" id="v-pills-b-tab" data-toggle="pill" href="#v-pills-b" role="tab" aria-controls="v-pills-profile" aria-selected="false">인재 추천</a>
      <a class="nav-link" id="v-pills-c-tab" data-toggle="pill" href="#v-pills-c" role="tab" aria-controls="v-pills-profile" aria-selected="false">배너 광고</a>
    </div>
  </div>

  <div class="col-9">
    <div class="tab-content" id="v-pills-tabContent">
      <div class="tab-pane fade show active" id="v-pills-a" role="tabpanel" aria-labelledby="v-pills-a-tab">
          <div style="min-height: 500px;">
          <span class="text-muted">
          채용공고를 이용하면 차별화된 위치에 다양한 디자인 효과가 적용되어 노출되기 때문에 <br>
          구직자에게 채용공고를 더 효과적으로 노출시킬 수 있습니다. <br><br><br>
          등록된 공고
          </span>
          <form action='order' method='post' id='order'>
          <input name="product" type="hidden" value="">
          <input name="price" type="hidden" value="">
          <div class="form-label-group mb-3">
            <input name="title" id="input_jobPosting" type="text" class="form-control input-suggest" value="" 
              placeholder="JobPosting" 
              data-input-suggest-mode="text" 
              data-input-suggest-name="title" 
              data-input-suggest-ajax-url="jobPostingList" 
              data-input-suggest-ajax-method="GET" 
              data-input-suggest-ajax-limit="20">
            <label for="input_jobPosting">공고 목록</label>
          </div>
          <span class="text-muted">기간 선택하기</span>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" value="1" id="customRadioInline1" name="term"
                class="custom-control-input" checked> <label
                 class="custom-control-label" for="customRadioInline1"><span class="text-muted">1일</span></label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
              <input type="radio" value="7" id="customRadioInline2" name="term"
                class="custom-control-input"> <label
                class="custom-control-label" for="customRadioInline2"><span class="text-muted">1주일</span></label>
            </div>
            <br>
          <span class="text-muted">시작일</span>
          <input type="text" name="startDate" class="form-control datepicker" 
            data-today-highlight="true" 
            data-layout-rounded="false" 
            data-title="Smarty Datepicker" 
            data-show-weeks="true" 
            data-today-highlight="true" 
            data-today-btn="true" 
            data-clear-btn="false" 
            data-autoclose="true" 
            data-date-start="today" 
            data-format="YYYY/MM/DD"
            data-quick-locale='{
              "days": ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
              "daysShort": ["일", "월", "화", "수", "목", "금", "토"],
              "daysMin": ["일", "월", "화", "수", "목", "금", "토"],
              "months": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              "monthsShort": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              "today": "오늘 날짜 선택",
              "clear": "초기화",
              "titleFormat": "yyyy MM"}'>
          <input name="endDate" type="hidden" value="">
          <br>
          <div style="display: none;" id="selectItem">
          <span class="text-muted">선택한 상품</span>
          <table class="table m-0">
    <thead>
      <tr>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 min-w-300">상품명</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--200">가격</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--120 text-center">기간</th>
        <th class="bb-0 text-gray-500 font-weight-normal fs--14 w--60 text-align-end"> </th>
      </tr>
    </thead>

    <tbody>
      <!-- product -->
      <tr>

        <!-- product name -->
        <td id="productName">
        </td>

        <!-- price -->
        <td id="price">
        </td>

        <!-- term -->
        <td id="term" class="text-muted text-center">
        </td>

      </tr>
      <!-- /product -->
    </tbody>
  </table>
  <br><br>
  <div class="text-align-end" style="margin-right:120px;">
  <button type="submit" class="btn btn-sm btn-primary mb-1">결제하기</button>
  </div>
  <br><br><br>
  </div>
  </form>
          </div>
      </div>
      <div class="tab-pane fade" id="v-pills-b" role="tabpanel" aria-labelledby="v-pills-b-tab">
        <div style="min-height: 500px;">
          <span class="text-muted">
          인재 추천 서비스란, 기업회원이 사람인에 등록한 채용정보를 기준으로 적합한 인재를 매칭해서 추천해주는 서비스입니다. <br>
          등록한 채용공고의 직종, 경력, 학력, 급여, 업종, 지역 등에 따라 가장 매칭률이 높은 인재를 기준으로 추천해 드립니다. <br>
          1. 무료로 등록한 채용공고에 유료 상품(실시간 노출상품, 로고/배너상품)을 구매 후 적용 <br>
          2. 무제한 동시게재 가능(진행중 공고) <br>
          3. 게재 후 즉시 추천공고 서비스에 적용
          </span>
        </div>
      </div>
      <div class="tab-pane fade" id="v-pills-c" role="tabpanel" aria-labelledby="v-pills-c-tab">
        <div style="min-height: 500px;">
          <span class="text-muted">
          배너형 전용 상품으로 상담을 통해 구매 및 홍보 가능한 상품입니다. <br>
          구좌 예약제로 노출(상품별 상이)되며 구좌 수 제한에 따라 롤링될 수 있습니다. <br>
          상품별 추가 노출 구좌를 제공하여 최적의 노출 효과를 제공해 드립니다. <br>
          <a href="/portfoli/app/qna/list" class="btn btn-sm btn-success mb-1"> 문의하기 </a>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
$('.datepicker').on('change', function() {
  $("#selectItem").show();
$('#productName').append('프리미엄 채용 공고<br> <span class="d-block text-muted fs--13">' + $('#input_jobPosting').val() + '</span>');
var endDate;
if ($('input[name=term]:checked').val() == 1) {
  $('#price').append('<span class="d-block text-success fs--15">' + "2,000" + '원</span>');
  var endDate = new Date($('.datepicker').val());
  endDate.setDate(endDate.getDate() + 1);
  endDate = getFormatDate(new Date(endDate));
  $('#term').append($('.datepicker').val() + " ~ " + endDate);
  $('input[name="endDate"]').val(endDate);
  
} else {
  $('#price').append('<span class="d-block text-success fs--15">' + "10,000" + '원</span>');
  var endDate = new Date($('.datepicker').val());
  endDate.setDate(endDate.getDate() + 7);
  endDate = getFormatDate(new Date(endDate))
  $('#term').append($('.datepicker').val() + " ~ " + endDate);
  $('input[name="endDate"]').val(endDate);
}
});

$('#order').submit(function() {
  $('input[name="product"]').prop('value', "프리미엄 채용 공고");
  if ($('input[name=term]:checked').val() == 1) {
  $('input[name="price"]').prop('value', '2000');
  } else {
    $('input[name="price"]').prop('value', '10000');
  }
});

function getFormatDate(date){
    var year = date.getFullYear();              // yyyy
    var month = (1 + date.getMonth());          // M
    month = month >= 10 ? month : '0' + month;  // month 두자리로 저장
    var day = date.getDate();                   // d
    day = day >= 10 ? day : '0' + day;          // day 두자리로 저장
    return  year + '/' + month + '/' + day;
}
</script>