<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div class="container-fluid">

		<div class="row">

			<!--------------------------------------- nav bar ----------------------------------------------->
			<jsp:include page="sidebar.jsp" />
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
									<span
										class="d-block text-dark text-truncate font-weight-medium">
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
				<!-- EMAIL ADDRESS -->

				<p>${loginUser.name}
					&nbsp;
					<c:if test="${loginUser.seekingFlag =='1'}">
						<a class="btn btn-ghost btn-dark btn-pill mb-1 btn-sm"
							href="/portfoli/app/member/updateFlag" role="button"
							style="font-size: 13px">구직중</a>
					</c:if>
					<c:if test="${loginUser.seekingFlag =='0'}">
						<a class="btn btn-outline-dark btn-pill mb-1 btn-sm"
							href="/portfoli/app/member/updateFlag" role="button"
							style="font-size: 13px">재직중</a>
					</c:if>
				</p>
				<p>${loginUser.email}</p>

			</div>
			<!-- /EMAIL ADDRESS -->

		</div>

	</div>

	</div>
	<!-- /portlet : body -->

	</div>
	<!-- /portlet -->

	</div>
	</div>
	</div>
	<!-------------------------------------------- /contents -------------------------------------------------->

	</div>
	</div>
<script>
	
</script>