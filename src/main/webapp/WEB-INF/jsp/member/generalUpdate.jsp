<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<script>
function isSame() {
    var password = document.getElementById("password").value;
    var checkPassword = document.getElementById("checkPassword").value;

    if (password.length < 6 || password.length > 16) {
      password = null;
      checkPassword = null;
      document.getElementById("same").innerHTML = null;
      window.alert("비밀번호는 6글자 이상, 16글자 이하만 사용 가능합니다.");
    } else {
      if (password != "" && checkPassword != "") {
        if (password === checkPassword) {
          document.getElementById("same").innerHTML =
            "비밀번호가 일치합니다.";
          document.getElementById("same").style.color = "blue";
        } else {
          document.getElementById("same").innerHTML =
            "비밀번호가 일치하지 않습니다.";
          document.getElementById("same").style.color = "red";
        }
      }
    }
  }
  
</script>

<meta name="theme-color" content="#377dff">

<!-- PAGE TITLE -->
<section class="bg-light p--0 ">
	<div class="container py-4">
		<h1 class="h3">내 정보 수정하기</h1>
	</div>
</section>
<!-- /PAGE TITLE -->

<section class=" pt--20">

	<div class="container-fluid">

		<div class="row">

			<!--------------------------------------- nav bar ----------------------------------------------->

			<div class="col-lg-3 mb-5 h--600 border-right ml--20">

				<!-- CATEGORIES -->
				<nav class="nav-deep nav-deep-light mb-2 ">

					<!-- mobile only -->
					<button
						class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
						data-target="#nav_responsive"
						data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
						<span class="group-icon px-2 py-2 float-start"> <i
							class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
						</span> <span class="h5 py-2 m-0 float-start"> My Page </span>
					</button>

					<!-- desktop only -->
					<h3 class="h5 pt-3 pb-3 m-0 d-none d-lg-block">My Page</h3>


					<!-- navigation -->
					<ul id="nav_responsive"
						class="nav flex-column d-none d-lg-block font-weight-bold ">

						<li class="nav-item font-weight-bold active"><a
							class="nav-link" href=""> <span class="group-icon"> <i
									class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
							</span> <span class="px-2 d-inline-block font-weight-bold"> 내 정보
							</span>
						</a>

							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold"><a class="nav-link"
									href="#"> 내 프로필 수정하기 </a></li>
								<li class="nav-item font-weight-bold active"><a
									class="nav-link" href="/portfoli/app/member/generalUpdate">
										내 정보 수정하기 </a></li>
							</ul></li>

						<li class="nav-item font-weight-bold"><a class="nav-link"
							href="#"> <span class="group-icon"> <i
									class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i>
							</span> <span class="px-2 d-inline-block active font-weight-bold">
									쪽지함 </span>
						</a>

							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item"><a class="nav-link"
									href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
								<li class="nav-item"><a class="nav-link"
									href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
							</ul></li>


						<li class="nav-item"><a class="nav-link "
							href="account-orders.html"> <i
								class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 일정 관리 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link "
							href="account-favourites.html"> <i
								class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 포트폴리오 관리 </span>
						</a></li>

						<li class="nav-item"><a class="nav-link "
							href="account-settings.html"> <i
								class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 멤버쉽 </span>
						</a></li>


						<li class="nav-item"><a class="nav-link pt--200"
							href="account-settings.html"> <i
								class="fi fi-arrow-end m-0 fs--12"></i> <span
								class="px-2 d-inline-block"> 통계 </span>
						</a></li>


					</ul>

				</nav>
				<!-- /CATEGORIES -->

			</div>

			<!--------------------------------------------- /nav bar ------------------------------------------------>

			<!-------------------------------------------- contents -------------------------------------------------->

			<div class=" col-lg-8">
				<!-- FORM -->

				<div class="col-12 col-sm-12 col-md-12 col-lg-9">

					<!--
                
                Tab Navigation
                Last tab remembered using localstorage by sow.nav_deep.js plugin

              -->
					<ul class="nav nav-tabs">
						<li class="nav-item"><a
							class="nav-link nav-link-remember active" data-toggle="tab"
							href="#tab_account">계정</a></li>

						<li class="nav-item"><a class="nav-link nav-link-remember"
							data-toggle="tab" href="#tab_address">주소</a></li>
					</ul>



					<div class="tab-content">

						<!-- ACCOUNT TAB -->
						<div id="tab_account" class="tab-pane active">



							<!-- PERSONAL DETAIL -->
							<div class="p-4 shadow-xs border bt-0 mb-4 bg-white">
								<form method="post" action="updateDefaultInfo" novalidate
									class="bs-validate" enctype="multipart/form-data">

									<div class="row">

										<!-- avatar -->
										<div class="col-12 col-md-3 text-center">

											<label
												class="w--120 h--120 rounded-circle text-center position-relative d-inline-block cursor-pointer border border-secondary border-dashed bg-white">

												<!-- 
                              remove button 
                            --> <a href="#?action=remove_avatar"
												class="js-file-upload-avatar-ajax-circle-remove-preadded position-absolute bottom-0 mb--n15 w-100 z-index-3">
													<span
													class="d-inline-block btn btn-sm btn-pill bg-secondary text-white pt--4 pb--4 pl--10 pr--10"
													data-tooltip="tooltip" data-original-title="remove avatar">
														<i class="fi fi-close m-0"></i>
												</span>
											</a> <!-- 
                              preadded image 
                            --> <span
												class="z-index-2 js-file-input-avatar-ajax-circle-container-preadded d-block absolute-full z-index-1">
													<span
													style="background-image: url('demo.files/images/unsplash/team/thumb_330/michael-dam-mEZ3PoFGs_k-unsplash.jpg')"
													class="js-file-input-item d-inline-block position-relative overflow-hidden text-center rounded-circle m-0 p-0 animate-bouncein bg-cover w-100 h-100">
												</span>
											</span> <!-- 
                              upload field 
                            --> <input name="photoFile" type="file"
												data-file-ext="jpg, png"
												data-file-max-size-kb-per-file="5000"
												data-file-ext-err-msg="Allowed:"
												data-file-size-err-item-msg="File too large!"
												data-file-size-err-total-msg="Total allowed size exceeded!"
												data-file-toast-position="bottom-center"
												data-file-preview-container=".js-file-input-avatar-ajax-circle-container-preadded"
												data-file-preview-show-info="false"
												data-file-preview-class="rounded-circle m-0 p-0 animate-bouncein"
												data-file-preview-img-height="118"
												data-file-btn-clear="a.js-file-upload-avatar-ajax-circle-remove-preadded"
												data-file-preview-img-cover="true"
												class="custom-file-input absolute-full"
												value="${loginUser.photoFilePath}"> <!-- avatar : : always under image -->
												<c:if test="${empty loginUser.photoFilePath}">
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

										</div>
										<!-- /avatar -->


										<!-- detail -->
										<div class="col">

											<div class="row">

												<div class="col-12 col-sm-6 col-md-6">

													<div class="form-label-group mb-3">
														<input required placeholder="name" id="name" name="name"
															type="text" class="form-control" value=${member.name}>
														<label for="namee">이름</label>
													</div>

												</div>

												<div class="col-12 col-sm-6 col-md-6">

													<div class="form-label-group mb-3">
														<input required placeholder="id" id="id" name="id"
															type="text" class="form-control" value=${member.id}>
														<label for="id">아이디</label>
													</div>

												</div>



												<div class="col-12 col-sm-6 col-md-6">


													<div class="input-group-over">
														<div class="form-label-group mb-3">
															<input readonly placeholder="email" id="email"
																name="email" type="email" class="form-control"
																value=${member.email}> <label for="email">이메일</label>
														</div>

														<a id="email_edit_show" href="javascript:;"
															class="btn fs--13"
															onclick="jQuery('#account_email').attr('readonly', false); jQuery('#email_edit_show, #email_edit_info').addClass('hide'); jQuery('#email_edit_hide, #email_edit_info').removeClass('hide');jQuery('#account_email').val('').focus();">
															<i class="fi fi-pencil m-0"></i>
														</a> <a id="email_edit_hide" href="javascript:;"
															class="btn fs--12 hide"
															onclick="jQuery('#account_email').attr('readonly', true); jQuery('#email_edit_show, #email_edit_info').removeClass('hide'); jQuery('#email_edit_hide, #email_edit_info').addClass('hide'); jQuery('#account_email').val('john.doe@gmail.com');">
															<i class="fi fi-close m-0"></i>
														</a>

													</div>

													<div id="email_edit_info"
														class="mt-1 mb-4 fs--13 text-muted hide">인증 이메일을
														보냈습니다.</div>
													<!-- /EMAIL ADDRESS -->

												</div>


												<div class="col-12 col-sm-6 col-md-6">

													<div class="form-label-group mb-3">
														<input required placeholder="tel" id="tel" name="tel"
															type="text" class="form-control" value=${member.tel}>
														<label for="tel">연락처</label>
													</div>

												</div>

											</div>


										</div>
										<!-- detail -->

									</div>

									<!-- subscribe -->
									<div class="border-top pt-4 mt-4">
										<label class="form-checkbox form-checkbox-primary mb-0">
											<c:if test="${member.emailYN==0}">
												<input type="checkbox" name="emailYN" value="1">
												<i></i> 이메일 수신동의
										</c:if> <c:if test="${member.emailYN==1}">
												<input type="checkbox" name="emailYN"
													value="1"
													} checked>
												<i></i> 이메일 수신동의
                    </c:if>
										</label> <label class="form-checkbox form-checkbox-primary mb-0">
											<c:if test="${member.smsYN==0}">
												<input type="checkbox" name="smsYN" value="1">
												<i></i> SMS 수신동의
											</c:if> <c:if test="${member.smsYN==1}">
												<input type="checkbox" name="smsYN"
													value="1" checked>
												<i></i> SMS 수신동의
                      </c:if>
										</label>
									</div>

									<div class="pt-4 mt-1" align="right">

										<button type="submit" class="btn btn-primary">
											<i class="fi fi-check"></i> 수정하기
										</button>
								</form>
							</div>

						</div>
						<!-- /PERSONAL DETAIL -->



						<!-- PASSWORD -->
						<div class="p-4 shadow-xs rounded mb-4 bg-white">
							<a href="#user_edit_password"
								class="btn-toggle btn fs--14 btn-light collapsed"
								data-toggle="collapse" aria-expanded="false"
								onclick="jQuery('#user_password_current, #user_password_new').val('');">
								<span class="group-icon float-start"> <i
									class="fi fi-arrow-down"></i> <i class="fi fi-close"></i>
							</span> &nbsp; 비밀번호 변경
							</a>

							<div id="user_edit_password" class="collapse" style="">
								<form method="post" action="updatePassword">

									<div class="row mt-3">

										<div class="col-12 col-sm-6 col-md-6">

											<div class="input-group-over">
												<div class="form-label-group mb-3">
													<input placeholder="Current Password" id="currentPassword"
														name="currentPassword" type="password"
														class="form-control"> <label for="currentPassword">현재
														비밀번호</label>
												</div>

												<!-- `SOW : Form Advanced` plugin used -->
												<a href="#" class="btn fs--12 btn-password-type-toggle"
													data-target="#currentPassword"> <span
													class="group-icon"> <i class="fi fi-eye m-0"></i> <i
														class="fi fi-close m-0"></i>
												</span>
												</a>
											</div>

										</div>

										<div class="col-12 col-sm-6 col-md-6">

											<div class="input-group-over">
												<div class="form-label-group mb-3">
													<input placeholder="New Password" id="newPassword"
														name="newPassword" type="password" class="form-control">
													<label for="newPassword">새 비밀번호</label>
												</div>

												<!-- `SOW : Form Advanced` plugin used -->
												<a href="#" class="btn fs--12 btn-password-type-toggle"
													data-target="#newPassword"> <span class="group-icon">
														<i class="fi fi-eye m-0"></i> <i class="fi fi-close m-0"></i>
												</span>
												</a>
											</div>

										</div>
										<button type="submit" class="btn btn-primary ml-3">
											<i class="fi fi-check"></i> 비밀번호 변경하기
										</button>
								</form>

							</div>

						</div>

					</div>
					<!-- /PASSWORD -->



					<!-- DELETE ACCOUNT -->
					<div class="clearfix mt--60">
						<form method="post" action="delete">

							<div class="text-align-end">
								<a href="#account_deactivate_confirm"
									class="text-gray-500 text-decoration-none font-light collapsed"
									data-toggle="collapse" aria-expanded="false"
									onclick="jQuery('#user_password_current, #user_password_new').val('');">
									<span class="group-icon fs--13"> <i
										class="fi fi-arrow-down"></i> <i class="fi fi-close"></i>
								</span> <span class="pl-2 pr-2"> 회원 탈퇴하기 </span>
								</a>
							</div>


							<div id="account_deactivate_confirm" class="collapse" style="">

								<div class="alert b-0 bg-danger-soft mt-3 mb-5 p-4 clearfix">

									<p>주의: 한 번 지워진 계정은 복구할 수 없습니다. 다시 한 번 생각해주세요.</p>

									<p class="m-0 fs--13">탈퇴한 계정은 30일 이후에 영구적으로 삭제됩니다. 30일 이전에는
										복구할 수 있습니다.</p>

									<i
										class="arrow arrow-lg arrow-bottom arrow-center border-danger-soft"></i>
								</div>

								<div class="row mb--60">

									<div class="col-12 offset-lg-2 col-lg-7">

										<div class="input-group-over">
											<div class="form-label-group mb-1">
												<input placeholder="Current Password"
													id="account_del_current_password"
													name="account_current_password" type="password"
													class="form-control"> <label
													for="account_del_current_password">현재 비밀번호</label>
											</div>

											<!-- `SOW : Form Advanced` plugin used -->
											<a href="#" class="btn fs--12 btn-password-type-toggle"
												data-target="#account_del_current_password"> <span
												class="group-icon"> <i class="fi fi-eye m-0"></i> <i
													class="fi fi-close m-0"></i>
											</span>
											</a>
										</div>

										<div class="mt--7 fs--13 text-muted mb--30 ">회원 탈퇴를 하기
											위해 비밀번호를 한 번 더 입력해주세요.</div>
										<button type="submit" class="btn btn-danger btn-block">
											<i class="fi fi-check"></i> 탈퇴하기
										</button>
						</form>

					</div>


				</div>

			</div>

		</div>
		<!-- /DELETE ACCOUNT -->






	</div>


	<!-- ADDRESSES TAB -->
	<div id="tab_address" class="tab-pane border bt-0 p-4 shadow-xs">





		<!-- address -->
		<div class="d-block shadow-xs rounded p-4 mb-2">
			<div class="row">

				<div class="col">
					<form method="post" action="updateAddress">

						<div class="col-12 col-sm-6 col-md-6">
							<div class="form-label-group mb-3">
								<input placeholder="postNumber" id="postNumber"
									name="postNumber" type="text" class="form-control"
									value=${member.postNumber}> <label for="postNumber">우편번호</label>
							</div>
						</div>
						<div class="form-label-group mb-3 ml-3">
							<input placeholder="basicAddress" id="basicAddress"
								name="basicAddress" type="text" class="form-control"
								value="${member.basicAddress}"> <label
								for="basicAddress">주소</label>
						</div>

						<div class="form-label-group mb-3 ml-3">
							<input placeholder="detailAddress" id="detailAddress"
								name="detailAddress" type="text" class="form-control"
								value="${member.detailAddress}"> <label
								for="detailAddress">상세주소</label>
						</div>


						<div class="border-top pt-4 mt-1">

							<button type="submit" class="btn btn-primary">
								<i class="fi fi-check"></i> 수정하기
							</button>
					</form>
				</div>

			</div>
		</div>
		<!-- /address -->

	</div>

	</div>

	</div>

	</div>

	</div>
	<!-------------------------------------------- /contents -------------------------------------------------->

	</div>
	</div>
</section>




<jsp:include page="../footer.jsp" />
