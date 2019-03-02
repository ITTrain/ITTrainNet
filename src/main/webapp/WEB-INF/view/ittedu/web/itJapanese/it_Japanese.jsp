<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>IT日本語</title>
<script src="${ctx }/static/common/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx }/static/common/bootstrap/css/bootstrap.min.css" type="text/css"/>
</head>
<body>
	<div id="aCoursesList" class="bg-fa of">
		<!-- /课程列表 开始 -->
		<section class="container">
			<header class="comm-title all-teacher-title">
				<h2 class="fl tac">
					<span class="c-333">すべて</span>
				</h2>
				<section class="c-tab-title">
					<c:forEach var="subject" items="${subjectList }">
						<a id="${subject.subjectId}" title="${subject.subjectName }" href="javascript:void(0)" onclick="submitForm(${subject.subjectId})">${subject.subjectName }</a>
					</c:forEach>
				</section>
			</header>
			<section class="c-sort-box unBr">
				<div>
					<!-- /无数据提示 开始-->
					<c:if test="${empty iTJapaneseWordsList }">
						<section class="no-data-wrap">
							<em class="icon30 no-data-ico">&nbsp;</em> <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理中...</span>
						</section>
					</c:if>
					<!-- /无数据提示 结束-->
					<article class="i-teacher-list">
						<ul class="of">
							<c:if test="${not empty iTJapaneseWordsList }">
								<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>仮名</th>
										<th>漢字</th>
										<th>中国語</th>
										<th>英語</th>
										<th></th>
									</tr>
								</thead>
								<c:forEach var="words" items="${iTJapaneseWordsList }">
									<tr>
										<td>${words.kana }</td>
										<td>${words.kanji }</td>
										<td>${words.chinese }</td>
										<td>${words.english }</td>
										<td>${words.word_type }</td>
									<tr>
								</c:forEach>
								</table>
							</c:if>
						</ul>
						<div class="clear"></div>
					</article>
				</div>
				<!-- 公共分页 开始 -->
				<div>
					<form action="${ctx }/front/itJapanese" method="post" id="searchForm">
						<input type="hidden" name="page.currentPage" id="pageCurrentPage" value="1">
						<input type="hidden" name="queryITJapanese.subjectId" id="" value="${subjectId }">
					</form>
					<jsp:include page="/WEB-INF/view/common/front_page.jsp"></jsp:include>
				</div>
				<!-- 公共分页 结束 -->
			</section>
		</section>
		<!-- /课程列表 结束 -->
	</div>
<script type="text/javascript">
	$(function() {
		if ('${subjectId}' == null || '${subjectId}' == 0) {
			$("#subjectAll").addClass("current");
		}else{
			$("#${subjectId}").addClass("current");
		};
		scrollLoad(); //响应滚动加载课程图片
	})

	/**
	 * 条件查询
	 */
	function submitForm(val){
		$("input[name='queryITJapanese.subjectId']").val(val);
		$("#searchForm").submit();
	}
</script>
</body>
</html>