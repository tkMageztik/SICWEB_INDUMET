<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmAlmacenes.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Almacen.frmAlmacenes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="tit-nav-paginas" style="text-align: left;">
            ALMACÉN &gt; ALMACENES</div>
        <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="false"
            runat="server">
            <ContentTemplate>
                <asp:MultiView ID="mvAlmacenes" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vwListaAlmacenes" runat="server">
                        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" class="box-estilo01">
                                    <table width="100%">
                                        <tr>
                                            <td class="txt-box-estilo">
                                                Almacén
                                            </td>
                                            <td class="txt-box-estilo">
                                                <asp:DropDownList ID="cboAlmacen" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td style="margin-left: 80px">
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td class="txt-box-estilo">
                                            </td>
                                            <td>
                                                &nbsp;
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
                                            <td style="margin-left: 80px" colspan="2">
                                                <table width="100%">
                                                    <tr>
                                                        <td class="txt-box-estilo" style="font-weight: bold;">
                                                            Cantidad:
                                                        </td>
                                                        <td class="txt-box-estilo">
                                                            &nbsp; Desde &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtCantidadDesde" runat="server" MaxLength="17"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="txtCantidadDesde_FilteredTextBoxExtender"
                                                                runat="server" Enabled="True" TargetControlID="txtCantidadDesde" ValidChars="0123456789.">
                                                            </ajaxToolkit:FilteredTextBoxExtender>
                                                        </td>
                                                        <td class="txt-box-estilo">
                                                            &nbsp; Hasta &nbsp;
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtCantidadHasta" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="txtCantidadHasta_FilteredTextBoxExtender"
                                                                runat="server" Enabled="True" TargetControlID="txtCantidadHasta" ValidChars="0123456789.">
                                                            </ajaxToolkit:FilteredTextBoxExtender>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="margin-left: 80px" class="txt-box-estilo">
                                                Cod. Item
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCodItem" runat="server"></asp:TextBox>
                                            </td>
                                            <td class="txt-box-estilo">
                                                Desc. Item
                                            </td>
                                            <td style="width: 20px">
                                                <asp:TextBox ID="txtDescItem" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="margin-left: 80px" class="txt-box-estilo">
                                                Familia
                                            </td>
                                            <td style="margin-left: 80px">
                                                <asp:DropDownList ID="cboFamilia" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cboFamilia_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="txt-box-estilo" style="margin-left: 80px">
                                                Subfamilia
                                            </td>
                                            <td>
                                                <asp:UpdatePanel ID="upCboSubFamilia" UpdateMode="Conditional" runat="server">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="cboSubFamilia" runat="server">
                                                        </asp:DropDownList>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="cboFamilia" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td class="txt-box-estilo">
                                                &nbsp;
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" OnClick="btnBuscar_Click"
                                                    Style="width: 100px" Text="Buscar" />
                                            </td>
                                            <td>
                                                <asp:Button ID="btExportar" runat="server" CssClass="button small gris" Style="width: 100px"
                                                    Text="Exportar" OnClick="btExportar_Click" />
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                            <tr>
                                <td align="left" class="tit-nav-paginas">
                                    <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvItemsAlmacen" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                                GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                                AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                                PageSize="15" BorderWidth="0px">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="COD. ITEM">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DESC. ITEM">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="FAMILIA">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA.ifm_c_des")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SUBFAMILIA">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.SIC_T_ITEM_SUB_FAMILIA.isf_c_vdesc")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="COD. ALMACEN" DataField="alm_c_iid" />
                                                    <asp:TemplateField HeaderText="DESC. ALMACEN">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ALMACEN.alm_c_vdesc")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="STOCK" DataField="itm_alm_c_ecantidad" />
                                                    <asp:TemplateField HeaderText="PRE. COMPRA">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.itm_c_dprecio_compra")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PRE. VENTA">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_ITEM.itm_c_dprecio_venta")%>
                                                        </ItemTemplate> 
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="vwTransItems" runat="server">
                        <div>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
