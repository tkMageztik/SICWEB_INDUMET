<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SIC.UserLayer._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    
    <style type="text/css">
        .miDiv
        {

            position : absolute;    
            width:320px;
            height:130px;
            left:43%;
            top:45%;
            margin-left:-100px;
            margin-top:-100px;
            border:solid 1px gray;
            padding:15px;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            -khtml-border-radius: 20px;
            border-radius: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
    <div class="miDiv">
        <table>
            <tr>
                <td><b>Usuario:</b></td>
                <td><asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><b>Contraseña:</b></td>
                <td><asp:TextBox ID="txtClave" runat="server" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="color:Red"><asp:Label ID="lblMensaje" runat="server"></asp:Label></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td align="right">
                    
                    <asp:Button ID="btnIngresar" runat="server" onclick="btnIngresar_Click" Text="Ingresar" CssClass="btn btn-info" />                  
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
