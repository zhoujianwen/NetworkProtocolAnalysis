<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberEdit.aspx.cs" Inherits="InformationServices.Manager.MemberEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/ContentStyle.css" type="text/css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table class="datalist" style="position:relative;height:auto; width:100%">
    <tr><td>
        用户管理列表</td></tr>
    </table>
            <asp:GridView ID="gvMemberList" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ID"
            CssClass="datalist" style="border-top-style:hidden; position:relative;height:auto; width:100%"
            onpageindexchanging="gvMemberList_PageIndexChanging" 
            onrowdeleting="gvMemberList_RowDeleting" onrowediting="gvMemberList_RowEditing" 
            onrowupdating="gvMemberList_RowUpdating"
            onrowcancelingedit="gvMemberList_RowCancelingEdit">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="序号" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID">
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="用户名" SortExpression="Name" />
                <asp:BoundField DataField="PassWord" HeaderText="密码" 
                    SortExpression="PassWord" />
                <asp:TemplateField HeaderText="注册日期" SortExpression="AddDate">
                    <EditItemTemplate>
                        <asp:Calendar ID="calAddDate" runat="server" SelectedDate='<%# Bind("AddDate")%>' VisibleDate='<%# Bind("AddDate")%>'></asp:Calendar>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("AddDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
