<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="InformationServices.Manager.Edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
</head>
<script type="text/javascript">
<!--

-->
</script>
<body>
    <form id="form1" runat="server">
    <div>
<table class="datalist">
<tr><td colspan="3" align="center"> 
    <asp:Label ID="labStyleName" runat="server" Text="LabelStyleName"></asp:Label>
    </td></tr>
<tr><td>新闻类别：</td><td>
    <asp:DropDownList ID="ddNewsType" runat="server" Height="30px" Width="124px">
    </asp:DropDownList>
    </td><td></td></tr>
<tr><td>新闻标题：</td><td>
    <asp:TextBox ID="txtNewsTitle" runat="server" Width="194px"></asp:TextBox>
    (建议控制在15个字符以内)</td><td>**</td></tr>
<tr><td>新闻内容：</td><td>
    <asp:TextBox ID="txtNewsContent" runat="server" Height="294px" TextMode="MultiLine" 
        Width="636px"></asp:TextBox>
    </td><td>**</td></tr>
<tr><td></td><td align="center">
    <asp:Button ID="btnSubmit" runat="server" Text="保存" Height="28px" 
        Width="81px" onclick="btnSubmit_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="btnReset" runat="server" Text="重置" Height="28px" Width="81px" 
        onclick="btnReset_Click" />
    </td><td></td></tr>
</table>
    </div>
    </form>
</body>
</html>
