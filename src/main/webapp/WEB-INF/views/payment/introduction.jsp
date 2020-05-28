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
        기업 로고가 노출되어 주목도가 높으며,<br>함께 제공되는 상품으로 다양한 영역에 동시 노출됩니다.
        </span>
        <br><br>
        <button type="button" class="btn btn-success mb-1" onClick="location.href='#'">서비스 이용하기</button>

      </div>
    </div>

    <div class="swiper-slide h-100 bg-white overlay-dark overlay-opacity-1 bg-cover" style="background:url('${pageContext.request.getContextPath()}/resources/assets/images/payment/intro2.png')">
      <div class="w--650" style="margin: 50px 200px;">
        <span class="m-0" style="font-size:2.5em;" data-swiper-parallax="-300">
        높은 효율을 보장하는<br> 인재추천 서비스
        </span><br><br>
        <span class="m-0" style="font-size:1.0em;" data-swiper-parallax="-400">
        등록한 공고를 기반으로<br> 기업에 걸맞는 인재를 열람 가능합니다.
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