<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmRegItem.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegItem" 
    Culture="auto" UICulture="auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvItem" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ITEM&nbsp;
                                <br />
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
                                                                    Familia</td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboFiltroFamilia" runat="server" 
                                                                        AppendDataBoundItems="true" AutoPostBack="True" 
                                                                        onselectedindexchanged="cboFiltroFamilia_SelectedIndexChanged">
                                                                        <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;</td>
                                                                <td class="txt-box-estilo">
                                                                    SubFamilia</td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboFiltroSubFamilia" runat="server" 
                                                                        AppendDataBoundItems="true">
                                                                        <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" OnClick="btnBuscar_Click"
                                                                        Style="width: 100px" Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnNuevo" runat="server" CssClass="lnk" Height="26px" OnClick="btnNuevo_Click"
                                                                        Text="Nuevo" Width="101px" />
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
                            <td align="left" class="tit-nav-paginas">
                                <asp:UpdatePanel ID="upGvListaITem" UpdateMode="Conditional" runat="server">
                                <ContentTemplate>
                                <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" ViewStateMode="Enabled" OnRowEditing="gvListaItem_RowEditing"
                                    DataKeyNames="itm_c_iid" OnRowDeleting="gvListaItem_RowDeleting" 
                                        onpageindexchanging="gvListaItem_PageIndexChanging">
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
                                                <%# Eval("SIC_T_ITEM_SUB_FAMILIA.isf_c_ifm_des")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="SUBFAMILIA">
                                            <ItemTemplate>
                                                <%# Eval("SIC_T_ITEM_SUB_FAMILIA.isf_c_des")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:CommandField ShowEditButton="True" CancelText="Cancelar" 
                                            DeleteText="Eliminar" EditText="Editar" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server" onactivate="View2_Activate">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; ITEM &gt;
                                <asp:Label ID="lblAccion" runat="server"></asp:Label>
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="lnk" OnClick="btnGuardar_Click">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelar" runat="server" CssClass="lnk" OnClick="btnCancelar_Click">Cancelar</asp:LinkButton>
                                        </td>
                                        <td style="width: 10px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="style1">
                                            Código
                                        </td>
                                        <td align="left" class="style1">
                                            <asp:TextBox ID="txtCodigo" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                        <td align="left" class="style1">
                                            </td>
                                        <td align="left" class="style1">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Descripción
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="100"></asp:TextBox>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Unidad
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:DropDownList ID="cboUnidad" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Precio de Compra</td>
                                        <td align="left" class="txt-box-estilo">
                                   
                                            <asp:TextBox ID="txtPrecioCompra" runat="server" MaxLength="20"></asp:TextBox>
                                      
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Precio de Venta</td>
                                        <td align="left" class="txt-box-estilo">
                                  
                                            <asp:TextBox ID="txtPrecioVenta" runat="server" MaxLength="20"></asp:TextBox>
                                      
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Familia</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:DropDownList ID="cboFamilia" runat="server" AppendDataBoundItems="true" 
                                                AutoPostBack="True" onselectedindexchanged="cboFamilia_SelectedIndexChanged">
                                                <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            SubFamilia</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:DropDownList ID="cboSubFamilia" runat="server" AppendDataBoundItems="true">
                                                <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                        <td align="left" class="style2">
                                            Todos los campos son obligatiorios</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
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
                    <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />    
                    <asp:PostBackTrigger ControlID="cboFamilia" />                
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
