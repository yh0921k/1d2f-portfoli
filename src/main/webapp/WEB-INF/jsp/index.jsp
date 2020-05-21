<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
  errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="header.jsp" />

<script>

  
</script>

  <div class="col-xs-12" style="padding-bottom: 5px; z-index: 1;">
    <div id="carouselExampleCaptions" class="carousel slide"
      data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0"
          class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="resources/assets/images/best_sigak_portfolio.jpg"
            class="d-block w-100" alt="BestPF1">
          <div class="carousel-caption d-none d-md-block">
            <h1>2020년 4월 Best 시각디자인 포트폴리오</h1>
            <h3>Minimal pencils on yellow</h3>
            <p>by Joanna Kosinska</p>
            <small>현재 분야별 포트폴리오 순위 1위(4↑) <br> 추천수: 101
            </small>
          </div>
        </div>
        <div class="carousel-item">
          <img src="resources/assets/images/best_front_portfolio.jpg"
            class="d-block w-100" alt="BestPF2">
          <div class="carousel-caption d-none d-md-block">
            <h1>2020년 4월 Best 백엔드/프론트엔드 포트폴리오</h1>
            <h3>Svelte application</h3>
            <p>by Ferenc Almasi</p>
            <small>현재 분야별 포트폴리오 순위 1위(new!) <br> 추천수: 43
            </small>
          </div>
        </div>
        <div class="carousel-item">
          <img src="resources/assets/images/best_video_portfolio.jpg"
            class="d-block w-100" alt="BestPF3">
          <div class="carousel-caption d-none d-md-block">
            <h1>2020년 4월 Best 영상디자인 포트폴리오</h1>
            <h3>Next stop is...</h3>
            <p>by Joshua Rawson-Harris</p>
            <small>현재 분야별 포트폴리오 순위 1위(3↑) <br> 추천수: 58
            </small>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleCaptions"
        role="button" data-slide="prev"> <span
        class="carousel-control-prev-icon" aria-hidden="true"></span> <span
        class="sr-only">Previous</span>
      </a> <a class="carousel-control-next" href="#carouselExampleCaptions"
        role="button" data-slide="next"> <span
        class="carousel-control-next-icon" aria-hidden="true"></span> <span
        class="sr-only">Next</span>
      </a>
    </div>
  </div>
  
  <div class="col-xs-12" style="padding-bottom: 5px;">
    <div id="carouselExampleIndicators" class="carousel slide"
      data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0"
          class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="resources/assets/images/banner1.jpg"
            class="d-block w-100" alt="banner1">
        </div>
        <div class="carousel-item">
          <img src="resources/assets/images/banner2.jpg"
            class="d-block w-100" alt="banner2">
        </div>
        <div class="carousel-item">
          <img src="resources/assets/images/banner3.jpg"
            class="d-block w-100" alt="banner3">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators"
        role="button" data-slide="prev"> <span
        class="carousel-control-prev-icon" aria-hidden="true"></span> <span
        class="sr-only">Previous</span>
      </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
        role="button" data-slide="next"> <span
        class="carousel-control-next-icon" aria-hidden="true"></span> <span
        class="sr-only">Next</span>
      </a>
    </div>
  </div>

  <!--  <div class="row" style="margin: 5px;">
            <div class="col-md-4">
                <h3>백엔드/프론트엔드</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">java</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">nodejs</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                     <button type="button" class="btn-small">Python</button>
                    </a>
                  </div>
            </div>
            <div class="col-md-4">
                <h3>시각디자인</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">그래픽디자인</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">포토샵</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                      <button type="button" class="btn-small">레이아웃</button>
                    </a>
                  </div>
            </div>
            <div class="col-md-4">
                <h3>영상디자인</h3>
                <hr>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">윤현정의 포트폴리오</h5>
                        <small>2 minutes ago</small>
                      </div>
                      <p class="mb-2">http://kondaeng.com/</p>
                      <button type="button" class="btn-small">광고디자인</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">차상미 포트폴리오</h5>
                        <small class="text-muted">1 hours ago</small>
                      </div>
                      <p class="mb-2">http://joohybedy.com/sangmi</p>
                      <button type="button" class="btn-small">CG</button>
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-2">Ryanscherf</h5>
                        <small class="text-muted">1 days ago</small>
                      </div>
                      <p class="mb-2">https://ryanscherf.com/</p>
                      <button type="button" class="btn-small">프리미어</button>
                    </a>
                  </div>
            </div>
        </div>
        -->


  <jsp:include page="footer.jsp" />