<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmReporteItem.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Reporte.frmReporteItem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                                REPORTE &gt;&nbsp; ITEM
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
                                                                                            Código
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFiltroCodigo" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                        </td>
                                                                                        <td class="txt-box-estilo">
                                                                                            Descripción
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtFiltroDescr" runat="server" CssClass="ipt_150x20"></asp:TextBox>
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
                                                                                            Familia
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="cboFiltroFamilia" runat="server" AppendDataBoundItems="true"
                                                                                                AutoPostBack="True" OnSelectedIndexChanged="cboFiltroFamilia_SelectedIndexChanged">
                                                                                                <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td class="txt-box-estilo">
                                                                                            SubFamilia
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="cboFiltroSubFamilia" runat="server" AppendDataBoundItems="true">
                                                                                                <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                                            </asp:DropDownList>
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
                                                                                            <asp:Button ID="btnFiltrar" runat="server" CssClass="button small gris"
                                                                                                Style="width: 100px" Text="Buscar" onclick="btnFiltrar_Click" />
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
                                                        <asp:UpdatePanel ID="upGvListaITem" UpdateMode="Conditional" runat="server">
                                                            <ContentTemplate>
                                                                <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                                                    PageSize="15" BorderWidth="0px" ViewStateMode="Enabled" 
                                                                    DataKeyNames="itm_c_iid" 
                                                                    onpageindexchanging="gvListaItem_PageIndexChanging" >
                                                                    <AlternatingRowStyle CssClass="alt" />
                                                                    <Columns>
                                                                        <asp:BoundField DataField="itm_c_ccodigo" HeaderText="CÓDIGO" />
                                                                        <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="DESCRIPCIÓN" />
                                                                        <asp:TemplateField HeaderText="PRECIO COMPRA">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_c_dprecio_compra"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PRECIO VENTA">
                                                                            <ItemTemplate>
                                                                                <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_c_dprecio_venta"))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="itm_c_vpardes" HeaderText="UNIDAD DE MEDIDA" />
                                                                        <asp:TemplateField HeaderText="FAMILIA">
                                                                            <ItemTemplate>
                                                                                <%# Eval("SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA.ifm_c_des")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SUB FAMILIA">
                                                                            <ItemTemplate>
                                                                                <%# Eval("SIC_T_ITEM_SUB_FAMILIA.isf_c_vdesc")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <PagerStyle CssClass="pgr" />
                                                                </asp:GridView>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
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
