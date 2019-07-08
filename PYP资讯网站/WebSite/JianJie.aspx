<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JianJie.aspx.cs" Inherits="InformationServices.JiangJie" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc1" %>
<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
<style type="text/css">
</style>
<link href="Css/IndexStyle.css" type="text/css" rel="Stylesheet" />
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
<div id="container">
	<div id="banner"> 
        <uc1:Menu ID="Menu1" runat="server" />
    </div>
    <div id="BaseContent" style=" margin-top:25px;">
	<div id="content" style="background-color:#ffffff;">
                <!--子版块1-->
             <div id="other">
            <table border="0" cellpadding="0" cellspacing="0" width="673px">
            <tr><td align="left">非我莫属组员名单</td></tr>
            <tr class="line" style="height:1px; width:673px"><td><hr></td></tr>
            </table>
            </div>
			<div>

           <table border="0" cellpadding="0" cellspacing="0" style=" position:relative; width:99%;height:auto; table-layout: fixed;
word-wrap:break-word;">
              <tr onclick="moreInfo('1213430128')"><td><h1><a style=" text-decoration:underline;">周健文</a></h1></td></tr>
              <tr id="1213430128" style="display: none;"><td valign="top" ><p><img src="images/1213430128.bmp" alt="个人简历" /></p></td></tr>
              <tr onclick="moreInfo('1213430102')"><td><h1><a style=" text-decoration:underline;">陈家荣</a></h1></td></tr>
              <tr id="1213430102" style="display: none;"><td valign="top"><p><img src="images/1213430102.bmp" alt="个人简历" /></p></td></tr>
              <tr onclick="moreInfo('1213430109')"><td><h1><a style=" text-decoration:underline;">邝瑛鹏</a></h1></td></tr>
              <tr id="1213430109" style="display: none;"><td valign="top"><p><img src="images/1213430109.bmp" alt="个人简历" /></p></td></tr>
              </table>
            </div>
	</div>
    <!--子版块2-->
	<div id="links" style=" position:relative;">
        <div style="width:325px; height:247px; background-image:url('images/xiaoxing.png'); margin:0 auto; margin-top:15px; margin-bottom:15px;">
        </div>
<%--        <div><img src="/images/ad1.png" alt="电子商务协会"/>
            <div style=" position:relative; top: -74px; left: 81px; width: 237px;">电子商务协会<br />
            <br />第一届电子商务网络营销主题活动设计大赛</div>
            </div>--%>
            <table border="0" cellpadding="0" cellspacing="0" width="336px" style="">
                    <tr><td colspan="2"><span style="font-size:18px; font-weight:bold">热门信息</span></td></tr>
                    <tr class="line" style="height:1px; width:336px"><td colspan="2"><hr/></td></tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" width="336px" 
            style=" position:relative; margin-top:20px; margin-bottom:10px; left: 0px; top: 0px;">
                    <tr><td width="78px"><img src="/images/ad1.png" alt="电子商务协会"/></td><td>电子商务协会<br />
                        <br />
                        第一届电子商务网络营销主题活动设计大赛</td></tr>
                        <tr><td>
                            <br />
                            </td><td></td></tr>
                    <tr><td><img src="/images/ad2.png" alt=""/></td><td>玉湖书画社<br />
                        <br />
                        玉湖书画社第五届书画大赛宣传片</td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="/images/ad3.png" alt=""/></td><td>信息工程学院第四届电脑节<br />
                        <br />
                        信息工程学院PPT作品制作大赛</td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="/images/ad4.png" alt=""/></td><td>信息工程学院第四届电脑节<br />
                        <br />
                        “放飞梦想，绽放自我”网页设计大赛</td></tr>
                    <tr><td>
                        <br />
                        </td><td></td></tr>
                    <tr><td><img src="/images/ad5.png" alt=""/></td><td>番职KAB创业俱乐部<br />
                        <br />
                        公益创业，开启创业之门</td></tr>
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
