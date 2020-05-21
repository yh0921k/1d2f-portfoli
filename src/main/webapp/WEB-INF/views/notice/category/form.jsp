<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

    <%--상단 바부분 : 필요없어서 뺌 
			<!-- PAGE TITLE -->
			<section class="bg-white">
				<div class="container py-1">

					<h1 class="h2">
						고객센터
					</h1>

					<nav aria-label="breadcrumb">
						<ol class="breadcrumb fs--14">
							<li class="breadcrumb-item"><a href="#!">portfoli</a></li>
							<li class="breadcrumb-item active" aria-current="page">고객센터</li>
						</ol>
					</nav>

				</div>
			</section>
			<!-- /PAGE TITLE -->
      --%>


			<!-- FAQ -->
      <section>
        <div class="container">

          <div class="row">

          <%--왼쪽 noticebar부분 : 필요없어서 뺌
          <jsp:include page="sidebar.jsp" />
					--%>
						<div class="col-12 col-lg-8">

							<!--
								.article-format class will add some slightly formattings for a good text visuals. 
								This is because most editors are not ready formatted for bootstrap
								Blog content should come inside this container, as it is from database!
								src/scss/_core/base/_typography.scss
							-->
							<!-- 
							<div class="bg-white p-5 p-4-xs rounded-xl article-format">
							 -->
							 
							 <h1>공지사항 카테고리 등록</h1>
							 <form action="add" method="post" enctype="multipart/form-data">
                <table border='1' style='width:50%'>

                <tr>
                 <td align="center">카테고리 번호</td>
                 <td style="height:50px"><input type="number" name='categoryNumber' style="width:100%;"></input></td>
                </tr>
                
                <!-- 
                공지사항 테이블 완료후, 공지사항 유형 추가해야함
                <form action="/action_page.php">
							  <label for="cars">Choose a car:</label>
							  <select id="cars" name="cars">
						    <option value="volvo">Volvo</option>
						    <option value="saab">Saab</option>
						    <option value="fiat">Fiat</option>
						    <option value="audi">Audi</option>
							  </select>
							  <input type="submit">
							  </form>
                 -->

                
                <tr>
                 <td align="center">카테고리 내용</td>
                 <td style="height:50px"><input name='name' style='resize: none; width:100%;'></input></td>
                </tr>
                </table>
                <button>등록하기</button>
                </form>
                

							</div>

						</div>
				  </div>


			</section>
			<!-- /FAQ -->
