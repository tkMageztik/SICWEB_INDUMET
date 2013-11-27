<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucMenuDinamico.ascx.cs" Inherits="SIC.UserLayer.UserControl.wucMenuDinamico1" %>
<asp:Menu ID="MnDinamico" runat="server" Font-Bold="False" 
    CssClass="FondoMenu"
    style="text-align: left" Orientation="Horizontal"
    DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="8" 
    ForeColor="#284E98" StaticSubMenuIndent="18px" >
      <StaticMenuStyle BorderColor="DimGray" Height="18px" Font-Size ="10" Font-Names="Arial, Helvetica, sans-serif" />

      <StaticMenuItemStyle BorderColor="Black" Font-Bold="True" Height="18px" 
          Font-Size ="9" Font-Names="Arial, Helvetica, sans-serif"
          ForeColor="MidnightBlue" Width="100%" HorizontalPadding="5px" 
          ItemSpacing="18px" VerticalPadding="2px" />

      <StaticSelectedStyle BackColor="#284E98"  Height="18px" Font-Bold="True" 
          Font-Size ="8" Font-Names="Arial, Helvetica, sans-serif" />
           
      <DynamicHoverStyle BackColor="#0FAEDA" Height="18px"
          Font-Names="Arial, Helvetica, sans-serif" Font-Size ="9" ForeColor="White" />

      <DynamicMenuStyle BackColor="#B5C7DE" BorderColor="DimGray" BorderStyle="Solid"
          BorderWidth="1px" HorizontalPadding="5px" />
      <DynamicSelectedStyle BackColor="#507CD1" Font-Bold="True" Height="18px" Width="100%"  
          Font-Size ="9" Font-Names="Arial, Helvetica, sans-serif" />
      <DynamicMenuItemStyle ForeColor="MidnightBlue" Height="18px" Font-Size ="9" 
          Font-Names="Arial, Helvetica, sans-serif" HorizontalPadding="5px" Width="100px" 
          VerticalPadding="2px"/>
</asp:Menu>
