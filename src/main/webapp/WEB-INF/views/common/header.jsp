<%@ page import="com.sh.obtg.member.model.dto.Member" %>
<%@ page import="com.sh.obtg.member.model.dto.MemberRole" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	Member loginMember=(Member) session.getAttribute("loginMember");
    String msg = (String) session.getAttribute("msg");
    if(msg != null) session.removeAttribute("msg");
    
    Cookie[] cookies = request.getCookies();
    String saveId = null;
    if(cookies != null){
    	for(Cookie cookie : cookies){
    		String name = cookie.getName();
    		String value = cookie.getValue();
    		if("saveId".equals(name))
    			saveId = value;
    	}
    }
    
%>
<!doctype html>

<head>
<meta charset="UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OBTG Semi-Project</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" /> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.6.1.js"></script>
</head>

<body>
<section id="headercolor">
<!--   메뉴바 -->
<br /> <br />
<table id="tdloginSignup">
<% if(loginMember == null) { %>
 <tr>
 	<td><button id="loginSignup" value="로그인/회원가입" onclick="location.href = '<%= request.getContextPath() %>/member/memberEnroll';">LOGIN / SIGN UP</button></td>
 </tr>	
</table>
<% } else { %>

				 <table id="login" style="margin-left:80%; text-align:right;">
					<tr>
						<td>
							<a href="<%= request.getContextPath() %>/member/memberView;"><img id="defaultimg" src="<%=request.getContextPath()%>/image/default.png" alt="defaultimg" style="width:30px; cursor: pointer;"/></a>
							<%= loginMember.getNickname() %>님
							<span id="notification"></span>
						</td>
					</tr>
					<tr>
						 <td>
							<input type="button" value="Logout" style="border: 0px; padding: 5px; background-color: lightpink; cursor: pointer;"onclick="location.href = '<%= request.getContextPath() %>/member/logout';"/>
						</td>
					</tr>
				</table> 
			
			<% } %>
<h1 style="width : 400px; font-size : 70px;	margin : auto; text-align : center; font-weight: bold; font-family: 'Noto Sans KR', sans-serif;"> O B T G  </h1>
<br /> <br />
<hr style="border: solid 1px black; margin:0;">
<nav class="menu">
	<a class="menu__item" id="i-0"href="<%=request.getContextPath()%>/index.jsp"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGZp%0D%0AbGw9IiNmZmZmZmYiIGlkPSJzdmdfMSIgZD0ibTIwLDQwbDAsLTEybDgsMGwwLDEybDEwLDBsMCwt%0D%0AMTZsNiwwbC0yMCwtMThsLTIwLDE4bDYsMGwwLDE2bDEwLDB6Ii8+CiA8L2c+Cjwvc3ZnPg=="/><span class="menu__text">HOME</span></a>	
	<a class="menu__item" id="i-1" href="<%=request.getContextPath()%>/ootd/ootdWholeList"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGZp%0D%0AbGw9IiNmZmZmZmYiIGlkPSJzdmdfMSIgZD0ibTI0LDhjLTQuNDIsMCAtOCwzLjU4IC04LDhjMCw0%0D%0ALjQxIDMuNTgsOCA4LDhzOCwtMy41OSA4LC04YzAsLTQuNDIgLTMuNTgsLTggLTgsLTh6bTAsMjBj%0D%0ALTUuMzMsMCAtMTYsMi42NyAtMTYsOGwwLDRsMzIsMGwwLC00YzAsLTUuMzMgLTEwLjY3LC04IC0x%0D%0ANiwtOHoiLz4KIDwvZz4KPC9zdmc+"/><span class="menu__text">OOTD</span></a>
	<a class="menu__item" id="i-2"href="<%=request.getContextPath()%>/share/shareWholeList"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGlk%0D%0APSJzdmdfMSIgZmlsbD0ibm9uZSIgZD0ibTAsMGw0OCwwbDAsNDhsLTQ4LDBsMCwtNDh6Ii8+CiAg%0D%0APHBhdGggZmlsbD0iI2ZmZmZmZiIgaWQ9InN2Z18yIiBkPSJtMjQsNDIuN2wtMi45LC0yLjYzYy0x%0D%0AMC4zLC05LjM1IC0xNy4xLC0xNS41MiAtMTcuMSwtMjMuMDdjMCwtNi4xNyA0LjgzLC0xMSAxMSwt%0D%0AMTFjMy40OCwwIDYuODIsMS42MiA5LDQuMTdjMi4xOCwtMi41NSA1LjUyLC00LjE3IDksLTQuMTdj%0D%0ANi4xNywwIDExLDQuODMgMTEsMTFjMCw3LjU1IC02LjgsMTMuNzIgLTE3LjEsMjMuMDdsLTIuOSwy%0D%0ALjYzeiIvPgogPC9nPgo8L3N2Zz4="/><span class="menu__text">SHARES</span></a>
	<a class="menu__item" id="i-3"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGlk%0D%0APSJzdmdfMSIgZmlsbD0ibm9uZSIgZD0ibTAsMGw0OCwwbDAsNDhsLTQ4LDBsMCwtNDh6Ii8+CiAg%0D%0APHBhdGggZmlsbD0iI2ZmZmZmZiIgaWQ9InN2Z18yIiBkPSJtMjAsNDBsOCwwbDAsLTMybC04LDBs%0D%0AMCwzMnptLTEyLDBsOCwwbDAsLTE2bC04LDBsMCwxNnptMjQsLTIybDAsMjJsOCwwbDAsLTIybC04%0D%0ALDB6Ii8+CiA8L2c+Cjwvc3ZnPg=="/><span class="menu__text" style="width : 100px" >ABOUT US</span></a>
	<a class="menu__item" id="i-4"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGlk%0D%0APSJzdmdfMSIgZmlsbD0ibm9uZSIgZD0ibTAsMGw0OCwwbDAsNDhsLTQ4LDBsMCwtNDh6Ii8+CiAg%0D%0APHBhdGggZmlsbD0iI2ZmZmZmZiIgaWQ9InN2Z18yIiBkPSJtMjAsNDBsOCwwbDAsLTMybC04LDBs%0D%0AMCwzMnptLTEyLDBsOCwwbDAsLTE2bC04LDBsMCwxNnptMjQsLTIybDAsMjJsOCwwbDAsLTIybC04%0D%0ALDB6Ii8+CiA8L2c+Cjwvc3ZnPg=="/><span class="menu__text">FAQ</span></a>
	<a class="menu__item" id="i-5" href="<%= request.getContextPath() %>/column/columnList"><img class="menu__icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAw%0D%0AL3N2ZyI+CgogPGc+CiAgPHRpdGxlPmJhY2tncm91bmQ8L3RpdGxlPgogIDxyZWN0IGZpbGw9Im5v%0D%0AbmUiIGlkPSJjYW52YXNfYmFja2dyb3VuZCIgaGVpZ2h0PSI0MDIiIHdpZHRoPSI1ODIiIHk9Ii0x%0D%0AIiB4PSItMSIvPgogPC9nPgogPGc+CiAgPHRpdGxlPkxheWVyIDE8L3RpdGxlPgogIDxwYXRoIGlk%0D%0APSJzdmdfMSIgZmlsbD0ibm9uZSIgZD0ibTAsMGw0OCwwbDAsNDhsLTQ4LDBsMCwtNDh6Ii8+CiAg%0D%0APHBhdGggZmlsbD0iI2ZmZmZmZiIgaWQ9InN2Z18yIiBkPSJtMjAsNDBsOCwwbDAsLTMybC04LDBs%0D%0AMCwzMnptLTEyLDBsOCwwbDAsLTE2bC04LDBsMCwxNnptMjQsLTIybDAsMjJsOCwwbDAsLTIybC04%0D%0ALDB6Ii8+CiA8L2c+Cjwvc3ZnPg=="/><span class="menu__text">COLUMN</span></a>

  <div id="active"></div>
  <div id="active-2"></div>
  <div id="active-3"></div>
</nav>
<hr style="border: solid 1px black; margin:0;">
</section>




<script>
const item = document.querySelectorAll(".menu__item");

let mainFunc = (event) =>{
    for (var i = 0; i < item.length; i++) {
        item[i].addEventListener("click", getItem);
    }
}
/* */
window.addEventListener("load", mainFunc);


const icon = document.querySelectorAll(".menu__icon");
const text = document.querySelectorAll(".menu__text");
const active = document.querySelector("#active");
const active2 = document.querySelector("#active-2");
const active3 = document.querySelector("#active-3");
//let colors = ["#c6a700","#c25e00", "#b91400","#5c007a" ,"black"];

let colors = ["black"];

let getItem = (event) => {
    getIcon();
    let indexItem = event.currentTarget.id;
    indexItem = indexItem.split("i-").join("");

    active.style.left = `\${(indexItem * 210) + 80}px`;
    active.style.background = colors[indexItem];

    /*
    active2.style.left = `\${(indexItem * 100) + 140}px`;
    active2.style.background = colors[indexItem];
    active2.classList.add("is-item-animated");

    active3.style.left = `\${(indexItem * 120) + 140}px`;
    active3.style.background = colors[indexItem];
    active3.classList.add("is-item-animated");
	*/

    event.currentTarget.children[0].classList.add("is-icon-visible");
    event.currentTarget.children[1].classList.add("is-text-visible");

    setTimeout(() => {
        active.classList.remove("is-item-animated");
    }, 300);

};


let getIcon = (event) =>{
    for (var i = 0; i < icon.length; i++) {
        icon[i].classList.remove("is-icon-visible");
    }
    for (var i = 0; i < text.length; i++) {
        text[i].classList.remove("is-text-visible");
    }
}

</script>

</html>
