<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="/base.jsp"%>
<c:if test="${page != null && page.totalPageSize>1}">
	<div class="u-pageBar tac clearfix">
		<span id="pager_con">
			<c:choose>
				<c:when test="${page.first}">
					<a href="javascript:void(0)" title="ホーム">
						<em class="left-go icon-2-16">&nbsp;</em>
					</a>
					<a href="javascript:void(0)" title="前へ" class="page-up b-fff">前へ</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:goPageAjax(1)" title="ホーム">
						<em class="left-go icon-2-16">&nbsp;</em>
					</a>
					<a href="javascript:goPageAjax(${page.currentPage-1})" title="前へ" class="page-up b-fff">前へ</a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page.last}">
					<a href="javascript:void(0)" title="次へ" class="page-down b-fff">次へ</a>
					<a href="javascript:void(0)" title="最後">
						<em class="right-go icon-2-16">&nbsp;</em>
					</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:goPageAjax(${page.currentPage+1 })" title="次へ" class="page-down b-fff">次へ</a>
					<a href="javascript:goPageAjax(${page.totalPageSize })" title="最後">
						<em class="right-go icon-2-16">&nbsp;</em>
					</a>
				</c:otherwise>
			</c:choose>
		</span>
		<span class="ml50">
			<tt class="c-666">第${page.currentPage}ページ/合計${page.totalPageSize }ページ</tt>
		</span>
	</div>
</c:if>
