<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="theme-color" content="#377dff">

<!-- /PAGE TITLE -->
<div class="container-fluid">
	<div class="row">

			<div class="col-lg-3 mb-5 h--600 border-right ml--20 mt--20">

			<!-- CATEGORIES -->
			<nav class="nav-deep nav-deep-light mb-2">

				<!-- mobile only -->
				<button class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none" data-target="#nav_responsive" data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
					<span class="group-icon px-2 py-2 float-start"> <i class="fi fi-bars-2"></i> <i class="fi fi-close"></i></span> <span class="h5 py-2 m-0 float-start"> My Page </span>
				</button>

				<!-- desktop only -->
					<a href="/portfoli/app/member/companyMypage" style="cursor:pointer; text-decoration: none;"><h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3 text-dark">My Page</h3></a>
				<!-- navigation -->
				<ul id="nav_responsive" class="nav flex-column d-none d-lg-block font-weight-bold ">

					<!-- 내 정보 -->
					
					<li class="nav-item font-weight-bold active">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i> <i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 내 정보 </span>
        	</a>
					
							<ul class="nav flex-column px-2 font-weight-bold">
								<li class="nav-item font-weight-bold active"><a class="nav-link" href="/portfoli/app/member/companyUpdate"> 내 정보 수정하기 </a></li>
							</ul>
						</li>

					<!-- 쪽지함 -->
					<li class="nav-item font-weight-bold">
					<a class="nav-link" href="#"> 
					<span class="group-icon"><i class="fi fi-arrow-end"></i><i class="fi fi-arrow-down"></i></span> 
					<span class="px-2 d-inline-block active font-weight-bold"> 쪽지함 </span>
					</a>

						<ul class="nav flex-column px-2 font-weight-bold">
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/inbox"> 받은 쪽지함 </a></li>
							<li class="nav-item"><a class="nav-link" href="/portfoli/app/message/sent"> 보낸 쪽지함 </a></li>
						</ul>
						</li>
						
						<!-- 상품 구매 내역 -->
						<li class="nav-item"><a class="nav-link" href="/portfoli/app/payment/list"> <i class="fi fi-arrow-end m-0 fs--12"></i><span class="px-2 d-inline-block"> 상품 구매 내역 </span></a></li>

						<!-- 공고 관리 -->
						<li class="nav-item"><a class="nav-link " href="/portfoli/app/jobposting/mylist"> <i class="fi fi-arrow-end m-0 fs--12"></i> <span class="px-2 d-inline-block"> 공고 관리 </span></a></li>

				</ul>

			</nav>
			<!-- /CATEGORIES -->

		</div>

		<div class="col-lg-8 mt--20">
			<!-- FORM -->
			<div class="col-14 col-sm-14 col-md-14 col-lg-11">

				<!-- PERSONAL DETAIL -->
				<div class="p-4 shadow-xs border mb-4 bg-white">
					<form method="post" action="updateDefaultInfo" novalidate class="bs-validate" enctype="multipart/form-data">

						<div class="row">

							<!-- avatar -->
							<div class="col-12 col-md-3 text-center">

								<label class="w--120 h--120 rounded-circle text-center position-relative d-inline-block cursor-pointer border border-secondary border-dashed bg-white">
									<span class="z-index-2 js-file-input-avatar-ajax-circle-container-preadded d-block absolute-full z-index-1">
										<span style="background-image: url('demo.files/images/unsplash/team/thumb_330/michael-dam-mEZ3PoFGs_k-unsplash.jpg')" class="js-file-input-item d-inline-block position-relative overflow-hidden text-center rounded-circle m-0 p-0 animate-bouncein bg-cover w-100 h-100"></span>
								</span> 
								<input name="photoFile" type="file" data-file-ext="jpg, png"
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
									value="${loginUser.photoFilePath}">
									<c:if test="${empty loginUser.photoFilePath}">
										<svg class="fill-gray-500 rounded-circle m-4 z-index-0" viewBox="0 0 60 60">
													<path d="M41.014,45.389l-9.553-4.776C30.56,40.162,30,39.256,30,38.248v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C35.084,27.47,36,26.075,36,24.5v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C30.854,3.688,27.521,2.5,23,2.5s-7.854,1.188-9.908,3.53c-2.368,2.701-2.148,5.976-2.092,6.525v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C1.801,46.924,0,49.958,0,53.262V57.5h46v-4.043C46,50.018,44.089,46.927,41.014,45.389z">
													</path>
													<path d="M55.467,46.526l-9.723-4.21c-0.23-0.115-0.485-0.396-0.704-0.771l6.525-0.005c0,0,0.377,0.037,0.962,0.037c1.073,0,2.638-0.122,4-0.707c0.817-0.352,1.425-1.047,1.669-1.907c0.246-0.868,0.09-1.787-0.426-2.523c-1.865-2.654-6.218-9.589-6.354-16.623c-0.003-0.121-0.397-12.083-12.21-12.18c-1.187,0.01-2.309,0.156-3.372,0.413c0.792,2.094,0.719,3.968,0.665,4.576v4.733c0.648,0.922,1,2.017,1,3.141v4c0,1.907-1.004,3.672-2.607,4.662c-0.748,2.022-1.738,3.911-2.949,5.621c-0.15,0.213-0.298,0.414-0.443,0.604v2.86c0,0.442,0.236,0.825,0.631,1.022l9.553,4.776c3.587,1.794,5.815,5.399,5.815,9.41V57.5H60v-3.697C60,50.711,58.282,47.933,55.467,46.526z">
													</path>
												</svg>
									</c:if> 
									<c:if test="${not empty loginUser.photoFilePath}">
										<img class="rounded-circle img-thumbnail h--120 w--120" src='${pageContext.request.getContextPath()}/upload/member/${loginUser.photoFilePath}'>
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
											<input required placeholder="name" id="name" name="name" type="text" class="form-control" value=${member.name}>
											<label for="namee">이름</label>
										</div>

									</div>

									<div class="col-12 col-sm-6 col-md-6">

										<div class="form-label-group mb-3">
											<input required placeholder="id" id="id" name="id" type="text" class="form-control" value=${member.id}>
											<label for="id">아이디</label>
										</div>

									</div>
									<div class="col-12 col-sm-6 col-md-6">
										<div class="form-label-group mb-3">
											<input readonly placeholder="email" id="email" name="email" type="email" class="form-control" value=${member.email}>
											<label for="email">이메일</label>
										</div>

										<!-- /EMAIL ADDRESS -->

									</div>


									<div class="col-12 col-sm-6 col-md-6">

										<div class="form-label-group mb-3">
											<input placeholder="tel" id="tel" name="tel" type="text" class="form-control" value=${member.tel}> <label for="tel">연락처</label>
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
									<input type="checkbox" name="emailYN" value="1"><i></i> 이메일 수신동의
								</c:if> 
								<c:if test="${member.emailYN==1}">
									<input type="checkbox" name="emailYN" value="1" } checked><i></i> 이메일 수신동의
								</c:if>
							</label> 
							<label class="form-checkbox form-checkbox-primary mb-0">
								<c:if test="${member.smsYN==0}">
									<input type="checkbox" name="smsYN" value="1"><i></i> SMS 수신동의
								</c:if> 
								<c:if test="${member.smsYN==1}">
									<input type="checkbox" name="smsYN" value="1" checked><i></i> SMS 수신동의
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

				<a href="#user_edit_password" class="btn-toggle btn fs--14 btn-light collapsed" data-toggle="collapse" aria-expanded="false" onclick=""> <span class="group-icon float-start"> <i class="fi fi-arrow-down"></i>
						<i class="fi fi-close"></i></span> &nbsp; 비밀번호 변경
				</a>

				<div id="user_edit_password" class="collapse" style="">
					<form method="post" action="updatePassword">

						<div class="row mt-3">

							<div class="col-12 col-sm-6 col-md-6">
								<div class="input-group-over">
									<div class="form-label-group mb-3">
										<input required placeholder="password" id="password"
											name="password" type="password" class="form-control">
										<label for="password">현재 비밀번호</label>
									</div>

									<a href="#" class="btn fs--12 btn-password-type-toggle"
										data-target="#currentPassword"> <span class="group-icon">
											<i class="fi fi-eye m-0"></i> <i class="fi fi-close m-0"></i>
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

									<a href="#" class="btn fs--12 btn-password-type-toggle"
										data-target="#newPassword"> 
										<span class="group-icon"><i class="fi fi-eye m-0"></i> <i class="fi fi-close m-0"></i></span>
									</a>
								</div>
							</div>
							<button type="submit" class="btn btn-primary ml-3"><i class="fi fi-check"></i> 비밀번호 변경하기</button>
					</form>

				</div>

			</div>

			<!-- /PASSWORD -->


		</div>
<div class="clearfix mt--60">
					<form method="post" action="delete" onsubmit="return check();">

						<div class="text-align-end">

							<a href="#account_deactivate_confirm" class="text-gray-500 text-decoration-none font-light collapsed"
								data-toggle="collapse" aria-expanded="false" onclick=""> <span class="group-icon fs--13"> <i
										class="fi fi-arrow-down"></i>
									<i class="fi fi-close"></i>
								</span> <span class="pl-2 pr-2"> 회원 탈퇴하기 </span>
							</a>
						</div>

						<div id="account_deactivate_confirm" class="collapse" style="">

							<div class="alert b-0 bg-primary-soft mt-3 mb-5 p-4 clearfix">
								<label class="form-switch form-switch-pill form-switch-primary d-block">
									<input type="checkbox" value="0" id="requiredDelete1"><i data-on="OK" data-off="no"></i> <span
										class="h6">Portfoli아이디
										이용복구 불가 안내</span>
									<p>
										<br>- 회원탈퇴 진행 시, 기존 아이디를 재사용하거나 복구할 수 없습니다. <br> 신중히
										선택하신 후 결정해 주세요.
									</p>
								</label>
							</div>

							<div class="alert b-0 bg-primary-soft mt-3 mb-5 p-4 clearfix">
								<label class="form-switch form-switch-pill form-switch-primary d-block">
									<input type="checkbox" value="0" id="requiredDelete2">
									<i data-on="OK" data-off="no"></i> <span class="h6">개인
										정보 및 서비스 이용기록 삭제 안내</span>
									<p>
										<br>- 결제내역, 채용정보, 쪽지 등 모든 서비스 이용기록이 삭제되며, 삭제된 데이터는 복구되지
										않습니다. <br> 필요한 데이터는 미리 백업해 주세요.
									</p>
								</label>
							</div>

							<div class="alert b-0 bg-primary-soft mt-3 mb-5 p-4 clearfix">
								<label class="form-switch form-switch-pill form-switch-primary d-block">
									<input type="checkbox" value="0" id="requiredDelete3">
									<i data-on="OK" data-off="no"></i> <span class="h6">등록한
										게시글 삭제 안내</span>
									<p>
										<br>- 포트폴리오, QNA 등 모든 게시글이 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
										필요한 데이터는 미리 백업해 주세요.
									</p>


								</label>

							</div>

							<div class="alert b-0 bg-danger-soft mt-3 mb-5 p-4 clearfix">

								<p class="text-center">주의: 한 번 지워진 계정은 복구할 수 없습니다. 다시 한 번 생각해주세요.</p>


								<i class="arrow arrow-lg arrow-bottom arrow-center border-danger-soft"></i>
							</div>
							<div class="row mb--60">

								<div class="col-12 offset-lg-2 col-lg-7">


									<div class="form-label-group mb-1">
										<input required placeholder="currentPassword" id="currentPassword" name="currentPassword"
											type="password" class="form-control"> <label for="currentPassword">현재 비밀번호</label>

										<div class="mt--7 fs--13 text-muted mb--30 ">회원 탈퇴를 하기 위해 비밀번호를 한 번 더 입력해주세요.</div>

										<input type="submit" class="btn btn-danger btn-block" value="탈퇴하기">
					</form>

				</div>


			</div>

		</div>

	</div>
	</div>
	</div>

</div>
<!-------------------------------------------- /contents -------------------------------------------------->

</div>
</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
//회원 탈퇴
function check() {

	var delete1 = document.getElementById('requiredDelete1').checked;
	var delete2 = document.getElementById('requiredDelete2').checked;
	var delete3 = document.getElementById('requiredDelete3').checked;
	if (delete1 && delete2 && delete3) {
		return true;
	} else {
		alert("탈퇴 안내에 모두 동의해 주세요.");
		return false;
	}
}
</script>