<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>

<jsp:include page='/header.jsp' />

<br>
<div class='col-md-12'>
	<div class='text-center'>
		<h3>Portfoli에 오신 것을 환영합니다.</h3>
		<del>손님은왕, 너님이왕</del>
		<br> <br>

		<form action='join' method='post'>
			<div class='form-group row w-50 p-3'
				style='float: none; margin: 0 auto;'>

				<input type='text' name='id' class='form-control' placeholder='아이디'><br>
				<div class='input-group mb-3'>
					<input type='email' class='form-control' placeholder='이메일'
						name='email' aria-label='email' aria-describedby='basic-addon2'>
					<div class='input-group-append'>
						<span class='input-group-text' id='basic-addon2'>확인</span>
					</div>
				</div>

				<input type='password' class='form-control' placeholder='비밀번호'
					name='password'> <input type='password'
					class='form-control' placeholder='비밀번호 확인' name='verifyingPassword'>
				<input type='text' class='form-control' placeholder='이름' name='name'>
				<input type='text' class='form-control' placeholder='휴대폰번호'
					name='tel'> <input type='number' class='form-control'
					placeholder='경력' name='career'>

				<p style='display: block; margin: 0 auto;'>
					🖊portfoli에서 보내는 이메일 및 SMS 수신에 동의하십니까?<br> 등록한 관심 채용 공고와 일정을
					받아보실 수 있습니다!
				</p>

				<div style='display: block; margin: 0 auto;'>
					<div class='form-check form-check-inline'>
						<input class='form-check-input' type='radio' name='emailYN'
							id='emailYN' value='1'> <label class='form-check-label'
							for='inlineRadio1'>이메일 수신동의</label>
					</div>
					<div class='form-check form-check-inline'>
						<input class='form-check-input' type='radio' name='emailYN'
							id='emailYN' value='2'> <label class='form-check-label'
							for='inlineRadio2'>이메일 수신거부</label>
					</div>
				</div>
				<div style='display: block; margin: 0 auto;'>
					<div class='form-check form-check-inline'>
						<input class='form-check-input' type='radio' name='smsYN'
							id='smsYN' value='1'> <label class='form-check-label'
							for='inlineRadio1'>SMS 수신동의</label>
					</div>
					<div class='form-check form-check-inline'>
						<input class='form-check-input' type='radio' name='smsYN'
							id='smsYN' value='2'> <label class='form-check-label'
							for='inlineRadio2'>SMS 수신거부</label>
					</div>
				</div>
				<button type='submit' class='btn btn-secondary mb-2 w-100'>가입하기</button>

			</div>
		</form>

	</div>
	<p style='text-align: center;'>다른 서비스로 가입하기</p>

</div>

<jsp:include page='/footer.jsp' />