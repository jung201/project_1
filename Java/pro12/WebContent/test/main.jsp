<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.*,test.DTO.*, java.util.List" %> 

<%

    try {

        String serviceKey="fmfEayzWzjeSn7tLBvdZwCJufRl4tUvsKnx9%2F0AY2QICla959I6w3mqG5b7WYooxG8NaKg%2B9m9GEiCmr9oywHQ%3D%3D";
        String srcUrl="http://apis.data.go.kr/B551011/KorPetTourService/areaCode";

        Class<DTO> dto = DTO.class;

        DTO data = (DTO) ApiExplorer.getApiJsonData(serviceKey, srcUrl, dto);

        if (data.getBody().getList().size() > 0 ) {
            DAO insertDAO = new DAO();
            insertDAO.insertData(data);
        } 


    } catch(Exception e) {
        e.printStackTrace();
    }


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    DAO selectDAO = new DAO();
    List<Item> itemList = selectDAO.getList();
%>
<table border='1' width='800' align='center'>
       <tr align='center' bgcolor='#FFFF66'> 
         <td>코드번호</td>
         <td>이름</td>
         <td>넘버</td>
    </tr>
<%
    for(int i=0; i < itemList.size(); i++) {
        Item item = (Item) itemList.get(i);
%>
    <tr align='center'> 
        <td><%=item.getCode() %></td>
        <td><%=item.getName() %></td>
        <td><%=item.getRnum() %></td>
    </tr>
<%
    }
%>
</body>
</html>