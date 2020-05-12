<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../header.jsp" />

<section>
	<div class="container-fluid">
		<div class="row">
			<!--------------------------------------- nav bar ----------------------------------------------->

			<div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5">
				<!-- CATEGORIES -->
				<nav class="nav-deep nav-deep-light mb-2">
					<!-- mobile only -->
					<button
						class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
						data-target="#nav_responsive"
						data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
						<span class="group-icon px-2 py-2 float-start"> <i
							class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
						</span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
					</button>

					<!-- desktop only -->
					<h1 class="h1 pt-3 d-none d-lg-block ml-3">Customer</h1>
					<h1 class="h1 pb-3 d-none d-lg-block" style="margin-left: 120px;">Center</h1>
					<!-- navigation -->
					<ul id="nav_responsive" style="margin-top: 50px;"
						class="nav flex-column d-none d-lg-block font-weight-bold">

						<li class="h5 nav-item mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/notice/list"> <span
								class="px-2 d-inline-block"> 공지사항 </span>
						</a></li>

						<li class="h5 nav-item mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/faq/list"> <span
								class="px-2 d-inline-block"> FAQ </span>
						</a></li>

						<li class="h5 nav-item active mb-2 ml-3"><a class="nav-link"
							href="/portfoli/app/qna/list"> <span
								class="px-2 d-inline-block"> Q&A </span>
						</a></li>



					</ul>
				</nav>
				<!-- /CATEGORIES -->
			</div>

			<!--------------------------------------------- /nav bar ------------------------------------------------>

			<!-------------------------------------------- contents -------------------------------------------------->



			<!-------------------------------------------- /contents -------------------------------------------------->
		</div>
	</div>
</section>

<jsp:include page="../footer.jsp" />
