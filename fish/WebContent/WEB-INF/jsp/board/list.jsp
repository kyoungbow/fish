<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../common/head.jsp"/>
	<style>
	
	</style>
</head>
   
<body>
    <jsp:include page="../common/nav.jsp"/>
    <div class="notice">
        <div class="notice-content">
        	<c:if test="${page.cri.category == 1}">
            <div class="board"><address><h1>Notice</h1></address></div>
        	</c:if>
        	<c:if test="${page.cri.category == 2}">
            <div class="board"><address><h1>Free</h1></address></div>
        	</c:if>
            
            <table>
                <tr>
                    <th class="col1">번호</th>
                    <th class="col2">제목</th>
                    <th class="col3">작성일</th>
                    <th class="col4">작성자</th>
                </tr>
                <c:forEach items="${boards}" var="board">
                <tr>
					<td>${board.bno}</td>
					<td class="col5"><a href="get${page.cri.params2}&bno=${board.bno}">${board.title}</a><span>[${board.replyCnt}]</span></td>
					<td>${board.regDate}</td>
					<td ${empty board.writer ? 'class="text-muted small"' : ''}>${empty board.writer ? '(탈주피쉬)' : board.writer}</td>
				</tr>
                </c:forEach>
            </table>
            <div class="button" >
                <a href="register${page.cri.params2}">Writing</a>
            </div>
            <div class="page">
                <div>
                	<c:if test="${page.prev}">
                    <a href="list${page.cri.params}&pageNum=${page.cri.pageNum-1}">prev</a>
                    </c:if>
                    <c:forEach begin="${page.start}" end="${page.end}" var="p">
                    	<a href="list${page.cri.params}&pageNum=${p}">${p}</a>
                    </c:forEach>
                    <c:if test="${page.next}">
                    <a href="list${page.cri.params}&pageNum=${page.cri.pageNum+1}">next</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    <script>
        $(function () {
	        $(".form-amount").change(function () {
				location.href = 'list?amount=' + $(this).val() + "&category=${page.cri.category}&pageNum=${page.cri.pageNum}"
			});	
		})
    </script>
</body>
</html>