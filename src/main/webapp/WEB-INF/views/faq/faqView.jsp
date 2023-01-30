<%@page import="com.sh.obtg.faq.model.dto.faqComment"%>
<%@page import="java.util.List"%>
<%@page import="com.sh.obtg.faq.model.dto.faq"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	faq faq  = (faq) request.getAttribute("faq");
	List<faqComment> comments = (List<faqComment>) request.getAttribute("comments"); 
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/board2.css" /> --%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/css.css" />

<style>
/*댓글등록버튼*/
div.comment-container button#btn-comment-enroll1 { width:60px; height:50px; color:white; background:#3300ff; position:relative; top:-20px;}

/*댓글테이블*/
table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse;} 
table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
table#tbl-comment button.btn-reply{display:none;}
table#tbl-comment tr:hover {background:lightgray;}
table#tbl-comment tr:hover button.btn-reply{display:inline;}
table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
table#tbl-comment sub.comment-date {color:tomato; font-size:10px}

table#tbl-comment tr.level2 {color:gray; font-size: 14px;}
table#tbl-comment tr.level2 td:first-of-type{padding-left:100px;}
table#tbl-comment tr.level2 sub.comment-writer {color:#8e8eff; font-size:14px}
table#tbl-comment tr.level2 sub.comment-date {color:#ff9c8a; font-size:10px}

table#tbl-comment tr td{
	border-bottom:1px solid; 
	border-top:1px solid; 
	padding:5px; 
	text-align:left; 
	line-height:120%;
	font-weight : 100;
	}

/*답글관련*/
table#tbl-comment textarea{margin: 4px 0 0 0;}
table#tbl-comment button.btn-comment-enroll2{width:60px; height:23px; color:white; background:#3300ff; position:relative; top:-5px; left:10px;}

/* 삭제버튼관련 */
table#tbl-comment button.btn-delete{background:red; color:white; display:none;}
table#tbl-comment tr:hover button.btn-delete{display:inline;}

.comment-container {
	width: 1000px;
	margin: auto;
}




</style>



<body>
    <div class="board_wrap">
    
    
        <div class="board_title">
            <strong>INFO</strong>
            <p>문의사항을 빠르고 정확하게 안내해드립니다.</p>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                   <%= faq.getTitle() %>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%= faq.getNo() %></dd>
                    </dl>
                    <dl>
                        <dt>작성자</dt>
                        <dd><%= faq.getWriter() %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%= faq.getRegDate() %></dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd><%= faq.getReadCount() %></dd>
                    </dl>
                </div>
                <div class="cont"> <%= faq.getContent() %>
                </div>
                
                <% 
			boolean canEdit = loginMember != null && 
								(loginMember.getMemberRole() == MemberRole.A ||
									loginMember.getMemberId().equals(faq.getWriter()));
			if(canEdit){
		%>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input id="btn-add2" type="button" value="수정하기" onclick="updatefaq()">
				<input id="btn-add2" type="button" value="삭제하기" onclick="deletefaq()">
			</th>
		</tr>
		<% 
			}
		%>
            </div>
        </div>
    </div>
</body>
		
	</table>
	
    

	<div class="comment-container">
        <div class="comment-editor">
            <form
			action="<%=request.getContextPath()%>/faq/faqCommentEnroll" method="post" name="faqCommentFrm">
                <input type="hidden" name="faqNo" value="<%= faq.getNo() %>" />
                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
				<textarea name="content" cols="60" rows="3"></textarea>
                <button type="submit" id="btn-add3">등록</button>
            </form>
        </div>
	<hr style="margin-top:30px;" />	
		<!--table#tbl-comment-->
		<%
			if(!comments.isEmpty()){
		%>
		
		<table id="tbl-comment">
		<%
				for(faqComment fc : comments){
					boolean canRemove = 
							loginMember != null && 
							(
							  loginMember.getMemberId().equals(fc.getWriter())
							  || loginMember.getMemberRole() == MemberRole.A 
							);

					if(fc.getCommentLevel() == 1){
		%>
			
			<%-- 댓글인 경우 tr.level1 --%>
			<tr class="level1">
				<td>
					<sub class=comment-writer><%= fc.getWriter() %></sub>
					<sub class=comment-date><%= fc.getRegDate() %></sub>
					<br />
					<%-- 댓글내용 --%>
					<%= fc.getContent() %>
				</td>
				<td>
			<%-- 		<button class="btn-reply" value="<%= fc.getNo() %>">답글</button> --%>
					<% if(canRemove){ %>
					<button class="btn-delete" value="<%= fc.getNo() %>">삭제</button>
					<% } %>

				</td>
			</tr>
		<%
					} else {
		%>
			<%-- 대댓글인 경우 tr.level2 --%>
			<tr class="level2">
				<td>
					<sub class=comment-writer><%= fc.getWriter() %></sub>
					<sub class=comment-date><%= fc.getRegDate() %></sub>
				<br />
					<%-- 대댓글 내용 --%>
					<%= fc.getContent() %>
				</td>
				<td>
					<% if(canRemove){ %>
					<button class="btn-delete" value="<%= fc.getNo() %>">삭제</button>
					<% } %>

				</td>
			</tr>
		<%
					} // if...else
				} // for
		%>
		</table>
		
		<%
			}
		%>
	</div>
	
	
</section>
<form 
	action="<%= request.getContextPath() %>/faq/faqCommentDelete" 
	name="faqCommentDelFrm"
	method="POST">
<!-- 	<input type="hidden" name="no" /> -->
	<input type="hidden" name="no">
	<input type="hidden" name="faqNo" value="<%= faq.getNo() %>"/>
</form>

   <script>
document.querySelectorAll(".btn-delete").forEach((button) => {
	button.onclick = (e) => {
		if(confirm("해당 댓글을 삭제하시겠습니까?")){
			const frm = document.faqCommentDelFrm;
			frm.no.value = e.target.value;
			frm.submit();
		}
	}; 
});	
</script>

<script>
document.querySelectorAll(".btn-reply").forEach((button) => {
	button.onclick = (e) => {
		console.log(e.target.value);
		
		<% if(loginMember == null){ %>
			loginAlert();
		<% } else { %>
			const tr = `
			<tr>
				<td colspan="2" style="text-align:left">
					<form
						action="<%=request.getContextPath()%>/faq/faqCommentEnroll" method="post" name="faqCommentFrm">
		                <input type="hidden" name="faqNo" value="<%= faq.getNo() %>" />
		                <input type="hidden" name="writer" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
		                <input type="hidden" name="commentLevel" value="2" />
		                <input type="hidden" name="commentRef" value="\${e.target.value}" />    
						<textarea name="content" cols="58" rows="1"></textarea>
		                <button type="submit" class="btn-comment-enroll2">등록</button>
		            </form>
		      	</td>
		    </tr>
			`;
			
			const target = e.target.parentElement.parentElement; // tr
			console.log(target);
			target.insertAdjacentHTML('afterend', tr);
			
			button.onclick = null; // 이벤트핸들러 제거
		
		<% } %>
	};
});


/**
 * 이벤트버블링을 통해 부모요소에서 이벤트 핸들링
 */
document.body.addEventListener('submit', (e) => {
	console.log(e.target);
	
	if(e.target.name === 'faqCommentFrm'){
		
		<% if(loginMember == null){ %>
			loginAlert();
			e.preventDefault();
			return; // 조기리턴
		<% } %>
				
		// 유효성검사
		const content = e.target.content;
		if(!/^(.|\n)+$/.test(content.value)){
			e.preventDefault();
			alert('내용을 작성해주세요');
			content.focus();
		}
	}
	
	
});

// textarea
document.faqCommentFrm.content.addEventListener('focus', (e) => {
	<% if(loginMember == null){ %>
		loginAlert();
	<% } %>
});

const loginAlert = () => {
	alert("로그인 후 이용할 수 있습니다.");
	document.querySelector("#memberId").focus();
};

</script>

<% if(canEdit){ %>
<form action="<%= request.getContextPath() %>/faq/faqDelete" name="faqDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= faq.getNo() %>" />
<%-- 	<input type="hidden" name="no" value="<%= f %>" /> --%>
</form>
<script>
const updatefaq = () => {
	location.href = "<%= request.getContextPath() %>/faq/faqUpdate?no=<%= faq.getNo() %>";
};
const deletefaq = () => {
	if(confirm("정말 게시글을 삭제하겠습니까?")){
		document.faqDeleteFrm.submit();
	}
};
</script>
<% } %>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>