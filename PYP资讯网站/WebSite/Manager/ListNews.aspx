<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListNews.aspx.cs" Inherits="InformationServices.Manager.ListNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="datalist" width="600px">
    <tr><td>输入关键字：</td><td>
        <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
        </td><td>
            <asp:DropDownList ID="ddlNewsStyle" runat="server" Height="25px" Width="90px">
            </asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="站内搜索" 
                onclick="btnSearch_Click" />
        </td></tr>
    </table>
        <asp:GridView ID="gvNewsList" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID" Width="600px" 
            onrowdeleting="gvNewsList_RowDeleting" 
            onpageindexchanging="gvNewsList_PageIndexChanging" CssClass="datalist" style="border-top-style:hidden;">  <%--DataSourceID="NewsDataSource"--%>
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Title" HeaderText="新闻标题" SortExpression="Title" />
                <asp:BoundField DataField="StyleName" HeaderText="新闻范围" 
                    SortExpression="StyleId" />
                <asp:BoundField DataField="TypeName" HeaderText="新闻类别" 
                    SortExpression="TypeId" />
                <asp:BoundField DataField="IssueDate" HeaderText="发布日期" 
                    SortExpression="IssueDate" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:HyperLinkField DataNavigateUrlFields="ID,TypeName" 
                    DataNavigateUrlFormatString="Edit.aspx?ID={0}&amp;TypeName={1}" 
                    HeaderText="编辑" Target="right" 
                    Text="编辑" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True"/>
            </Columns>
        </asp:GridView>
<%--        <asp:SqlDataSource ID="NewsDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PYPNewsConnectionString %>" 
            SelectCommand="SELECT [ID], [Title], [Content], [StyleId], [TypeId], [IssueDate] FROM [News]">
        </asp:SqlDataSource>--%>
<%--    </td></tr>
    </table>--%>
    </div>
    </form>
</body>
</html>
