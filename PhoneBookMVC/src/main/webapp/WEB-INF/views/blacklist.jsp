<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차단된 사용자 목록</title>
<style>
    /* Add your CSS styles here */
</style>
</head>
<body>
    <h3>차단된 사용자 목록</h3>
    <c:if test="${not empty blockedPersons}">
        <table>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>나이</th>
                <th>직업</th>
                <th>전화번호</th>
            </tr>
            <c:forEach items="${blockedPersons}" var="person">
                <tr>
                    <td>${person.no}</td>
                    <td>${person.name}</td>
                    <td>${person.age}</td>
                    <td>${person.job}</td>
                    <td>${person.phonenumber}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty blockedPersons}">
        <p>차단된 사용자가 없습니다.</p>
    </c:if>
    <a href="list">전체 목록으로 돌아가기</a>
</body>
</html>
