<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<button class="btn btn-primary" onclick="history.back()">돌아가기</button>
	<c:if test="${board.user.id == principal.user.id}">
		<a href="/board/${board.id}/updateForm" class="btn btn-primary">수정</a>
		<button id="btn-delete" class="btn btn-primary">삭제</button>
	</c:if>
	<br/> <br/>
	<div>
		<span id="id" style="display: none"><i>${board.id} </i></span> 작성일 : <span><i>${board.createDate} </i></span>
	</div>
	<br/>
	<div>
		<h4 style="text-align: center">${board.title}</h4>
	</div>
	<hr/>
	<div>
		<div>${board.content}</div>
	</div>
	<hr/>
</div>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>


