<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My 情報</title>
<link rel="stylesheet" type="text/css" href="${ctx}/static/common/jcrop/jquery.Jcrop.min.css" />
<script type="text/javascript" src="${ctx}/static/common/jcrop/jquery.Jcrop.min.js"></script>
<script type="text/javascript" src="${ctx}/static/inxweb/user/user.js"></script>
<script type="text/javascript" src="${ctx}/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript">
$(function(){
	showTab('${index}');//选项控制显示
	uploadImg('fileupload','uploadfile');
});
</script>
<style type="text/css">
	.ke-upload-area {min-width: 54px;width: auto;}
	.ke-upload-area .ke-button-common,.ke-upload-area .ke-button-common input {border: 1px solid #FF5F16;background: #FFF7F3;}
	.ke-upload-area .ke-button-common input {border: none;width: 100px;color: #FF5F16;font-weight: bold;}
	.ke-upload-area .ke-button-common input:hover {background: #FFF2EC;}
</style>
</head>
<body>
	<article class="col-7 fl">
		<div class="u-r-cont">
			<section>
				<div>
					<section class="c-infor-tabTitle c-tab-title">
						<a href="javascript: void(0)" title="My 情報" style="cursor: default;">My 情報</a>
						<a href="javascript: void(0)" title="基本情報" class="clickAvailable current">基本情報</a>
						<a href="javascript: void(0)" title="プロファイル写真" class="clickAvailable ">プロファイル写真</a>
						<a href="javascript: void(0)" title="パスワード設定" class="clickAvailable ">パスワード設定</a>
					</section>
				</div>
				<div class="mt40" id="p_tCont">
					<div class="u-account-box">
						<form method="post" id="updateForm">
							<input type="hidden" name="user.userId" value="${user.userId}" />
							<ol class="u-account-li">
								<li>
									<label class="u-a-title">
										<span class="fsize１6 c-999">メール</span>
									</label>
									<input type="text" class="u-a-inpt" name="${user.email}" value="${user.email}" placeholder="" readonly="readonly" disabled="disabled">
									<!-- <span class="u-a-error"><em class="u-a-zq icon16">&nbsp;</em></span> -->
								</li>
<%-- 								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">手机号</span>
									</label>
									<input type="text" class="u-a-inpt" name="user.mobile" value="${user.mobile }" placeholder="" readonly="readonly" disabled="disabled">
									<!-- <span class="u-a-error"><em class="u-a-zq icon16">&nbsp;</em></span> -->
								</li> --%>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">氏名</span>
									</label>
									<input type="text" class="u-a-inpt" name="user.userName" value="${user.userName }" placeholder="" >
									<!-- <span class="u-a-error"><em class="u-a-cw icon16">&nbsp;</em>请输入正确的账 号</span> -->
								</li>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">愛称</span>
									</label>
									<input type="text" class="u-a-inpt" name="user.showName" value="${user.showName}" placeholder="">
									<!-- <span class="u-a-error"><em class="u-a-cw icon16">&nbsp;</em>请输入正确的昵称</span> -->
								</li>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">性 別</span>
									</label>
									<input type="radio" name="user.sex" <c:if test="${user.sex==1}">checked="checked"</c:if> value="1"/><span class="vam fsize14 c-666">男</span>
									<input type="radio" name="user.sex" <c:if test="${user.sex==2}">checked="checked"</c:if> value="2"/><span class="vam fsize14 c-666">女</span>
									<!-- <span class="u-a-error"><em class="u-a-zq icon16">&nbsp;</em></span> -->
								</li>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">年齢</span>
									</label>
									<select name="user.age">
											<option value="0">0歳</option>
											<c:forEach var="age" begin="1" end="110">
												<option <c:if test="${user.age==age}">selected</c:if> value="${age}">${age}岁</option>
											</c:forEach>
									</select>
									<!-- <span class="u-a-error"><em class="u-a-cw icon16">&nbsp;</em></span> -->
								</li>
							</ol>
						</form>
						<div class="ml50 mt50 pl50">
							<a href="javascript:void(0)" title="" class="comm-btn c-btn-7" onclick="updateUserInfo()">確認</a>
						</div>
					</div>

					<!--修改头像，开始-->
					<div class="u-account-box undis">
						<div id="tabCont">
							<section>
								<section class="ukindeditor of">
									<section class="clearfix">
										<!--个人头像上传控件-->
										<section>
											<input id="fileupload" type="button" width="133" value="プロフィール写真を選択" height="45" class="pa" />
										</section>
										<!--个人头像上传控件-->
										<!--个人头像裁切控件-->
										<div class="fl jc-demo-box pr mt40">
											<c:choose>
												<c:when test="${user.picImg!=null && user.picImg!=''}">
													<img src="<%=staticImage%>${user.picImg}" width="100%" height="100%" alt="プロフィール写真ロード中..." class="dis pictureWrap" id="picture" />
												</c:when>
												<c:otherwise>
													<img src="${ctx}/static/inxweb/img/avatar-boy.gif" width="100%" height="100%" alt="プロフィール写真ロード中..." class="dis pictureWrap"
														id="picture" />
												</c:otherwise>
											</c:choose>
											<div id="preview-pane" class="preview-pane1">
												<div class="preview-container">
													<c:choose>
														<c:when test="${user.picImg!=null && user.picImg!=''}">
															<img src="<%=staticImage%>${user.picImg}" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:when>
														<c:otherwise>
															<img src="${ctx}/static/inxweb/img/avatar-boy.gif" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:otherwise>
													</c:choose>
												</div>
												<p class="c-999">プロフィール写真（大），大小<br />180x180</p>
											</div>
											<div id="preview-pane" class="preview-pane2">
												<div class="preview-container" style="width: 80px; height: 80px; margin: 0 auto;">
													<c:choose>
														<c:when test="${user.picImg!=null && user.picImg!=''}">
															<img src="<%=staticImage%>${user.picImg}" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:when>
														<c:otherwise>
															<img src="${ctx}/static/inxweb/img/avatar-boy.gif" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:otherwise>
													</c:choose>
												</div>
												<p class="c-999">プロフィール写真（中），80x80</p>
											</div>
											<div id="preview-pane" class="preview-pane3">
												<div class="preview-container" style="width: 50px; height: 50px;">
													<c:choose>
														<c:when test="${user.picImg!=null && user.picImg!=''}">
															<img src="<%=staticImage%>${user.picImg}" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:when>
														<c:otherwise>
															<img src="${ctx}/static/inxweb/img/avatar-boy.gif" class="jcrop-preview" alt="プロフィール写真ロード中..." width="100%" />
														</c:otherwise>
													</c:choose>
												</div>
												<p class="c-999">プロフィール写真（小），50x50</p>
											</div>
										</div>
										<!--个人头像裁切控件-->
										<div class="fl ml30 uploadWrap mt40">
											<p class="c-green">写真は自動作成します、ご確認してください。</p>
										</div>
										<section class="clear"></section>
										<div class="uploadBc of">
											<div class="tac">
												<span id="save_message">

												</span>
											</div>
											<div class="ml50 mt20 pl50">
												<a href="javascript:void(0)" title="" class="comm-btn c-btn-7" onclick="updateImg(${user.userId})">保存</a>
											</div>
										</div>
									</section>
								</section>
							</section>
							<!-- /修改个人头像 -->
						</div>
						<input type="button" class="commBtn bgGreen w80 ml50" id="deleImage" style="display: none">
						<!--修改头像，结束-->
						<form method="post" name="photoForm">
							<input id="photoPath" type="hidden" value="" />
							<input type="hidden" value="1" id="picture_width" />
							<input type="hidden" value="1" id="picture_height" />
							<input type="hidden" value="82" id="txt_top" />
							<input type="hidden" value="73" id="txt_left" />
							<input type="hidden" value="120" id="txt_DropWidth" />
							<input type="hidden" value="120" id="txt_DropHeight" />
							<input type="hidden" id="txt_Zoom" />
						</form>
					</div>
					<!--修改头像，结束-->

					<!--修改密码，开始-->
					<div class="u-account-box undis">
						<form method="post" name="pwdForm" id="pwdForm">
							<input type="hidden" name="user.userId" value="${user.userId}" />
							<ol class="u-account-li">
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">古いパスワード</span>
									</label>
									<input type="password" class="u-a-inpt" name="nowPassword" value="" placeholder="" maxlength="16">
									<span class="u-a-error"></span>
								</li>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">新しパスワード</span>
									</label>
									<input type="password" class="u-a-inpt" name="newPassword" placeholder="" maxlength="16">
									<span class="u-a-error"></span>
								</li>
								<li>
									<label class="u-a-title">
										<span class="fsize16 c-999">新しパスワード確認</span>
									</label>
									<input type="password" class="u-a-inpt" name="confirmPwd" value="" placeholder="" maxlength="16">
									<span class="u-a-error"></span>
								</li>
							</ol>
						</form>
						<div class="ml50 mt50 pl50">
							<a href="javascript:void(0)" title="" class="comm-btn c-btn-7" onclick="updatePwd();">変 更</a>
							<a href="javascript:void(0)" title="" class="comm-btn c-btn-7" onclick="javascript:$('#pwdForm').find('input').val('');">リセット</a>
						</div>
					</div>
					<!--修改密码，结束-->
				</div>
			</section>
			<!-- /我的资料 -->
		</div>
	</article>
	<!-- /右侧内容区 结束 -->
</body>
</html>