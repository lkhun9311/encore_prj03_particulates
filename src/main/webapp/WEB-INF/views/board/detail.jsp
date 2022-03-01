<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container board">
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
	
	<div class="card">
		<div class="card-header">댓글 등록</div>
		<div class="card-body d-flex">
			<textarea rows="2" class="form-control textStyle"></textarea>
			<button class="badge btn-primary" id="button--1">확인</button>
		</div>
	</div>
	<br/>
	<div class="card" id="card--2">
		<div class="card-header">댓글 리스트</div>
		<ul class="list-group" id="reply--box">
			<li class="list-group-item d-flex justify-content-between" id="comment--1">
				<div>댓글 내용</div>
				<div class="d-flex">
				<div>작성자: user &nbsp;</div>
				<button class="badge btn-primary" id="button--2">삭제</button>
				</div>
			</li>
		</ul>
	</div>
	
	<hr/>
</div>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>


