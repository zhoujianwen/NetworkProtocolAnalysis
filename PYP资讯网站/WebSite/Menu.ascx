<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="InformationServices.Menu" %>
<link href="Css/MenuStyle.css" type="text/css" rel="Stylesheet" />
<div id="navigation">
<ul>    
    <li><a href="index.aspx">首页</a></li>
    <li><a href="index.aspx">番职时事</a></li>
    <li><a href="index.aspx">学生会</a></li>
    <li><a href="index.aspx">学社联</a></li>
    <li><a href="index.aspx">党支部</a></li>
    <li><a href="JianJie.aspx">简介</a></li>
</ul>
<div style="background-image:url('../images/logo.png'); width:268px; height:72px; position:relative; float:left; top: -42px; left: 52px;"></div>
<div style=" position:relative; float:left; top:-37px; left:737px; width: 104px; height: 26px;">
    <table border="0" cellpadding="0"; cellspacing="0">
    <tr><td>
    <asp:TextBox ID="TextBox1" runat="server" Width="80px" Height="25px" Text="搜索文章"></asp:TextBox></td>
    <td><img src="../images/serachIco.png" height="27px"/></td>
    </tr>
    </table>
</div>
</div>

