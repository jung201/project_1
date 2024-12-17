<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="opendata.*, opendata.ApiDataDTO.*, java.util.List" %> 

<%

    try {

        String serviceKey="azuwE8nDzBbDI%2B2BHA9LYLCpF7ePjarJFg7tcbHh4zmHPfB2wSM16DNtPwCQAW%2FvIFn94C%2FUoMNeh1dbu4dnJg%3D%3D";
        String srcUrl="http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute";

        Class<ApiDataDTO> dto = ApiDataDTO.class;

        ApiDataDTO data = (ApiDataDTO)ApiExplorer.getApiJsonData(serviceKey, srcUrl, dto);

        if (data.getMsgBody().getItemList().size() > 0 ) {
            ApiDataDAO insertDAO = new ApiDataDAO();
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
    ApiDataDAO selectDAO = new ApiDataDAO();
    List<Item> itemList = selectDAO.getList();
%>
<table border='1' width='800' align='center'>
       <tr align='center' bgcolor='#FFFF66'> 
         <td>순번</td>
         <td>정류소 고유번호</td>
         <td>노선ID</td>
         <td>진행방향</td>
         <td>정류장ID</td>
         <td>정류장이름</td>
    </tr>
<%
    for(int i=0; i < itemList.size(); i++) {
        Item item = (Item) itemList.get(i);
%>
    <tr align='center'> 
        <td><%=item.getSeq() %></td>
        <td><%=item.getArsId() %></td>
        <td><%=item.getBusRouteId() %></td>
        <td><%=item.getDirection() %></td>
        <td><%=item.getStation() %></td>
        <td><%=item.getStationNm() %></td>
    </tr>
<%
    }
%>
</body>
</html>