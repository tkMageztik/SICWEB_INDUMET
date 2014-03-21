<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReporteVenta.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Reporte.frmReporteVenta" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td class="tit-nav-paginas" align="left">
            FACTURACIÓN &gt; VENTA
        </td>
    </tr>
    <tr>
        <td class="txt2" align="left" colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" class="box-estilo01">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="txt-box-estilo">
                                                RUC
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroRuc" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td class="txt-box-estilo">
                                                Razón Social
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroRS" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="txt-box-estilo">
                                                Desde
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtFiltroFecIni_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                    TargetControlID="txtFiltroFecIni" TodaysDateFormat="dd/MM/yyyy" />
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td class="txt-box-estilo">
                                                Hasta
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtFiltroFecFin_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                    TargetControlID="txtFiltroFecFin" TodaysDateFormat="dd/MM/yyyy" />
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
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
                                                <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" Style="width: 100px"
                                                    Text="Buscar" OnClick="btnBuscar_Click" />
                                            </td>
                                            <td align="center">
                                                        <asp:Button ID="btnReporte" 
                                                    runat="server" CssClass="button small gris"
                                                                                                Style="width: 100px" 
                                                    Text="Reporte" onclick="btnReporte_Click" />
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
        <tr>
            <td align="left" class="tit-nav-paginas">
                        <asp:GridView ID="gvListaVenta" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                            GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                            PageSize="15" BorderWidth="0px" DataKeyNames="ven_c_iid" 
                            OnPageIndexChanging="gvListaVenta_PageIndexChanging">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:TemplateField HeaderText="RUC CLIENTE">
                                    <ItemTemplate>
                                        <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="RAZ. SOCIAL CLIENTE">
                                    <ItemTemplate>
                                        <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="TIPO DOCUMENTO" DataField="ven_c_vdestipodoc" />
                                <asp:BoundField HeaderText="MONEDA" DataField="ven_c_vdescmoneda" />
                                <asp:TemplateField HeaderText="MONTO TOTAL">
                                    <ItemTemplate>
                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("ven_c_etotal"))%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="FECHA DE REGISTRO" DataField="ven_c_zfecha" />
                            </Columns>
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>

            </td>
        </tr>
</table>
                                    </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnReporte" />
        </Triggers>
                </asp:UpdatePanel>
</asp:Content> 