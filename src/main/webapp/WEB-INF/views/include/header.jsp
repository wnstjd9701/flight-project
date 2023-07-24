<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--::header part start::-->
<header class="main_menu">
	<div class="main_menu_iner">
		<div class="container">
			<div class="row align-items-center ">
				<div class="col-lg-12">
					<nav
						class="navbar navbar-expand-lg navbar-light justify-content-between">
						<a class="navbar-brand" href="<c:url value='/'/>"> <img
							src="<c:url value='/img/logo.png'/>" alt="logo">
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div>
							<div
								class="collapse navbar-collapse main-menu-item justify-content-space-between"
								id="navbarSupportedContent">
								<c:if test="${empty sessionScope.memberId}">
									<!-- 로그인 이전 화면 -->
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/board'/>">고객센터</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/login'/>">로그인</a></li>
									</ul>
								</c:if>
								<c:if test="${not empty sessionScope.memberId}">
									<!-- 로그인 이후 화면 -->
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/board'/>">고객센터</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/mp'/>">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/logout'/>">로그아웃</a></li>
									</ul>
								</c:if>
								<c:if test="${not empty sessionScope.memberId}">
									<!-- 로그인 이후 화면 -->
									<ul class="navbar-nav">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/board'/>">고객센터</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/mp'/>">마이페이지</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/logout'/>">로그아웃</a></li>
									</ul>
								</c:if>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</div>
</header>