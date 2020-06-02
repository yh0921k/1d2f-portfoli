<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">

	<div class="row">

		<!--------------------------------------- nav bar ----------------------------------------------->
		<div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">

				<!-- mobile only -->
				<button
					class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
					data-target="#nav_responsive"
					data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i
						class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span
						class="h5 py-2 m-0 float-start"> My Page </span>
				</button>

				<!-- desktop only -->
					<a href="/portfoli/app/member/companyMypage"
						style="cursor: pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				<!-- navigation -->
				<ul id="nav_responsive"
					class="nav flex-column d-none d-lg-block font-weight-bold ">

					<!-- 내 정보 -->

					<li class="nav-item font-weight-bold"><a class="nav-link"
						href="#"> <span class="group-icon"><i
								class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> <span
							class="px-2 d-inline-block active font-weight-bold"> 내 정보
						</span>
					</a> 
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link"
									href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
							</ul>
					</li>

					<!-- 쪽지함 -->
					<li class="nav-item font-weight-bold"><a class="nav-link"
						href="#"> <span class="group-icon"><i
								class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> <span
							class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
					</a>

						<ul class="nav flex-column px-2 font-weight-bold">
							<li class="nav-item"><a class="nav-link"
								href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
							<li class="nav-item"><a class="nav-link"
								href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
						</ul></li>

						<!-- 상품 구매 내역 -->
						<li class="nav-item"><a class="nav-link"
							href="/portfoli/app/payment/list"> <i
								class="fi fi-arrow-end m-0 fs--12"></i><span
								class="px-2 d-inline-block"> 상품 구매 내역 </span></a></li>

						<!-- 공고 관리 -->
						<li class="nav-item"><a class="nav-link "
							href="/portfoli/app/jobposting/mylist"> <i
								class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 공고 관리 </span></a></li>

				</ul>

			</nav>
			<!-- /CATEGORIES -->

		</div>
		<!--------------------------------------------- /nav bar ------------------------------------------------>

		<!-------------------------------------------- contents -------------------------------------------------->

		<div class="col-lg-8 mt--20">


			<form novalidate class="bs-validate d-block mb-7" method="post"
				action="/portfoli/app/member/updatePic"
				enctype="multipart/form-data">

				<div class="row gutters-sm mb-3">

					<div class="col-12 col-xl-6 mb-3">

						<!-- portlet -->
						<div class="portlet">

							<!-- portlet : header -->
							<div class="portlet-header">
								<span class="d-block text-dark text-truncate font-weight-medium">
									내 정보 </span>
							</div>
							<!-- /portlet : header -->


							<!-- portlet : body -->
							<div class="portlet-body">

								<div class="row h-100 d-flex align-items-center">

									<!-- avatar -->
									<div class="col-12 col-md-4 col-xl-4 text-center">

										<label
											class="w--120 h--120 rounded-circle text-center position-relative d-inline-block cursor-pointer border border-secondary border-dashed bg-white">

											<span
											class="z-index-2 js-file-input-avatar-circle-container d-block absolute-full z-index-1 hide-empty">
												<!-- avatar container -->
										</span> <!-- hidden input (out of viewport, or safari will ignore it) -->
											<!-- NOTE: data-file-preview-img-height="118 and <label> has .h--120 (120px). This is because we have a border - so we cut 2px (1px for each side) -->

											<input name="photoFile" type="file" data-file-ext="jpg, png"
											data-file-max-size-kb-per-file="1024"
											data-file-ext-err-msg="Allowed:"
											data-file-size-err-item-msg="1MB 이하의 파일만 업로드 가능합니다."
											data-file-size-err-total-msg="Total allowed size exceeded!"
											data-file-toast-position="bottom-center"
											data-file-preview-container=".js-file-input-avatar-circle-container"
											data-file-preview-show-info="false"
											data-file-preview-class="rounded-circle m-0 p-0 animate-bouncein"
											data-file-preview-img-height="118"
											data-file-btn-clear="a.js-file-upload-avatar-circle-remove"
											data-file-preview-img-cover="true"
											class="custom-file-input absolute-full"> <c:if
												test="${empty loginUser.photoFilePath}">
												<svg class="fill-gray-500 rounded-circle m-4 z-index-0"
													viewBox="0 0 60 60">
														<path
														d="M41.014,45.389l-9.553-4.776C30.56,40.162,30,39.256,30,38.248v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C35.084,27.47,36,26.075,36,24.5v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C30.854,3.688,27.521,2.5,23,2.5s-7.854,1.188-9.908,3.53c-2.368,2.701-2.148,5.976-2.092,6.525v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C1.801,46.924,0,49.958,0,53.262V57.5h46v-4.043C46,50.018,44.089,46.927,41.014,45.389z"></path>
														<path
														d="M55.467,46.526l-9.723-4.21c-0.23-0.115-0.485-0.396-0.704-0.771l6.525-0.005c0,0,0.377,0.037,0.962,0.037c1.073,0,2.638-0.122,4-0.707c0.817-0.352,1.425-1.047,1.669-1.907c0.246-0.868,0.09-1.787-0.426-2.523c-1.865-2.654-6.218-9.589-6.354-16.623c-0.003-0.121-0.397-12.083-12.21-12.18c-1.187,0.01-2.309,0.156-3.372,0.413c0.792,2.094,0.719,3.968,0.665,4.576v4.733c0.648,0.922,1,2.017,1,3.141v4c0,1.907-1.004,3.672-2.607,4.662c-0.748,2.022-1.738,3.911-2.949,5.621c-0.15,0.213-0.298,0.414-0.443,0.604v2.86c0,0.442,0.236,0.825,0.631,1.022l9.553,4.776c3.587,1.794,5.815,5.399,5.815,9.41V57.5H60v-3.697C60,50.711,58.282,47.933,55.467,46.526z"></path>
													</svg>
											</c:if> <c:if test="${not empty loginUser.photoFilePath}">
												<img class="rounded-circle img-thumbnail h--120 w--120"
													src='${pageContext.request.getContextPath()}/upload/member/${loginUser.photoFilePath}'>
												<br>
											</c:if>

										</label>
										<button class="btn btn-outline-dark btn-pill mb-1 btn-sm"
											data-toggle="tooltip" data-placement="bottom"
											style="font-size: 13px;"
											title="사진을 선택하지 않은 채 '보내기'를 누르시면 사진이 삭제됩니다.">보내기</button>
			</form>

		</div>
		<!-- /avatar -->

		<div class="col my-3">

			<p>${loginUser.name}</p>
			<p>${loginUser.email}</p>
			<p>${company.name}(${company.tel})</p>

		</div>

	</div>

</div>

</div>
<!-- /portlet : body -->

</div>
<!-- /portlet -->

<!-- 알림 -->
<div class="col-12 col-xl-6 mb-3">
  <div class="portlet">

    <div class="portlet-header">
      <span class="d-block text-dark text-truncate font-weight-medium">알림</span>
    </div>

    <div class="portlet-body">
      <div class="row h-100 d-flex align-items-center">
        <div class="col my-3">

          <c:if test="${not empty DeadlinePosting}">
            <h4>           
              <font style="color:orange;">공고 기간이 얼마 남지 않았습니다.</font>
            </h4>
          </c:if>

          <c:if test="${empty DeadlinePosting}">
            <p>알림이 존재하지 않습니다.</p>
          </c:if>

        </div>
      </div>
    </div>

  </div>
</div>
<!--  알림  -->

</div>
</div>
</div>
<!-------------------------------------------- /contents -------------------------------------------------->

</div>
</div>
