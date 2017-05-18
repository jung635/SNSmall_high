<%@page import="web.memo.db.MemoBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
//	request.setAttribute("boardList", boardList); // 리스트형
//	request.setAttribute("pageNum", pageNum); // String형
//	request.setAttribute("count", count); // int형
//	request.setAttribute("pageCount", pageCount); // int형
//	request.setAttribute("pageBlock", pageBlock); // int형
//	request.setAttribute("startPage", startPage); // int형
//	request.setAttribute("endPage", endPage); // int형

List memoList=(List)request.getAttribute("memoList");
String pageNum=(String)request.getAttribute("pageNum");
int count=((Integer)request.getAttribute("count")).intValue();
int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
int startPage=((Integer)request.getAttribute("startPage")).intValue();
int endPage=((Integer)request.getAttribute("endPage")).intValue();

%>



<h1>WebContent/memo/list.jsp</h1>
<h1> 쪽지 글 목록 [전체 글의 개수 : <%=count %>] </h1>
<h3><a href="./MemoWrite.me">글쓰기</a></h3>
<table border=1>
<tr bgcolor="orange">
	<td>번호</td><td>받는사람</td><td>내용</td><td>날짜</td>
</tr>
<%
	for(int i=0; i < memoList.size(); i++){
		//memoBean meb= 한칸의 데이터 가져와서 저장 .get()
		MemoBean meb = (MemoBean)memoList.get(i); //downcasting
		// 자바빈(MemoBean) 변수=배열한칸 접근 배열변수.get()
		//부모                                                      자식
		
%>
<tr bgcolor="#ffeecc">
<td><%=meb.getNum() %></td><td><%=meb.getTo_id() %></td>
<td>
<a href="./MemoContent.me?num=<%=meb.getNum()%>&pageNum=<%=pageNum%>"><%= meb.getSubject()%></a></td><td><%=meb.getDate() %></td>
</tr>
<%
}
%>
</table>

<%
//페이지 출력
if(count!=0){
	//전체 페이지 수 구하기   게시판글  50개 한 화면에 보여줄 글개수 10 => 5 페이지
	//						56개 한 화면에 보여줄 글개수 10 => 5 페이지 + 1(나머지) =>6
	//한 화면에 보여줄 페이지 번호 개수
	//시작페이지 번호 구하기   1~10=>1   11~20=>11   21~30=>21
	//끝페이지 번호 구하기
	//이전 페이지
	if(startPage>pageBlock){ // 스타트페이지가 페이지블럭보다 많을 때
		%><a href="MemoList.me?pageNum=<%=startPage-pageBlock%>">[이전]</a>&nbsp;<%
	}
	//1...10   11...20   21...30
	for(int i=startPage; i<=endPage; i++){
		%><a href="MemoList.me?pageNum=<%=i%>">[<%=i%>]</a>&nbsp;<%
	}
	//다음 페이지
	if(endPage<pageCount){ //엔트페이지가 페이지블록보다 작을 때
		%><a href="MemoList.me?pageNum=<%=startPage+pageBlock%>">[다음]</a><%
	}
}

%>
          
</body>
</html>