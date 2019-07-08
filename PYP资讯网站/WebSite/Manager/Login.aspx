<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InformationServices.Manager.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body 
{
	margin-top: 0px; padding-top: 0px;
	margin-left:0px;
}
    #navigation
{
	font-family:微软雅黑,Verdana, Geneva, sans-serif;
		font-size:16px;
	width:1136px;
	height:81px;
	margin:0;
	padding:0;
	background:url(/images/cuboid.png);  
	font-weight:bold;
	}
#navigation ul
{
list-style-type:none;
padding:0px;
height:42px;
margin-left:420px;
position:relative;
bottom:-4px;
	left: -96px;
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
	text-align:center;
}
#navigation ul li
{
	float:left;
	height:42px;
	width:139px;
}

#navigation li a
{
		display:block;
		text-decoration:none;
		color:#ffffff;
		padding-top:10px;
		vertical-align:middle;
		text-align:center;
		height:32px;
}
#navigation li a:hover
{
			background-image: url(/images/cuboid_vister.png);    
}
    </style>
</head>
<body>
    <form id="form1" runat="server">


    <div style="margin:0 auto; padding:0px; width:100%;"> 
        <div id="navigation" style="margin:0 auto; padding:0px; width:100%;">
<div style="background-image:url('../images/pyphoutailogo.png'); width:523px; height:72px; position:relative; float:left; top: 3px; left: 63px;"></div>
<div style=" position:relative; float:left; top:-37px; left:737px; width: 104px; height: 26px;">
    <table border="0" cellpadding="0"; cellspacing="0">
    <tr><td>
    <asp:TextBox ID="TextBox1" runat="server" Width="80px" Height="25px" Text="搜索文章"></asp:TextBox></td>
    <td><img src="/images/serachIco.png" height="28px"/></td>
    </tr>
    </table>
</div>
</div>
    
    
    <!---------------------------------------->
<table id="__01" width="1024" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td colspan="8">
			<img id="login_01" src="../images/login/login_01.gif" width="1024" height="110" 
                alt="" /></td>
	</tr>
	<tr>
		<td rowspan="10">
			<img id="login_02" src="../images/login/login_02.gif" width="691" height="453" 
                alt="" /></td>
		<td colspan="6">
			<img id="login_03" src="../images/login/login_03.gif" width="284" height="45" 
                alt="" /></td>
		<td rowspan="10">
			<img id="login_04" src="../images/login/login_04.gif" width="49" height="453" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="6">
			<img id="login_05" src="../images/login/login_05.gif" width="284" height="13" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="6">
			<img id="login_06" src="../images/login/login_06.gif" width="74" height="124" 
                alt="" /></td>
		<td colspan="2" style=" background-image:url('../images/login/login_07.gif')" width="192" height="25">
              <asp:TextBox ID="txtUserName" runat="server" BorderStyle="None" width="180px" 
                  Height="23px"></asp:TextBox></td>
		<td colspan="2" rowspan="6">
			<img id="login_08" src="../images/login/login_08.gif" width="18" height="124" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<img id="login_09" src="../images/login/login_09.gif" width="192" height="14" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="2" style=" background-image:url('../images/login/login_10.gif');" width="188" height="25">
           
             <asp:TextBox ID="txtPassWord" runat="server" BorderStyle="None"
                ontextchanged="txtPassWord_TextChanged" width="180px" Height="23px"></asp:TextBox>
           
        </td>
	</tr>
	<tr>
		<td colspan="2">
			<img id="login_11" src="../images/login/login_11.gif" width="192" height="18" 
                alt="" /></td>
	</tr>
	<tr>
		<td style=" background-image:url('../images/login/login_12.png');" width="99" 
            height="25">
            
			<asp:TextBox ID="txtSecurityCode" runat="server" BorderStyle="None" 
                Height="17px" Width="43px"></asp:TextBox>
            <asp:Label ID="labSecurityCode" runat="server" BackColor="#323232" 
                BorderColor="White" BorderWidth="0px" Enabled="False" ForeColor="White" 
                Height="17px" style="margin-left: 0px" Text="Label" Width="40px"></asp:Label>
            
			</td>
		<td rowspan="2">
			<img id="login_13" src="../images/login/login_13.gif" width="93" height="42" 
                alt="" /></td>
	</tr>
	<tr>
		<td>
			<img id="login_14" src="../images/login/login_14.gif" width="99" height="17" 
                alt="" /></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img id="login_15" src="../images/login/login_15.gif" width="71" height="271" 
                alt="" /></td>
		<td colspan="4" width="198" height="38">
			<%--<img id="login_16" src="../images/login/login_16.png" width="198" height="38" 
                alt="" />--%>
                        <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" style="background-image:url('../images/login/login_16.png'); border-style:none;" 
                BorderStyle="None" Width="198px" Height="38px"/>
        </td>
		<td rowspan="2">
			<img id="login_17" src="../images/login/login_17.gif" width="15" height="271" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="4">
			<img id="login_18" src="../images/login/login_18.gif" width="198" height="233" 
                alt="" /></td>
	</tr>
	<tr>
		<td colspan="8">
			<img id="login_19" src="../images/login/login_19.gif" width="1024" height="205" 
                alt="" /></td>
	</tr>
	<tr>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="691" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="71" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="3" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="99" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="93" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="3" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="15" 
                height="1" alt="" /></td>
		<td>
			<img src="../images/login/&#x5206;&amp;#x9694;&amp;#x7b26;.gif" width="49" 
                height="1" alt="" /></td>
	</tr>
</table>

                <div style="position:relative;float:left; top:0px; left:453px;">
             </div>
<div style="position:relative;float:left; top: 0px; left:0px;"></div>

        

</div>
    </form>
</body>
</html>
