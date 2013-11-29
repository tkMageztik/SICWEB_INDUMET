<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucMenuDinamico.ascx.cs"
    Inherits="SIC.UserLayer.UserControl.wucMenuDinamico" %>
<asp:Menu ID="MnDinamico" runat="server" Font-Bold="False" Orientation="Horizontal"
    Font-Names="Verdana" RenderingMode="List" IncludeStyleBlock="true" StaticEnableDefaultPopOutImage="False">
</asp:Menu>
<%--<!-- Load the Mootools Framework -->
	<script src="http://www.google.com/jsapi"></script><script>google.load("mootools", "1.2.1");</script>	
	
	<!-- Load the MenuMatic Class -->
	<script src="js/MenuMatic_0.68.3.js" type="text/javascript" charset="utf-8"></script>
	
	<!-- Create a MenuMatic Instance -->
<script type="text/javascript" >
    window.addEvent('domready', function () {
        var myMenu = new MenuMatic();
    });		
	</script>
--%>