<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top.aspx.cs" Inherits="InformationServices.Manager.top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/MenuStyle.css" type="text/css" rel="Stylesheet" />
</head>
<script type="text/javascript">
<!--
    var displayBar = true;
    function switchBar(obj) {
        if (displayBar) {
            parent.frame.cols = "0,*";
            displayBar = false;
//            obj.src = "../Images/admin_top_open.gif";
            obj.title = "打开左边管理菜单";
//            var navigation = document.getElementById("navigation").style
//            navigation.left = "-180px";
        } else {
            parent.frame.cols = "180,*";
            displayBar = true;
//            obj.src = "../Images/admin_top_close.gif";
            obj.title = "关闭左边管理菜单";
//            document.getElementById("navigation").style.textAlign = "center";
        }
    }
-->
</script>
<body>
    <form id="form1" runat="server">
    <div id="navigation" style="text-align:center;color:#ffffff;cursor:hand;margin:0 auto; padding:0px; width:100%;" onclick="switchBar('this')" alt="关闭左边管理菜单">
        <div style="background:url(../images/pyphoutailogo.png); width:523px; height:72px; position:relative;"></div>
    </div>
    </form>
</body>
</html>
