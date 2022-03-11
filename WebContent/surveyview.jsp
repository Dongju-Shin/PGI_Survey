<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>PGI 설문조사</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<script type="text/javascript">
	function modify_click(url_param) {

		var isCheck = false;

		for (j = 1; j <= 40; j++) {

			isCheck = check_radio('L' + j);
			if (!isCheck) {
				break;
			}
		}

		if (isCheck) {

			for (j = 1; j <= 40; j++) {

				isCheck = check_radio('C' + j);
				if (!isCheck) {
					break;
				}
			}

		}

		if (isCheck) {

			if (confirm('설문조사를 완료 하시겠습니까?')) {

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

			alert('선택하지 않은 문항이 있습니다.');
			document.fm[RadioName][0].focus();
			return false;
		}
	}

	function f_logout() {
		if (confirm('설문을 종료하고 나가시겠습니까? 기존의 설문은 삭제됩니다.')) {

		location.href = "member?command=ing_logout";
		

		}
		
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
            <li class="active" style="background-color:white;"><font color="black">&nbsp;&nbsp;40직무 능력 설문&nbsp;&nbsp;</font></li>
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
				<form name="fm" method="post" action="occupation"
					onsubmit="return modify_click(this);">
					<input type="hidden" name="command" value="occupation_lc_write">

					<h3>2. 40가지 직무에 대한 선호도/수행 능력 설문조사</h3>

					<div class="table-wrapper">
						아래 나열된 척도를 사용하여 다음 각 직무에 대해 두 번 응답하십시오. 한 번은 활동을 얼마나 좋아하는지, 한 번은
						활동을 수행할 수 있는 능력 또는 역량에 대해 설명합니다. 활동에 대한 선호는 1 = "완전히 싫어함"에서 7 =
						"매우 좋아함"까지 점수를 매겨 이러한 활동을 얼마나 좋아하거나 싫어하는 지에 대한 생각을 표시하십시오. 활동 수행
						능력은 1 = "전혀 가능하지 않음"에서 7 = "매우 가능함", 5 점으로 점수를 매겨 이러한 활동을 할 수 있는지
						확인하는 자신의 능력을 평가합니다.

						<table>
							<tr>
								<th></th>
								<th>직무에 대한 선호</th>
								<th>완전히 <br>싫어함
								</th>
								<th>싫어함</th>
								<th>약간 <br>싫어함
								</th>
								<th>보통 <br>이다
								</th>
								<th>약간 <br>좋아함
								</th>
								<th>좋아함</th>
								<th>매우 <br>좋아함
								</th>
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
										name="L${occDesc.occNumber}" type="radio"
										id="demo-priority-low1 ${occDesc.occNumber}" value="1" checked /><label
										for="demo-priority-low1 ${occDesc.occNumber}"></label></td>


									<td style="text-align: center"><input
										name="L${occDesc.occNumber}" type="radio"
										id="demo-priority-low2 ${occDesc.occNumber}" value="2" /><label
										for="demo-priority-low2 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="L${occDesc.occNumber}"
										id="demo-priority-low3 ${occDesc.occNumber}" type="radio"
										value="3" /><label
										for="demo-priority-low3 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="L${occDesc.occNumber}"
										id="demo-priority-low4 ${occDesc.occNumber}" type="radio"
										value="4" /><label
										for="demo-priority-low4 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="L${occDesc.occNumber}"
										id="demo-priority-low5 ${occDesc.occNumber}" type="radio"
										value="5" /><label
										for="demo-priority-low5 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="L${occDesc.occNumber}"
										id="demo-priority-low6 ${occDesc.occNumber}" type="radio"
										value="6" /><label
										for="demo-priority-low6 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="L${occDesc.occNumber}"
										id="demo-priority-low7 ${occDesc.occNumber}" type="radio"
										value="7" /><label
										for="demo-priority-low7 ${occDesc.occNumber}"></label></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="table-wrapper">
						아래 나열된 척도를 사용하여 다음 각 직무에 대해 두 번 응답하십시오. 한 번은 활동을 얼마나 좋아하는지, 한 번은
						활동을 수행할 수 있는 능력 또는 역량에 대해 설명합니다. 활동에 대한 선호는 1 = "완전히 싫어함"에서 7 =
						"매우 좋아함"까지 점수를 매겨 이러한 활동을 얼마나 좋아하거나 싫어하는 지에 대한 생각을 표시하십시오. 활동 수행
						능력은 1 = "전혀 가능하지 않음"에서 7 = "매우 가능함", 5 점으로 점수를 매겨 이러한 활동을 할 수 있는지
						확인하는 자신의 능력을 평가합니다.
						<table>
							<tr>
								<th></th>
								<th>직무 수행 능력</th>
								<th>전혀<br>가능<br>하지<br>않음
								</th>
								<th>가능<br>하지<br>않음
								</th>
								<th>약간<br>가능<br>하지<br>않음
								</th>
								<th>보통<br>이다
								</th>
								<th>약간<br>가능함
								</th>
								<th>가능함</th>
								<th>매우<br>가능함
								</th>
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
										name="C${occDesc.occNumber}" type="radio"
										id="demo-priority-lowc1 ${occDesc.occNumber}" value="1"
										checked /><label
										for="demo-priority-lowc1 ${occDesc.occNumber}"></label></td>


									<td style="text-align: center"><input
										name="C${occDesc.occNumber}" type="radio"
										id="demo-priority-lowc2 ${occDesc.occNumber}" value="2" /><label
										for="demo-priority-lowc2 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="C${occDesc.occNumber}"
										id="demo-priority-lowc3 ${occDesc.occNumber}" type="radio"
										value="3" /><label
										for="demo-priority-lowc3 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="C${occDesc.occNumber}"
										id="demo-priority-lowc4 ${occDesc.occNumber}" type="radio"
										value="4" /><label
										for="demo-priority-lowc4 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="C${occDesc.occNumber}"
										id="demo-priority-lowc5 ${occDesc.occNumber}" type="radio"
										value="5" /><label
										for="demo-priority-lowc5 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="C${occDesc.occNumber}"
										id="demo-priority-lowc6 ${occDesc.occNumber}" type="radio"
										value="6" /><label
										for="demo-priority-lowc6 ${occDesc.occNumber}"></label></td>

									<td style="text-align: center"><input
										name="C${occDesc.occNumber}"
										id="demo-priority-lowc7 ${occDesc.occNumber}" type="radio"
										value="7" /><label
										for="demo-priority-lowc7 ${occDesc.occNumber}"></label></td>
								</tr>
							</c:forEach>
						</table>
					</div>

					<div style="float: right;">
						<ul class="actions">
							<li><input type="submit" class='btn' name='btn' value='완료'
								style="float: right;"></li>
						</ul>
					</div>

				</form>
			</section>

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