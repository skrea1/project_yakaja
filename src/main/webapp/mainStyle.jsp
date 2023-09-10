<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- mainStyle.jsp -->
<!-- maincolor=#06BBCC -->
<style>
#rankingTable {
	border: 5px solid #06BBCC;
	width: 900px;
}

#searchBox {
	width: 400px;
	outline: none !important;/*변경*/
  	border:3px solid #06bbcc;/*변경*/
}

.searchBtn{
  border: none;
  border-radius: 4px;
  background-color:#06BBCC;
  color:white;
  width:60px;
  height:38px;
}

.searchBtn:hover{
   transition: 0.5s;
   background-color:#0dcaf0;
   font:bold;
}

table.reviewTable{
margin:auto;
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  width: 1350px;
  table-layout:fixed;
}
#nameColumn{
	width:20%;
}
#titleColumn{
	width:10%;
}
#contentColumn {
	width: 35%;
}
#writerColumn{
	width:10%;
}
table.reviewTable thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}
table.reviewTable tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.reviewTable td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
#hiddenColumn{
	width:0%;
}



button {
  /* 생략 */
  margin: 0;
  padding: 0.5rem 1rem;

  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 400;
  text-align: center;
  text-decoration: none;

  display: inline-block;
  width: auto;

  border: none;
  border-radius: 4px;
}

</style>
</head>
</html>