<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Left.aspx.cs" Inherits="InformationServices.Manager.left" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
    <style type="text/css">
    <!--
    
    //-->
    </style>
</head>
<script type="text/javascript">
<!--
    function moreInfo(menu) {
        var info = document.getElementById(menu);
        if (info.style.display == "none")
            info.style.display = "";
        else
            info.style.display = "none"
    }
-->
</script>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>            <table class="datalist" width="180px"></HeaderTemplate>
        <ItemTemplate>
<%--            <table class="datalist" width="180px">--%>
                <tr>
                    <td id="StyleName" colspan="2" onclick="moreInfo('<%# Eval("StyleId") %>')" style="background-image:url('../images/title.png')">
                        <%# Eval("StyleName") %>
                    </td>
                </tr>
<%--            </table>--%>
<%--            <div id="<%# Eval("StyleId") %>" style="display: none">--%>
  <%--              <table class="datalist" width="180px" style=" position:relative; top:-1px;">--%>
                    <tr id="<%# Eval("StyleId") %>" style="display: none;">
                        <td id="AddContent" style=" text-align:center;">
                            <a href="AddNews.aspx?id=<%# Eval("StyleId") %>" target="right">添加</a>
                        </td>
                        <td id="Manager" style=" text-align:center;">
                            <a href="ListNews.aspx?id=<%# Eval("StyleId") %>"  target="right">管理</a>
                        </td>
                    </tr>
        <%--        </table>--%>
<%--            </div>--%>
<%--            <table border="0">--%>
                <tr>
                    <td colspan="2" style="height:15px; border-left-style:none; border-bottom-style:none; border-right-style:none; ">
                    </td>
                </tr>
<%--            </table>--%>
        </ItemTemplate>
   <FooterTemplate>
<%--                <table class="datalist" width="180px">--%>
                    <tr onclick="moreInfo('MemberSet')">
                        <td colspan="2" style="background-image:url('../images/title.png');">
                            管理员设置
                        </td>
                    </tr>
                    <tr id="MemberSet" style="display: none">
                        <td style=" text-align:center; ">
                            <a href="AddMember.aspx" target="right">添加</a>
                        </td>
                        <td style=" text-align:center;">
                            <a href="MemberEdit.aspx" target="right">管理</a>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<a href="../index.aspx" target="_parent">返回首页</a>&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="Login.aspx" target="_parent">注销</a></td></tr>
                </table>
    </FooterTemplate>
</asp:Repeater>
    </form>
</body>
</html>
