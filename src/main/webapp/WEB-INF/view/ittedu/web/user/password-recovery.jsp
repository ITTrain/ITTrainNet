<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>パスワードを忘れた方</title>
<script type="text/javascript" src="${ctx}/static/inxweb/front/forget_password.js"></script>
</head>
<body>
	<div class="bg-fa of">
		<section class="container">
			<div class="u-body mt40">
				<div style="width: 80%; margin: 0 auto;" class="i-box">
					<div>
						<section class="c-infor-tabTitle c-tab-title">
							<a title="パスワードを忘れた方" style="cursor: default;" href="javascript: void(0)">パスワードを忘れた方</a>
						</section>
					</div>
					<form id="recoveryForm">
						<div style="width: 320px; margin: 30px auto;">
							<div class="mt10 mb10">
								<p style="visibility: visible; height: 28px; line-height: 28px;" class="e-l-jy">
									<span class="fsize12 c-red" id="errorMsg"></span>
								</p>
							</div>
							<ol class="e-login-options">
								<li><input type="text" name="email" id="u-email" placeholder="メールアドレスを入力してください" />
									<p class="lr-tip-wrap"></p></li>
								<li class="clearfix"><input type="text" id="u-password" class="fl" style="width: 120px;" placeholder="検証コードを入力してください" name="pageCode" value=""> <img width="86" height="40" onclick="this.src='${ctx}/ran/random?random='+Math.random();" alt="検証コードを再取得" src="${ctx}/ran/random">
									<p class="lr-tip-wrap"></p></li>
							</ol>
							<section class="mt20 tac">
								<a href="javascript: void(0)" onclick="sendPwdRecoveery()" title="登録" class="e-login-btn">登録</a>
							</section>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
</body>
</html>