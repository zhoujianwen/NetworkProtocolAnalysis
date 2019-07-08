<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="InformationServices.Manager.AddMember" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript">
    <!--
        function checkPassWord()	//验证密码格式是否正确；
        {
            var password = document.getElementById("txtPwd");
            if (password.value.length < 8) {
                document.getElementById("pwdError").innerHTML = "<font color ='red'>密码必须大于或等于8位</font>"
                //document.loginform.txtPassWord.focus();
                return false;
            }
            document.getElementById("pwdError").innerHTML = "";
            return true;
        }
        function checkPassWord2() {
            if (document.getElementById("txtPwd").value != document.getElementById("txtPwd2").value) {
                document.getElementById("pwdError2").innerHTML = "<font color ='red'>密码与确认密码输入不一致！</font>"
                return false;
            }
            document.getElementById("pwdError2").innerHTML = "";
            return true;
        }
        function checkEmail()	//验证邮箱格式
        {
            var email = document.getElementById("txtEmail").value;
            var part = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
            if (!part.test(email))		//如果检测的格式不正确，就会返回false，所以使用!false=true
            {
                document.getElementById("errorEmail").innerHTML = "<font color='red'>邮箱格式不正确！</font>";
                return false;
            }
            document.getElementById("errorEmail").innerHTML = "";
            return true;
        }
        function checkName()	//验证帐号格式是否正确；
        {
            var name = document.getElementById("txtUserName").value;
            if (name == "") {
                document.getElementById("usrNameError").innerHTML = "<font color='red'>帐号不能为空！</font>";
                return false;
            }
            else if (name.length < 6) {
                document.getElementById("usrNameError").innerHTML = "<font color='red'>帐号必须大于6位！</font>";
                return false;
            }
            else {
                document.getElementById("usrNameError").innerHTML = "";
                return true;
            }
        }
        function clearTxt()	//清空所有txtError内容
        {
            document.getElementById("usrNameError").innerHTML = "";
            document.getElementById("pwdError").innerHTML = "";
            document.getElementById("pwdError2").innerHTML="";
            //document.getElementById("errorEmail").innerHTML = "&nbsp;";
        }
        function checkAll()	//检测用户注册的必填信息是否完整
        {
            if (checkName() && checkPassWord() && checkPassWord2()) {
                return true;
            }
            alert('用户信息填写不完整');
            return false;
        }
        

    -->
    </script>
    <style type="text/css">

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="datalist">
    <tr><td colspan="4">添加管理员</td></tr>
    <tr><td></td><td>新帐号</td><td>
        <input maxlength="20" id="txtUserName" runat="server" type="text" onblur ="checkName()"/></td><td><span id="usrNameError"></span></td></tr>
    <tr><td></td><td>新密码</td><td>
        <input id="txtPwd" type="password" runat="server" onchange="checkPassWord()"/></td><td><span id="pwdError"></span></td></tr>
    <tr><td></td><td>确认密码</td><td>
        <input id="txtPwd2" type="password" runat="server" onchange="checkPassWord2()"/></td><td><span id="pwdError2"></span></td></tr>
    <tr align="center"><td></td>
    <td colspan="2">
        <asp:Button ID="btnSubmit" runat="server" Text="确定" j="return checkAll()" 
            onclick="btnSubmit_Click"/>&nbsp;&nbsp;&nbsp;
        <input id="Reset" type="reset" value="重置" style="height:26px; width:86px" onclick="clearTxt()"/>
        </td>
        <td></td></tr>
    </table>
    </div>
    </form>
</body>
</html>
