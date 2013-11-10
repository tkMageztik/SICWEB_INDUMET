<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SIC.UserLayer._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Button" />
  
    <br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
  
</asp:Content>
