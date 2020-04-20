<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

  <jsp:include page="../header.jsp"/>

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


			<!-- FAQ -->
			<section>
				<div class="container">
						
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
							 
							 <form action="addForm" method="post">
                <table border='1' style='width:100%'>
                
                <tr>
                 <td align="center">제목</td>
                 <td><input type="text" name='title' style='width:100%'/></td>
                </tr>
                
                <tr height="500">
                <td align="center">내용</td>
                <td><textarea name='content' style="resize: none; width:100%; height:100%;"></textarea></td>
                </tr>
                
                </table>
                <button>글쓰기</button>
                </form>
                

							</div>

						</div>


			</section>
			<!-- /FAQ -->



		  <jsp:include page="../footer.jsp"/>
