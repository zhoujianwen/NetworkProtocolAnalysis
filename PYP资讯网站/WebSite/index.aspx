<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="InformationServices.index" %>

<%@ Register src="Wrapper.ascx" tagname="Wrapper" tagprefix="uc1" %>
<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc2" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc3" %>

<%@ Register src="NewsSpanDataList.ascx" tagname="NewsSpanDataList" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>番职资讯</title>
<style type="text/css">
</style>
<link href="Css/IndexStyle.css" type="text/css" rel="Stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div id="container">
	<div id="banner"> 
        <uc3:Menu ID="Menu1" runat="server" />
    </div>
    <div id="WrapperBox" style=" position:relative; top:10px; left: 0px;">
        <div style="left: 13px; position:relative; width:526px; height:auto; top: -30px;">
        <uc1:Wrapper ID="Wrapper1" runat="server" />
        </div>
         <div style="background-image:url('/images/dujiazhuti.png');width:44px; height:42px; position:relative; top: -314px; left: 957px;"></div>
         <div style=" background-image:url('/images/jingruzhuti.png'); width:101px; height:37px; position:relative;top: -130px; left: 932px;"></div>
         <div style="position:relative; top: -385px; left: 551px; width: 396px; height: 213px;">
             <asp:Repeater ID="RepeaterNews" runat="server">
             <HeaderTemplate><table border="0" cellpadding="0" cellspacing="0" width="100%"></HeaderTemplate>
             <ItemTemplate><tr>
                    <td style="width:5px"><img src="images/block.png"/></td>
                    <td><a href="NewsContent.aspx?id=<%# Eval("Id") %>&StyleId=<%#Eval("StyleId")%>" target="_blank"><%#Eval("Title") %></td></a>
                    <td><%# Eval("IssueDate","{0:yyyy-MM-dd}")%></td>
                    </tr>
                    <tr style="height:5px;"><td></td><td></td><td></td></tr>
             </ItemTemplate>
             <FooterTemplate></table></FooterTemplate>
             </asp:Repeater>
        </div>
    </div>
    <div id="BaseContent" style=" margin-top:25px;">
	<div id="content">
                <!--子版块1-->
             <div id="other">
            <table border="0" cellpadding="0" cellspacing="0" width="673px">
            <tr><td align="left">最新资讯</td></tr>
            <tr class="line" style="height:1px; width:673px"><td><hr></td></tr>
            </table>
            </div>
			<div><uc4:NewsSpanDataList ID="PypNews" runat="server" /></div>
			<div><uc4:NewsSpanDataList ID="XueShenghui" runat="server" /></div>
            <div><uc4:NewsSpanDataList ID="XueSheLian" runat="server" /></div>
             <div><uc4:NewsSpanDataList ID="DangZiBu" runat="server" /></div>
	</div>
    <!--子版块2-->
	<div id="links" style="">
        <div style="width:325px; height:247px; background-image:url('images/xiaoxing.png'); margin:0 auto; margin-top:15px; margin-bottom:15px;">
        </div>
        <%#Eval("Title") %>
            <table border="0" cellpadding="0" cellspacing="0" width="336px" style="">
                    <tr><td colspan="2"><span style="font-size:18px; font-weight:bold">热门信息</span></td></tr>
                    <tr class="line" style="height:1px; width:336px"><td colspan="2"><hr/></td></tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="336px" style=" position:relative;top:35px">
                    <tr><td width="78px"><img src="../images/ad1.png" alt="电子商务协会"/></td><td><a href="index.aspx">电子商务协会</a><br />
                        <br />
                        <a href="index.aspx">第一届电子商务网络营销主题活动设计大赛</a></td></tr>
                        <tr><td>
                            <br />
                            </td><td></td></tr>
                    <tr><td><img src="../images/ad2.png" alt=""/></td><td><a href="index.aspx">玉湖书画社</a><br />
                        <br />
                        <a href="index.aspx">玉湖书画社第五届书画大赛宣传片</a></td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="../images/ad3.png" alt=""/></td><td><a href="index.aspx">信息工程学院第四届电脑节</a><br />
                        <br />
                        <a href="index.aspx">信息工程学院PPT作品制作大赛</a></td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="../images/ad4.png" alt=""/></td><td><a href="index.aspx">信息工程学院第四届电脑节</a><br />
                        <br />
                        <a href="index.aspx">“放飞梦想，绽放自我”网页设计大赛</a></td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="../images/ad5.png" alt=""/></td><td><a href="index.aspx">番职KAB创业俱乐部</a><br />
                        <br />
                        <a href="index.aspx">公益创业，开启创业之门</a></td></tr>
                </table>
	</div>
    </div>
	<div id="footer">
        <uc2:footer ID="footer1" runat="server" />
    </div>
</div>
</form>
</body>
</html>
