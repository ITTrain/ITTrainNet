<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<menu class="col-3 fl uMenu">
	<dl>
		<dt>
			<section class="of">
				<div class="u-face-pic">
					<img src="${ctx }/static/inxweb/img/avatar-boy.gif" alt="" class="userImgPhoto">
					<a href="${ctx}/uc/initUpdateUser/1" title="" class="c-fff">プロフィール写真変更</a>
				</div>
				<h4 class="mt10"><span class="fsize16 c-666 userNameClass"><!-- 用户名 --></span></h4>
				<div class="hLh30 mt10">
					<a href="${ctx}/uc/initUpdateUser/0" title="" class="c-blue">プロフィール設定</a>
				</div>
				<div class="clear"></div>
			</section><!-- /u-face-attr -->
			<!-- <section class="mt20">
				<section class="stud-time-wrap stud-time">
					<tt class="f-fM c-999">已学习：</tt>
					<big>189</big>
					<small>小时</small>
					<big>568</big>
					<small>分</small>
				</section>
			</section> -->
		</dt>
		<dd class="u-m-dd">
			<ul>
				<li>
					<span></span>
					<ol>My 講座
						<li><a href="${ctx}/uc/index" title="">無料講座</a></li>
						<li><a href="${ctx}/front/showcoulist" title="" target="view_window">講座一覧</a></li>
						<li><a href="${ctx}/uc/myFavorites" title="">お気になり</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My Q&A</span>
					<ol>
						<li><a href="${ctx}/uc/myquestions/list" title="">My 質問</a></li>
						<li><a href="${ctx}/uc/myrepquestions/list" title="">My 答え</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My 情報</span>
					<ol>
						<li><a href="${ctx}/uc/initUpdateUser/0" title="">基本情報</a></li>
						<li><a href="${ctx}/uc/initUpdateUser/1" title="">プロフィール写真</a></li>
						<li><a href="${ctx}/uc/initUpdateUser/2" title="">パスワード設定</a></li>
					</ol>
				</li>
			</ul>
			<ul>
				<li>
					<span>My 通知</span>
					<ol>
						<li><a href="/uc/letter" title="">システム通知</a></li>
						<!-- <li><a href="" title="">其它消息</a></li> -->
					</ol>
				</li>
			</ul>
		</dd>
	</dl>
</menu>
<!-- /公共左侧菜单 结束 -->