<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello Doggy :: Join Us</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="join.jsp">회원 가입</a></li>
<li><a href="deleteForm.jsp">회원 탈퇴</a></li>
<li><a href="../mail/mailForm.jsp">문의 사항</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<script type="text/javascript">
	function checkIt(){
		var doc = document.fr;

		if(doc.id.value == "") {
			alert("ID를 입력하세요!");
			doc.id.focus();
			return false;
		}
		
		if(doc.idDupChk.value == "t"){
			doc.pw.focus();
		} else {
			alert("아이디 중복 확인이 필요합니다!");
			return false;
		}

		if(doc.pw.value == "") {
			alert("비밀번호를 입력하세요!");
			doc.pw.focus();
			return false;
		}
		
		if(doc.pw2.value != doc.pw.value) {
			alert("비밀번호를 확인하세요!");
			doc.pw2.focus();
			return false;
		}
		
		if(doc.name.value == "") {
			alert("이름을 확인하세요!");
			doc.name.focus();
			return false;
		}

		if(doc.email.value == "") {
			alert("이메일을 확인하세요!");
			doc.email.focus();
			return false;
		}		
	}

	/* checkIt() */
	
	/* usedIDPopup */
	function usedIDPopup(){
		window.open('usedID.jsp','','width=300, height=300');
	}
	/* usedIDPopup */
	

</script>


<article>
<h1><font color="pink">Join Us</font></h1>
<form action="memberInsert.jsp" method="post" id="join" name="fr" onsubmit="return checkIt()">
<fieldset>
<legend>기본 정보 입력</legend>
<label>아이디</label>
<input type="text" name="id" class="id">
<input type="hidden" name="idDupChk" value="f" />
<input type="button" value="중복 확인" class="dup" onclick="usedIDPopup()"><br>
<label>비밀번호</label>
<input type="password" name="pw"><br>
<label>비밀번호 확인</label>
<input type="password" name="pw2"><br>
<label>이름</label>
<input type="text" name="name"><br>
<label>이메일</label>
<input type="email" name="email"><br>
</fieldset>

<fieldset>
<legend>추가 옵션</legend>

<label>주소</label>
<input type="text" name="address1" id="sample4_postcode" placeholder="우편번호">
<input type="button" class="dup" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>

<label> </label>
<input type="text" name="address2" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" name="address3" id="sample4_jibunAddress" placeholder="지번주소"><br>
<span id="guide" style="color:#999;display:none"></span>
<label> </label>
<input type="text" name="address4" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" name="address5" id="sample4_extraAddress" placeholder="참고항목"><br>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
</script>


<label>전화</label>
<input type="text" name="tel"><br>
<label>휴대폰</label>
<input type="text" name="mobile"><br>

<label>반려견 소개 & 원하는 친구</label>
<textarea name="trait" rows="10" cols="60" 
	placeholder="
최고의 친구를 만나기 위해 소개를 적어주세요!

1. 나의 반려견 소개  (ex : 이름, 견종, 성격 등등...)
2. 선호하는 친구 강아지 유형  (ex : 소형견 중형견 대형견...)
3. 주로 산책하는 시간대  (ex : 새벽 아침 점심 저녁 밤...)">
</textarea><br> 
</fieldset>

<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input type="reset" value="취소" class="cancel">
</div>

</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>