<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>
  <div class="container">
    <div class="row">
      <div>
        <h2 class="h4 font-weight-normal ml-4 text-muted" style="margin-bottom: 30px;">${message1}</h2>
        <h2 class="h6 font-weight-normal ml-4 text-muted" style="margin-bottom: 150px;">${message2}</h2>
        <div class="p-4 p-0-xs rounded" data-aos="fade-in"
          data-aos-delay="150">
          <hr>
          <ul class="list-unstyled list-icons mb-0 fs--18">
            <li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
              href="${pageContext.request.getContextPath()}/app/auth/loginForm"
              class="link-muted"> 로그인 페이지로 가기 </a></li>

            <li class="p-1"><i class="fi fi-arrow-end fs--13"></i> <a
              href="${pageContext.request.getContextPath()}" class="link-muted">
                메인페이지로 돌아가기 </a></li>
          </ul>

        </div>
      </div>
    </div>
  </div>
</section>
<hr>
