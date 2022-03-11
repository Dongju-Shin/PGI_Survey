<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>PGI 설문조사</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<script type="text/javascript">


	function modify_click(url_param) {
		var isCheck = false;
		for (j = 1; j <= 108; j++) {
			isCheck = check_radio('I' + j);
			if (!isCheck) {
				break;
			}
		}

		if (isCheck) {
			if (confirm('다음 설문으로 넘어가시겠습니까?')) {
				location.replace(url_param);
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	function check_radio(RadioName) {
		var isCheck = false;
		for (var i = 0; i < document.fm[RadioName].length; i++) {
			if (document.fm[RadioName][i].checked == true) {
				isCheck = true;
				break;
			}
		}

		if (isCheck) {
			return true;
		} else {
			alert('체크 하지 않은 설문이 있습니다.');
			document.fm[RadioName][0].focus();
			return false;
		}

	}
	function f_logout() {
		location.href = "member?command=logout";
	}

	window.history.forward();
	function noBack() {
		var example_value = "<c:out value='${memberId}' />";
		if (example_value == '') {
			location.href = "/PGI_SURVEY";
		}
		window.history.forward();
	}
</script>


<body class="is-preload" onload="noBack();"
   onpageshow="if(event.persisted) noBack();" onunload="">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<a href="#" class="logo">HANNAM<br/> UNIVERSITY
			</a>
			
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul class="links">
            <li class="active" style="background-color:white;"><font color="black">&nbsp;&nbsp;108직업 선호도 설문&nbsp;&nbsp;</font></li>
         </ul>
			<ul class="actions">
            <c:if test="${memberId ne ''}">
               <li><a href="javascript:f_logout();" class="button small" style=background-color:white>로그아웃</a></li>
            </c:if>
         </ul>
		</nav>

		<!-- Main -->
		<div id="main">
		
		
			<!-- Post -->
			<section class="post">
				<!-- Table -->
				<form name="fm" method="post" action="occupation" onsubmit="return modify_click(this);">
					<input type="hidden" name="command" value="occupation_write">
		
				<h3>1. 108가지 직업에 대한 선호도 설문조사</h3>
					<div class="table-wrapper">
				
					다음은 108가지의 다양한 직업을 나열하고 있습니다. 각 직업에 대한 여러분의 선호에 따라  1부터 7까지의 점수를 선택하세요. 직업이 매우 싫다면 1점, 매우 좋다면 7 점을 선택합니다. 
아래 직업에 대한1부터 7까지의 점수는 그 일을 하는 것에 대한 여러분의 느낌을 의미하는 것이지, 이러한 작업을 잘 수행할 수 있는지, 아니면 할 수 있는 기술이나 자격이 있는지 여부에 대한 질문이 아닙니다.
		
						<table>
							<tr>
                        		<th></th>
                        		<th>측정 <br>점수</th>
                        		<th>매우<br>싫어함</th>
                        		<th>싫어함</th>
                        		<th>약간<br>싫어함</th>
                        		<th>보통<br>이다</th>
                        		<th>약간<br>좋아함</th>
                        		<th>좋아함</th>
                        		<th>매우<br>좋아함</th>
                     		</tr>
							<tr>
								<th>NO</th>
								<th>직업</th>
								<th>1</th>
								<th>2</th>
								<th>3</th>
								<th>4</th>
								<th>5</th>
								<th>6</th>
								<th>7</th>
							</tr>


							<c:forEach var="occDesc" items="${surveyList}" varStatus="status">
                        <tr>
                           <td style="text-align: center">${status.count}</td>
                           <td style="text-align: center">${occDesc.occName}</td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}" type="radio"
                              id="demo-priority-low1 ${occDesc.occNumber}" value="1" checked /><label
                              for="demo-priority-low1 ${occDesc.occNumber}"></label></td>


                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}" type="radio"
                              id="demo-priority-low2 ${occDesc.occNumber}" value="2" /><label
                              for="demo-priority-low2 ${occDesc.occNumber}"></label></td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}"
                              id="demo-priority-low3 ${occDesc.occNumber}" type="radio"
                              value="3" /><label
                              for="demo-priority-low3 ${occDesc.occNumber}"></label></td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}"
                              id="demo-priority-low4 ${occDesc.occNumber}" type="radio"
                              value="4" /><label
                              for="demo-priority-low4 ${occDesc.occNumber}"></label></td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}"
                              id="demo-priority-low5 ${occDesc.occNumber}" type="radio"
                              value="5" /><label
                              for="demo-priority-low5 ${occDesc.occNumber}"></label></td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}"
                              id="demo-priority-low6 ${occDesc.occNumber}" type="radio"
                              value="6" /><label
                              for="demo-priority-low6 ${occDesc.occNumber}"></label></td>

                           <td style="text-align: center"><input
                              name="I${occDesc.occNumber}"
                              id="demo-priority-low7 ${occDesc.occNumber}" type="radio"
                              value="7" /><label
                              for="demo-priority-low7 ${occDesc.occNumber}"></label></td>
                        </tr>
                     </c:forEach>
						</table>
					</div>
						<div style='width: 80px; float: right;'>
							<ul class="actions">
                        <li><input type="submit" style="float: right;" class="rg_submit" value=" next "></li>
                     </ul>
						</div>
				</form>
	</section>
		</div>
		</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
</body>
</html>