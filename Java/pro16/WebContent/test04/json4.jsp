<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"  %>

<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSON 테스트</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(function() {
         $("#checkJson").click(function() {
            var jsonStr = '{"members":[{"name" :"둘리", "age":20,"gender":"공룡","nickname":"호이","friend":"donur"}'
            						+',{"name" :"또치", "age":20,"gender":"공룡","nickname":"","friend":"dooly"}]}';
            var jsonInfo = JSON.parse(jsonStr);
            var output ="회원 정보<br>";
                output += "=======<br>";
            for(var i in jsonInfo.members){
                   output += "이름: " + jsonInfo.members[i].name+"<br>";
                   output += "나이: " + jsonInfo.members[i].age+"<br>";
                   output += "성별: " + jsonInfo.members[i].gender+"<br>";
                   output += "별명: " + jsonInfo.members[i].nickname+"<br>";
                   output += "친구: " + jsonInfo.members[i].friend+"<br><br><br>";
            }
            $("#output").html(output);
         });
     });
</script>
</head>
<body>
    <a id="checkJson" style="cursor:pointer">출력</a><br><br>
    <div id="output"></div>
</body>
</html>
