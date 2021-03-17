<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div class="container" style="width: auto">
		<form id="commentForm" name="commentForm" method="post">
			<input type="hidden" value="${nview.no}" name="no" id="wawa">
			<input type="hidden" name="pname" value="${mDTO.pname}" id="wpwp">
			<input type="hidden" value="${Nick}" name="nick" id="wsws"> <br>
			<br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<input type="hidden" value="${mDTO.status}" id="status">
					<c:if test="${mDTO.status == 'N' }">
						<h3 class="card-title">이메일 인증을 하고 댓글을 써보세요.</h3>
					</c:if>
					<c:if test="${mDTO.status == 'Y' }">
						<table class="table">
							<tr>
								<td><textarea rows="3" cols="30" id="comment"
										name="content" placeholder="댓글을 입력하세요"></textarea> <br>
									<div>
										<a href='#' onClick="fn_comment('${result.code }');return false;" 
											class="btn pull-right btn-success">등록</a>
									</div></td>

							</tr>
						</table>
					</c:if>
				</div>
			</div>
			<input type="hidden" id="b_code" name="b_code"
				value="${result.code }" />
		</form>

	</div>
	<div class="container" style="width: auto">
		<form id="commentListForm" name="commentListForm" method="post">

			<div class="card gedf-card">
				<div class="card-body" id="Reivew" style="padding-bottom: 0px">
					<h3 class="card-title">댓글</h3>

					<div id="commentList"></div>
				</div>
			</div>
		</form>
	</div>

	<script>
	function rrev_on(no) {	
		var rrev = "";
		rrev += "<div style='margin-top:25px'>";
		rrev += "<input type='text' id='b"+no+"' name='content' style='float:left;width:70%;height:40px'>";
		rrev += "<a href='#' onclick='reComment("+no+");return false;' class='btn pull-right btn-success'>등록</a>";
		rrev += "<div>";
		$('#qz'+no).html(rrev);			
	}
	
	/*
	 * 대댓글 등록하기(Ajax)
	 */
	 function reComment(no) {
		var content = $('#b'+no).val();
		var nick = $('#wsws').val();
		var rgroup = no;
		var no = $('#wawa').val();
		var pname = $("#wpwp").val();
		var form = {
			content,
			nick,
			no,
			rgroup,
			pname
		}
			$.ajax({
				type : 'POST',
				url : "addRComment.do",
				data : form,
				success : function(data) {
					if (data == "success") {
						getCommentList();
						$("#comment").val("");
					}
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		
		}
	
		/*
		 * 댓글 등록하기(Ajax)
		 */
		 
		function fn_comment(code) {
			$.ajax({
				type : 'POST',
				url : "addComment.do",
				data : $("#commentForm").serialize(),
				success : function(data) {
					if (data == "success") {
						getCommentList();
						$("#comment").val("");
					}
				},
				error : function(request, status, error) {
					//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
		/*
		 * 댓글 삭제하기(Ajax)
		 */
		 function delR(no) {
				var content = $('#b'+no).val();
				var nick = $('#wsws').val();
				var rnum = no;
				var no = $('#wawa').val();
				var form = {
					content,
					nick,
					no,
					rnum
				}
					$.ajax({
						type : 'POST',
						url : "delReview",
						data : form,
						success : function(data) {
							if (data == "success") {
								getCommentList();
							}
						},
						error : function(request, status, error) {
							//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				
		}
		 /*
			 * 대댓글 삭제하기(Ajax)
			 */
			 function delRr(no) {
	               var rnum = no;
	               var rgroup = no;
	               var form = {
	                     rnum,
	                     rgroup
	               }
	                  $.ajax({
	                     type : 'POST',
	                     url : "delReviewr",
	                     data : form,
	                     success : function(data) {
	                        if (data == "success") {
	                           getCommentList();
	                        }
	                     },
	                     error : function(request, status, error) {
	                        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                     }
	                  });
	               
	         }
		 
			 /*
				 * 댓글 수정하기(Ajax)
				 */
				 function modR(no) {
					 var modform = no+"cm";
					 var form = no+"cv";
					 var bg = no+"btng";
					 var view;
				      var mview;
				     var bview;
				      view = document.getElementById(form).style.display;
				      mview = document.getElementById(modform).style.display;
				      bview = document.getElementById(bg).style.display;
				      if (mview == 'none') {
				         document.getElementById(form).style.display = "none";
				         document.getElementById(modform).style.display = "block";
				         document.getElementById(bg).style.display = "none";
				      } else {
				         document.getElementById(modform).style.display = "none";
				         document.getElementById(form).style.display = "block";
				         document.getElementById(bg).style.display = "block";
				      }
				   }
				 /*
					 * 댓글 수정버튼보이기
					 */
				 function showbtn_cm(no) {
						var btn = no+"btn";
						var content;
						content = document.getElementById(no+"cm");
						if (content.value.length > 0) {
							document.getElementById(btn).style.display = "block";
						} else {
							document.getElementById(btn).style.display = "none";
						}
					}
				 /*
					 * 댓글 수정하기(Ajax) 컨트롤러호출
					 */
					 function modRrr(no) {
						 var rnum = no;
			               var rgroup = no;
			               var content;
			               content =$('#'+no+'cm').val();
// 							document.getElementById(no+"cv").textContent = content;
							
			               var form = {
			                     rnum,
			                     rgroup,
			                     content
			               }
			                  $.ajax({
			                     type : 'POST',
			                     url : "modReview",
			                     data : form,
			                     success : function(data) {
			                        if (data == "success") {
			                           getCommentList();
			                        }
			                     },
			                     error : function(request, status, error) {
			                        //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                     }
			                  });
				   }


		/**
		 * 초기 페이지 로딩시 댓글 불러오기
		 */
		$(function() {
			getCommentList();
		});

		/**
		 * 댓글 불러오기(Ajax)
		 */
		
		function getCommentList() {
			var sear = "-";
			$
					.ajax({
						type : 'GET',
						url : "commentList.do",
						dataType : "json",
						data : $("#commentForm").serialize(),
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data) {
							var html = "";
							var html2 = "";
							var cCnt = data.length;
							var status = $('#status').val();
							var Nick = $('#wsws').val();
							if (data.length > 0) {
								$.each(data, function(index, item){
									if(item.status=='0'){
										html += "<div class='card'>";
										html += "<div class='card-body'><div class='row'><div class='col-md-2' style='margin-right:-5%'>";
										
										if(item.pname.indexOf("-") == -1){
										html += "<img class='rounded-circle' width='35'	src='${pageContext.request.contextPath}/resources/images/default.png' alt='' />	</div> <div class='col-md-10' style='margin-bottom:10px'>";
										}else{
									    html += "<img class='rounded-circle' width='35'	src='${pageContext.request.contextPath}/download?filename="+item.pname+"' style='height:35px' alt='' />	</div> <div class='col-md-10' style='margin-bottom:10px'>";											
										}
										
										html += "<a class='float-left' href='#'><strong>@"
												+ item.writer + "</strong></a>";
										html += "<div id='"+item.rnum+"cv' style='margin-left:50px'>" + item.comment +"</div>";
										html += "<input type='text' id='"+item.rnum+"cm' name='content' value='"+item.comment+"'style='float:left;width:50%;height:30px;display:none' onblur='showbtn_cm("+item.rnum+")'>";
										html += "<a href='#' onclick='modRrr("+item.rnum+");return false;' class='btn pull-right btn-success' style='display:none' id='"+item.rnum+"btn'>수정</a>";
										if( Nick == item.writer){
											html += "<div id='"+item.rnum+"btng'>";
											html += "<a class ='float-right' style='margin-right:5px;line-height:2.3' onclick='modR("+item.rnum+")'> 수정 </a>";
											html += "<a class ='float-right' style='margin-right:5px;line-height:2.3' onclick='delR("+item.rnum+")'> 삭제 </a>";
											html += "</div>";
										}
										if(status == "Y"){
											html += "<a class ='float-right' style='margin-right:5px;line-height:2.3' onclick='rrev_on("+item.rnum+");return false;'>답글쓰기</a>";
										}										
										html += "<div id=qz" + item.rnum + "> </div>";
										html += "</div></div></div>";
										html += "<div class='card-body' id=z" + item.rnum + ">";
										html += "<div></div></div>";
										html += "</div>";	
									}																		
								});
							} else {
								html += "<div>";
								html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
								html += "</table></div>";
								html += "</div>";
							}	
							$("#cCnt").html(cCnt);
							$("#commentList").html(html);
							getCommentLists();
						},
						error : function(request, status, error) {
						}
					});
		}
		
		function getCommentLists() {
			$
			.ajax({
				type : 'GET',
				url : "commentLists.do",
				dataType : "json",
				data : $("#commentForm").serialize(),
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
					var html = "";
					var status = $('#status').val();
					var Nick = $('#wsws').val();
					var sear = "-";
					if (data.length > 0) {
						$.each(data, function(index, item){
							html = "";
							html += "<div class='card card-inner'>";
							html += "<div class='row'>";
							html += "<div class='col-md-2' style='margin-right:-5%'>";
							
							if(item.pname.indexOf("-") == -1){
							html += "<img class='rounded-circle' width='30' style='margin:10px' src='${pageContext.request.contextPath}/resources/images/default.png' alt='' />	</div> <div class='col-md-10' style='margin-bottom:10px'>";
							}else{
						    html += "<img class='rounded-circle' width='30' style='height:30px;margin:10px' src='${pageContext.request.contextPath}/download?filename="+item.pname+"' alt='' />	</div> <div class='col-md-10' style='margin-bottom:10px'>";
							}
							html += "<a class='float-left'style='margin-top:12px' href='#'><strong>@"
									+ item.writer + "</strong></a>";
							html += "<div id='"+item.rnum+"cv' style='margin-top:12px;margin-left:70px'>" + item.comment +"</div>";
							html += "<input type='text' id='"+item.rnum+"cm' name='content' value='"+item.comment+"'style='float:left;width:50%;height:30px;display:none' onblur='showbtn_cm("+item.rnum+")'>";
							html += "<a href='#' onclick='modRrr("+item.rnum+");return false;' class='btn pull-right btn-success' style='display:none' id='"+item.rnum+"btn'>수정</a>";
							if(Nick == item.writer){	
								html += "<div id='"+item.rnum+"btng'>";
								html += "<a class ='float-right' style='margin-right:5px;line-height:2.3' onclick='modR("+item.rnum+")'> 수정 </a>";
								html += "<a  class ='float-right' style='margin-right:5px;line-height:2.3' onclick='delRr("+item.rnum+")'> 삭제 </a>";
								html += "</div>";
							}
							html += "</div></div></div>";
							$("#z"+item.rgroup).append(html);
						});
					}	
				},
				error : function(request, status, error) {
				}
			});
		}
	</script>
</body>
</html>
