<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsSpanDataList.ascx.cs" Inherits="InformationServices.NewsSpanDataList" %>
<link href="Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
<%--<asp:DataList ID="DataList1" runat="server"  CellPadding="0" BorderWidth="0">
   
<ItemTemplate>
    <asp:Label ID="Label2" runat="server" Text="id"></asp:Label><%#Eval("id") %>
    <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label><%#Eval("name") %>
    <asp:Label ID="Label3" runat="server" Text="密码"></asp:Label><%#Eval("password") %>
    <asp:Label ID="Label4" runat="server" Text="注册日期"></asp:Label><%#Eval("adddate") %>


</ItemTemplate>
</asp:DataList>
--%>
<%--<div>
    <table class='datalist' cellpadding='0' cellspacing='0'>
    <tr><td>id</td><td>name</td><td>pwd</td><td>adddate</td></tr>
<% 
    for (int n = 0; n < this._Table.Rows.Count; n++)
   {
 %>
       <tr><td><%  Response.Write(_Table.Rows[n][0].ToString());%></td>
           <td><% Response.Write(_Table.Rows[n][1].ToString());%></td>
           <td><% Response.Write(_Table.Rows[n][2].ToString());%></td>
           <td><% Response.Write(_Table.Rows[n][3].ToString());%></td>
       </tr>
  <%
    }
%>    </table>
</div>--%>

<div id="Box" style="margin-top:20px; float:none; top: 0px; left: 0px;">
<div id="Caption"><span id="title" runat="server">学生会</span></div>
    <div id="Imgs">
    <img src="images/schlogoH156.png"/ style=" position:relative; top:20px"></div>
    <div id="TitleBlock"><span id="bottomTitle" runat="server">学生会</span></div>
    <div id="NewList" style=" overflow:hidden;">
            <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
            <table style="border-width:0px;border-style:none;">
            </HeaderTemplate>
            <ItemTemplate>
            <tr style="height:10px; vertical-align:middle;">
            <td style="width:5px"><img src="images/block.png"/></td>
            <td><a href="NewsContent.aspx?id=<%#Eval("Id")%>" target="_blank"><%# Eval("Title") %></a></td>
            <td><%# Eval("IssueDate","{0:yyyy-MM-dd}")%></td><tr>
            </ItemTemplate>
            <FooterTemplate>
            </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    
    <div id="BottomLine"></div>
</div>
