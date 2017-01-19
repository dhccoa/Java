<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	
		
			String path = request.getContextPath();
			String project = this.getServletContext().getContextPath();
		
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

	
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<title>登山证信息提交</title>
		<script type="text/javascript" src="js/jquery-1.12.1.js"> </script>
		<script type="text/javascript" src="js/jquery.form.js"> </script>
		<style type="text/css">
html {
	margin: 0px;
	height: 100%;
}

body,div {
	margin: 0px;
	padding: 0px;
	font-family: Tahoma, Microsoft YaHei;
	-webkit-font-smoothing: antialiased;
	-webkit-text-stroke-width: 0.2px;
	-moz-osx-font-smoothing: grayscale;
}

html,body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	width: 100%
}

.submitTB {
	background: #999
}

.submitTB th {
	background: #FFF;
	line-height: 45px;
	height: 45px;
	text-align: right;
	padding: 0px 10px 0px 0px
}

.submitTB td {
	background: #FFF;
	line-height: 45px;
	height: 45px;
	text-align: left;
	padding: 0px 0px 0px 10px
}

input {
	width: 200px;
	height: 25px;
	line-height: 25px
}

select {
	width: 205px;
	height: 35px;
	line-height: 35px
}

H1 {
	text-align: center;
	font-size: 30px
}

H2 {
	font-size: 20px;
	color: #C00
}

H3 {
	font-size: 20px;
	color: #0C9
}

H4 {
	font-size: 20px;
	color: #999
}

H5 {
	font-size: 20px;
	color: #09F
}

H6 {
	text-align: center
}

.submitBut {
	width: 200px;
	height: 40px;
	line-height: 40px;
	font-size: 20px
}
 input.c1{border:1px solid #ccc;}
input.c2{border:1px dashed #F00}
 input.c3{border:1px solid #009980}
.c_cont input[type='text']:hover, .c_cont input[type='password']:hover, .c_cont input[type='email']:hover,.c_cont textarea:hover,.c_cont select:hover{ background:#cae9ce;border:1px dashed #009980}
span.d1{color:#acacac}
span.d2{color:#F00}
span.d3{color:#009980}
</style>
	</head>

	<body>
	<% 
	  
		String msgStr =(String)request.getAttribute("msgStr"); 
		//System.out.println("提示信息:"+msgStr);
	%>
		<H1> 
			d登山证集中办理登记(非泰山区户口福利) 
		</H1>
		<H2>
			往年政策：泰安市非泰山区户口需缴纳500元/年，非泰安户籍一般不予办理
		</H2>
		<H3>
			今年政策：东华员工在泰安交纳1年以上社保，！！凭借公司介绍信和社保证明！！，缴纳100元/年（自费）集体办理
		</H3>
		<H4>
			泰山游览年卡（有限期1年）适用范围：泰山（127元门票）、岱庙（30元门票）、普照寺、红门宫、王母池、玉泉寺。清明节、五一节和国庆节限制使用年卡，其他时间不限次数，超过有效期限重办。
		</H4>
		<H5>
			泰安社保证明自助打印地址http://124.130.146.14:8002/hso/logon_370900.jsp（可查询社保登陆密码）
		</H5>




		<form id="registform"  method="post" >

			<table width="100%" border="0" class="submitTB" cellpadding="1"
				cellspacing="1">

				<tr>
					<th width="150px">
						姓名
					</th>
					<td width="400px">
						<input type="text" name="username" id="username" onblur="check_username()"/>
						<span id="username_msg">2-10个汉字</span>
					</td>
					<td>
						与身份证相同
					</td>
				</tr>
				<tr>
					<th>
						部门
					</th>
					<td>
						<select name="dept">
							<option value="1">
								行政
							</option >
							<option value="2">
								医疗
							</option>
							<option value="3">
								金融
							</option>
							<option value="4">
								网管
							</option >
							<option value="5">
								技术
							</option>
							<option value="6">
								重点
							</option>
							<option value="7">
								特种
							</option>
							<option value="0">
								其他
							</option>
						</select>
					</td>
					<td>
						请选择
					</td>
				</tr>
				<tr>
					<th>
						身份证号
					</th>
					<td>
						<input type="text" name="num" id="num" onblur="check_IDnum()" />
						<span id="num_msg">请输入身份证号</span>
					</td>
					<td>
						请仔细检查
					</td>
				</tr>

				<!--    <tr>
    <th>社保登陆密码</th>
    <td><input type="password"/></td>
    <td>如自助打印，可不填写</td>
  </tr>-->


				<tr>
					<th>
						手机号码
					</th>
					<td>
						<input type="text" name="phone" id="phone" onblur="check_phone()"/>
						<span id="phone_msg">请输入手机号</span>
					</td>
					<td>
						请仔细检查
					</td>
				</tr>

			</table>

			<H6>
				<input type="button" value="提 交" class="submitBut" onclick="regist()">
				</input>
			</H6>
		</form>
	
	</body>
	<script type="text/javascript">
		if($.trim("<%=msgStr%>")!=""&& "null" != $.trim("<%=msgStr%>")){
				alert("<%=msgStr%>");
		}
		 //检测用户名
	function check_username(){
		//alert($('#username').val())
		//$('#username_msg').html("");
		//非空检查
		var val=$('#username').val()
		//格式检查
		if($.trim(val)==""){
			$("#username").removeClass().addClass("c2");
			$('#username_msg').html('用户名不能为空');
			$('#username_msg').removeClass().addClass("d2");
			return false;
		}
		var pattern=/^[\u4e00-\u9fa5]{2,10}$/;
		if(!pattern.test(val)){
		
			$("#username").removeClass().addClass("c2");
			$('#username_msg').html('用户名格式不对')
			$('#username_msg').removeClass().addClass("d2");
			return false;
		}else{
			$("#username").removeClass().addClass("c3");
			$('#username_msg').html('验证通过✔')
			$('#username_msg').removeClass().addClass("d3");
			return true;
		}
	}
	//获取ajax对象
	function getXhr(){
		var xhr=null;
		if(window.XMLHttpRequest){
		//非ie浏览器
		xhr=new XMLHttpRequest();
		}else{
			xhr=new ActiveXObject("Microsoft.XMLHttp")
		}
		return xhr;
	}
	
    //检测用户名
	function check_IDnum(){
		//alert($('#username').val())
		//$('#username_msg').html("");
		//非空检查
		var val=$('#num').val();
		//格式检查
		if($.trim(val)==""){
			$("#num").removeClass().addClass("c2");
			$('#num_msg').html('身份证号不能为空');
			$('#num_msg').removeClass().addClass("d2");
			return false;
		}
		var pattern=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(!pattern.test(val)){
		
			$("#num").removeClass().addClass("c2");
			$('#num_msg').html('身份证格式不对')
			$('#num_msg').removeClass().addClass("d2");
			return false;
		}else{
			//$("#num").removeClass().addClass("c3");
			//$('#num_msg').html('验证通过✔')
			//$('#num_msg').removeClass().addClass("d3");
				//检查用户名是否被占用，需要使用ajax
		var flag=false;
		var xhr=getXhr();
		
		//要想得到返回值，必须用false
		xhr.open('post','check_IDnum.do',false);
		xhr.setRequestHeader('content-type','application/x-www-form-urlencoded');
		xhr.onreadystatechange=function(){
							if(xhr.readyState==4){
							var txt=xhr.responseText;
							
							//alert("返回："+txt);
							if(txt=='ok'){
								$("#num").removeClass().addClass("c3");
								$('#num_msg').html('验证通过✔')
								$('#num_msg').removeClass().addClass("d3");		
								flag=true;
									//return true;
							//alert("验证通过✔") 
							}else if(txt=='error'){
								$("#num").removeClass().addClass("c2");
								$('#num_msg').html('此用户已存在')
								$('#num_msg').removeClass().addClass("d2");
									flag=false;
								//	alert("验证失败")
							}
						}
					};
		xhr.send('num='+$('#num').val());
				
		return flag;
		}
		
		
	}
	//检测手机号
	function check_phone(){
		//alert($('#username').val())
		//$('#username_msg').html("");
		//非空检查
		var val=$('#phone').val();
		//格式检查
		if($.trim(val)==""){
			$("#phone").removeClass().addClass("c2");
			$('#phone_msg').html('手机号不能为空');
			$('#phone_msg').removeClass().addClass("d2");
			return false;
		}
		var pattern= /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
		if(!pattern.test(val)){
		
			$("#phone").removeClass().addClass("c2");
			$('#phone_msg').html('手机号格式不对')
			$('#phone_msg').removeClass().addClass("d2");
			return false;
		}else{
			$("#phone").removeClass().addClass("c3");
			$('#phone_msg').html('验证通过✔');
			$('#phone_msg').removeClass().addClass("d3");
			return true;
			
		
		}
		
	}
	function beforeSub(){
		var flag =check_username()&&check_IDnum()&&check_phone();
		//alert("marriage:"+check_marriage())
		if(!flag){
			alert("请输入必填信息!")
		}
		return flag;
	}
	//添加新用户
	function regist(){
		if(beforeSub()){
			$("#registform").ajaxSubmit({
			            type: "post",
			            url: "regist.do",
			            success: function (data) {
	       				//alert(data)
			            	if(data=="ok"){
			            		alert("提交成功")
				            	//clearInterval(timer);
			            		window.location.href="<%=project%>";
							}else{
								alert("提交失败");
								window.location.href="<%=project%>";
							}
							
			            },
			            error: function (msg) {
			              	alert("连接错误失败"); 
			            }
			});
		}
		
	}
	</script>
</html>
