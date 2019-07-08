<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="InformationServices.Manager.AddNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
    <style type="text/css">
        #NewsContent
        {
            height: 631px;
            width: 680px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table border="1" cellpadding="0" cellspacing="0"
 style="border-collapse:collapse; border-color:#cccccc;">
  <tr>
    <td colspan="2" align="center" id="title" runat="server">信息添加
	</td>
  </tr>
  <tr>
    <td>新闻类别：</td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
      </td>
    
  </tr>
  <tr>
    <td>新闻标题：</td>
    <td><input id="NewsTitle" runat="server" type="text" style="width: 264px" />(建议控制在15个字符以内)</td>
  </tr>
  <tr>
    <td>新闻内容：</td>
    <td><textarea id="NewsContent" runat="server"></textarea></td>
  </tr>
  <tr>
    <td></td>
    <td align="center">
        <asp:Button ID="btnSubmit" runat="server" Height="32px" 
            onclick="btnSubmit_Click" Text="提交" Width="96px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReset" runat="server" 
            Height="32px" Text="重置" Width="96px" />
      </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
