<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="frmMantImpresoras.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmMantImpresoras" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 20px;
        }
        .style2
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 20px;
            width: 210px;
        }
        .style3
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            width: 210px;
        }
        .style4
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #686168;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvFacturacionAutomatica" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwMain" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                CONFIGURACÓN &gt; IMPRESORA</td>
                            <td align="right">
                                &nbsp;
                            </td>
                        </tr>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="txt-box-estilo">
                                                <tr>
                                                    <td align="left" class="style4" colspan="4">
                                                        <strong>Impresora</strong></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1" colspan="4">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style2">
                                                        Ruta&nbsp; Impresora</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                        <asp:TextBox ID="txtDireccion" runat="server" Width="552px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                        <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
                                                            Text="Guardar" Height="26px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style2">
                                                    </td>
                                                    <td align="left" class="style1" colspan="2">
                                                    </td>
                                                    <td class="style1">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            <asp:UpdatePanel ID="upMensaje" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="divPopUpMsg" class="PopupOcultar" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" width="800px">
                            <tr>
                                <td>
                                    <uc1:Mensaje ID="ucMensaje" Visible="false" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
