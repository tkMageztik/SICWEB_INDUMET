<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmKardex.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Reporte.frmKardex" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
                                REPORTE &gt;&nbsp; CLIENTE
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
                                                                                            Desde :
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                                                            <asp:CalendarExtender ID="txtFiltroFecIni_CalendarExtender" runat="server" 
                                                                                                Format="dd/MM/yyyy" TargetControlID="txtFiltroFecIni" 
                                                                                                TodaysDateFormat="dd/MM/yyyy" />
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                        </td>
                                                                                        <td class="txt-box-estilo">
                                                                                            Hasta :
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                                                            <asp:CalendarExtender ID="txtFiltroFecFin_CalendarExtender" runat="server" 
                                                                                                Format="dd/MM/yyyy" TargetControlID="txtFiltroFecFin" 
                                                                                                TodaysDateFormat="dd/MM/yyyy" />
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
                                                                                            <asp:Button ID="btnReporte" runat="server" CssClass="button small gris" 
                                                                                                Style="width: 100px" Text="Reporte" onclick="btnReporte_Click" />
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
                                                        <asp:GridView ID="gvLista" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" PagerStyle-CssClass="pgr"
                                                            PageSize="15" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" AutoGenerateColumns="False" AllowPaging="True" 
                                                            onpageindexchanging="gvLista_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <HeaderStyle />
                                                                <Columns>
                                                                        <asp:TemplateField HeaderText="Item">
                                                                            <ItemTemplate>
                                                                                <%# Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Almacen">
                                                                            <ItemTemplate>
                                                                                <%# Eval("SIC_T_ALMACEN.alm_c_vdesc")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>                                                                        
                                                                        <asp:TemplateField HeaderText="Entrada - Cantidad">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("EntradaCantidad"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Entrada - Precio">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("EntradaPrecio"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Entrada - Total">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("EntradaTotal"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Salida - Cantidad">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("SalidaCantidad"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Salida - Precio">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("SalidaPrecio"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Salida - Total">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("SalidaTotal"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
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
