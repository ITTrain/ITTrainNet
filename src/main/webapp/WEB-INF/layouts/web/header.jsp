<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!-- 20190216 tang add topbar start-->
<!-- /global topbar begin-->
<div style="width:100%;height:60px;background:#333; color:#333333;margin:-20px 0 0 0px;">
	<div style="float:right;position:relative;right:3%">
		<!-- / nav -->
		<ul class="h-r-login">
			<li class="undis" id="no-login">
				<a href="javascript:lrFun(1)" title="ログイン">
					<em class="icon18 login-icon">&nbsp;</em><span class="vam ml5">ログイン</span>
				</a>
				|
				<a href="javascript:lrFun(2)" title="登録">
					</em><span class="vam ml5">登録</span>
				</a>
			</li>
			<li class="mr10 undis" id="is-login-one"><a href="${ctx}/uc/letter" title="メッセージ" id="headerMsgCountId">
					<em class="icon18 news-icon">&nbsp;</em>
				</a><q class="red-point" style="display: none">&nbsp;</q>
			</li>
			<li class="h-r-user undis" id="is-login-two"><a href="${ctx}/uc/index" title="">
					<img src="${ctx }/static/inxweb/img/avatar-boy.gif" width="30" height="30" class="vam picImg" alt="">
					<span class="vam disIb" id="userName"></span>
				</a>
				<a href="javascript:void(0)" title="ログアウト" onclick="exit();" class="ml5">ログアウト</a>
			</li>
			<!-- /未登录显示第1 li；登录后显示第2，3 li -->
		</ul>
		<aside class="h-r-search">
			<form action="${ctx}/front/showcoulist" method="post">
				<label class="h-r-s-box"><input type="text" placeholder="研修講座を入力" name="queryCourse.courseName" value="${queryCourse.courseName}">
					<button type="submit" class="s-btn">
						<em class="icon18">&nbsp;</em>
					</button></label>
			</form>
		</aside>
	</div>
</div>
<!-- 20190216 tang add topbar end-->
<!-- /global header begin-->
<header id="header">
	<section class="container">
		<h1 id="logo">
			<a href="${ctx }/" title="${websitemap.web.company}">
				<img src="<%=staticImage%>${logomap.logo.url}" width="100%" alt="${websitemap.web.company}">
			</a>
		</h1>
		<div class="h-r-nsl">
			<ul class="nav">
				<c:forEach items="${navigatemap.INDEX}" var="indexNavigate">
					<li><a href="${ctx}${indexNavigate.url}" title="${indexNavigate.name}" <c:if test="${indexNavigate.newPage==0}">target="_blank"</c:if>>${indexNavigate.name}</a></li>
				</c:forEach>
			</ul>
			<!--20190216 tang del start  -->
			<!-- / nav -->
			<%-- <ul class="h-r-login">
				<li class="undis" id="no-login">
					<a href="javascript:lrFun(1)" title="ログイン">
						<em class="icon18 login-icon">&nbsp;</em><span class="vam ml5">ログイン</span>
					</a>
					|
					<a href="javascript:lrFun(2)" title="登録">
						</em><span class="vam ml5">登録</span>
					</a>
				</li>
					<li class="mr10 undis" id="is-login-one"><a href="${ctx}/uc/letter" title="メッセージ" id="headerMsgCountId">
							<em class="icon18 news-icon">&nbsp;</em>
						</a><q class="red-point" style="display: none">&nbsp;</q></li>
					<li class="h-r-user undis" id="is-login-two"><a href="${ctx}/uc/index" title="">
							<img src="${ctx }/static/inxweb/img/avatar-boy.gif" width="30" height="30" class="vam picImg" alt="">
							<span class="vam disIb" id="userName"></span>
						</a>
						<a href="javascript:void(0)" title="ログアウト" onclick="exit();" class="ml5">ログアウト</a></li>
				 --%>
				 <!-- /未登录显示第1 li；登录后显示第2，3 li -->
			<%-- </ul>
			<aside class="h-r-search">
				<form action="${ctx}/front/showcoulist" method="post">
					<label class="h-r-s-box"><input type="text" placeholder="研修講座を入力" name="queryCourse.courseName" value="${queryCourse.courseName}">
						<button type="submit" class="s-btn">
							<em class="icon18">&nbsp;</em>
						</button></label>
				</form>
			</aside> --%>
			<!-- 20190216 tang del end -->
		</div>
		<aside class="mw-nav-btn">
			<div class="mw-nav-icon"></div>
		</aside>
		<div class="clear"></div>
	</section>
</header>
<!-- /global header end-->
<div class="h-mobile-mask"></div>
<div class="head-mobile">
	<div class="head-mobile-box">
		<section class="clearfix">
			<div class="u-face-pic">
				<img src="${ctx }/static/inxweb/img/avatar-boy.gif" alt="" class="userImgPhoto">
				<a href="${ctx }/uc/initUpdateUser/1" title="" class="c-fff">プロフィール写真変更</a>
			</div>
			<h4 class="hLh30 txtOf">
				<span class="fsize16 c-ccc userNameClass">
					<span class="vam ml5" style="cursor:pointer;" onclick="lrFun(1)">ログイン</span>
				</span>
			</h4>
			<div class="hLh30">
				<a href="${ctx }/uc/initUpdateUser/0" title="プロフィール情報設定" class="c-999">プロフィール情報設定</a>
			</div>
			<div class="hLh20 undis" id="mobileExitDiv">
				<a href="javascript:void(0)" title="ログアウト" onclick="exit();" class="c-999">ログアウト</a>
			</div>
		</section>
		<nav class="mw-nav">
			<ul class="clearfix">
				<c:forEach items="${navigatemap.INDEX}" var="indexNavigate">
					<li><a href="${ctx}${indexNavigate.url}" title="${indexNavigate.name}" <c:if test="${indexNavigate.newPage==0}">target="_blank"</c:if>>${indexNavigate.name}</a></li>
				</c:forEach>
			</ul>
		</nav>
		<section class="u-m-dd">
			<ul>
				<li>
					<span>My 講座</span>
					<ol>
						<li class="current"><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/index')" title="">無料講座</a></li>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/front/showcoulist')" title="">講座一覧</a></li>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/myFavorites')" title="">お気に入り</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My Q&A</span>
					<ol>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/myquestions/list')" title="">My 質問</a></li>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/myrepquestions/list')" title="">My 答え</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My 情報</span>
					<ol>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/initUpdateUser/0')" title="">基本情報</a></li>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/initUpdateUser/1')" title="">プロフィール写真</a></li>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/initUpdateUser/2')" title="">パスワード設定</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My メッセージ</span>
					<ol>
						<li><a href="javascript:void(0)" onclick="mobileHrefCheckLogin('${ctx }/uc/letter')" title="">システム通知</a></li>
					</ol>
				</li>
			</ul>
		</section>
	</div>
</div>
<script>
	$(function() {
		wmNavFun(); // 手机端导航方法
		goTopFun(); //返回顶部
	})
</script>