<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 리뷰 수정 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/KOY/goodsReview.css">
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>리뷰 수정</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form:form modelAttribute="goodsReviewVO" action="updateReview.do" id="review_modify" enctype="multipart/form-data">
		<form:errors element="div" cssColor="error-color"/>
		<ul>
			<%-- 
			<li>
				<label>구매목록 불러오기</label>
			</li>
			--%>
			<li>
				<label>작성자</label>
				<span>${memberVO.mem_id}</span>
			</li>
			<li> <%-- 임시로 상품목록 표시 --%>
				<label>상품</label>
				${goodsReviewVO.goods_name}
			</li>
			<li>
				<form:label path="review_title">제목</form:label>
				<form:input path="review_title"/>
				<form:errors path="review_title" cssColor="error-color"/>
			</li>
			<li>
				<fieldset>
					<span id="output_score">${goodsReviewVO.review_score}</span>
					<input type="radio" name="review_score" value="5" id="rate1" <c:if test="${goodsReviewVO.review_score == 5}">checked</c:if>><label for="rate1" class="review-star">★</label>
					<input type="radio" name="review_score" value="4" id="rate2" <c:if test="${goodsReviewVO.review_score == 4}">checked</c:if>><label for="rate2" class="review-star">★</label>
					<input type="radio" name="review_score" value="3" id="rate3" <c:if test="${goodsReviewVO.review_score == 3}">checked</c:if>><label for="rate3" class="review-star">★</label>
					<input type="radio" name="review_score" value="2" id="rate4" <c:if test="${goodsReviewVO.review_score == 2}">checked</c:if>><label for="rate4" class="review-star">★</label>
					<input type="radio" name="review_score" value="1" id="rate5" <c:if test="${goodsReviewVO.review_score == 1}">checked</c:if>><label for="rate5" class="review-star">★</label>
					<label>별점</label>
				</fieldset>
				<script> <%-- 별점 변경시 표시되는 숫자 변경 --%>
				 	$(document).ready(function () {
				 		$('input[type="radio"]').click(function () {
				 	          var radioVal = $('input[name="review_score"]:checked').val();
				 	         $('#output_score').text(radioVal);
				 	    });
					});
				</script>
			</li>
			<li>
				<form:label path="review_content">내용</form:label>
				<form:textarea path="review_content"/>
				<form:errors path="review_content" cssColor="error-color"/>
			</li>
			<li>
				<label for="upload">사진</label>
				<input type="file" id="upload" name="upload" accept="image/gif,image/png,image/jpeg">
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록</form:button>
			<input type="button" value="이전" onclick="location.href='goodsDetail.do?goods_num=${goods.goods_num}#goods_review'">
		</div>
	</form:form>
</div>
<!-- 리뷰 수정 끝 -->