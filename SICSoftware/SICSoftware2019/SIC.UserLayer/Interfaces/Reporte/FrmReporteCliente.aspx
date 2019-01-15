<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmReporteCliente.aspx.cs"
    Inherits="SIC.UserLayer.Interfaces.Reporte.FrmReporteCliente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
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
                                REPORTE &gt;&nbsp; KARDEX
                            </td>
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
                                                    <td align="left" class="txt-box-estilo" colspan="4">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="left" class="box-estilo01">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="txt-box-estilo">
                                                                                            Razón Social :
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFiltroRazonSocial" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                        </td>
                                                                                        <td class="txt-box-estilo">
                                                                                            RUC :
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRuc" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td align="center">
                                                                                            <asp:Button ID="btnFiltrar" runat="server" CssClass="button small gris" OnClick="btnFiltrar_Click"
                                                                                                Style="width: 100px" Text="Buscar" />
                                                                                            <asp:Button ID="btnReporte" runat="server" CssClass="button small gris" OnClick="btnReporte_Click"
                                                                                                Style="width: 100px" Text="Reporte" />
                                                                                        </td>
                                                                                        <td align="center">
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
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="4">
                                                        <asp:GridView ID="gvLista" runat="server" AllowPaging="True" AlternatingRowStyle-CssClass="alt"
                                                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" PagerStyle-CssClass="pgr"
                                                            PageSize="15" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" onpageindexchanging="gvLista_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="RUC" ItemStyle-HorizontalAlign="Center"
                                                                    Visible="true">
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="cli_c_vraz_soc" HeaderText="RAZÓN SOCIAL" ItemStyle-Width="35%">
                                                                    <ItemStyle Width="35%" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="cli_c_vrubro" HeaderText="RUBRO" ItemStyle-Width="35%">
                                                                    <ItemStyle Width="35%" />
                                                                </asp:BoundField>
                                                                <%--  <asp:TemplateField HeaderText="TIPO">
                                                                            <ItemTemplate>
                                                                                <%# (Boolean.Parse(Eval("cli_c_bgrupo_ibk").ToString())) ? "AFILIADO" : "NO AFILIADO"%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>--%>
                                                            </Columns>
                                                            <HeaderStyle />
                                                            <PagerStyle HorizontalAlign="left" />
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
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
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1" colspan="2">
                                                    </td>
                                                    <td class="style1">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
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
                                                    <td align="left" class="txt-box-estilo">
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
            <asp:PostBackTrigger ControlID="btnReporte" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
