<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMovEntrada.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Movimientos.frmMovEntrada" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta2.ascx" TagName="Mensaje" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 19px;
        }
        .style2
        {
            height: 19px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvMovimientoEntrada" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwListaMovEnt" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA</td>
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
                                                                    
                                                                </td>
                                                                <td>
                                                                    
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    
                                                                </td>
                                                                <td>
                                                                    
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" OnClick="btnBuscar_Click"
                                                                        Style="width: 100px" Text="Buscar" Enabled="False" />
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
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                <asp:GridView ID="gvListaMovEn" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" DataKeyNames="mve_c_iid" 
                                        onselectedindexchanged="gvListaMovEn_SelectedIndexChanged" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Fecha" DataField="mve_c_dfecha" />                                        
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwInsModMovEnt" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt;
                                <asp:Label ID="lblAccion" runat="server"></asp:Label>
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="lnk" 
                                                onclick="btnGuardar_Click">Guardar</asp:LinkButton>
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
                        </tr>
                        <tr>
                            <td colspan="2" lign="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="style1">
                                                        <strong>Datos de la Guía</strong></td>
                                                    <td align="left" class="style2">
                                                        </td>
                                                    <td align="left" class="style1">
                                                        </td>
                                                    <td align="left" class="style1">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Serie - Número</td>
                                                    <td align="left" class="style1" style="margin-left: 120px">
                                                        <asp:TextBox ID="txtSerieGuia" runat="server" Width="35px"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtNumeroGuia" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        Fecha de Guía</td>
                                                    <td align="left" class="style1">
                                                        <asp:Calendar ID="calFechaGuia" runat="server"></asp:Calendar>
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        <strong>Datos de la Factura</strong></td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Serie - Número</td>
                                                    <td align="left" class="style1">
                                                        <asp:TextBox ID="txtSerieFact" runat="server" Width="35px"></asp:TextBox>
                                                        &nbsp;-&nbsp;<asp:TextBox ID="txtNumeroFact" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        Estado</td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboEstado" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        <strong>Datos del Almacén</strong></td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Almacén</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtAlmacen" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:LinkButton ID="btnBuscarAlmacen" runat="server" CssClass="lnk" 
                                                            onclick="btnBuscarAlmacen_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        <strong>Datos de la Orden de Compra</strong></td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Serie - Número</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtSerieNumeroOC" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:LinkButton ID="btnBuscarOC" runat="server" CssClass="lnk" 
                                                            onclick="btnBuscarOC_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items</td>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" AllowPaging="True" 
                                                            AlternatingRowStyle-CssClass="alt" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            EmptyDataText="No ha seleccionado ningun item." GridLines="None" 
                                                            Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" AutoGenerateColumns="False" DataKeyNames="mve_det_c_iid" 
                                                            onrowcancelingedit="gvItemsSeleccionados_RowCancelingEdit" 
                                                            onrowediting="gvItemsSeleccionados_RowEditing" 
                                                            onrowupdating="gvItemsSeleccionados_RowUpdating" 
                                                            onpageindexchanging="gvItemsSeleccionados_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Descripción">
                                                                <ItemTemplate>
                                                                        <%# Eval("mve_c_vdescripcion_item")%>
                                                                </ItemTemplate>  
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Can. Pedida">
                                                                    <ItemTemplate>
                                                                        <%# Eval("mve_c_ecant_pedida")%>
                                                                    </ItemTemplate>  
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Can. Recibida">
                                                                    <ItemTemplate>
                                                                        <%# Eval("mve_c_ecant_recibida")%>
                                                                    </ItemTemplate>  
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                

                                                                <asp:CommandField ShowEditButton="True" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
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
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwListaOrdenCompra" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; ORDENES DE COMPRA</td>
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
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
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
                                                                    <asp:Button ID="btnFiltrarOC" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px" Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeOC" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px; height: 26px;" Text="Regresar" 
                                                                        onclick="btnRegresarDesdeOC_Click" />
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
                                <asp:GridView ID="gvListaOC" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" 
                                        EmptyDataText="No hay datos disponibles." BorderWidth="0px" 
                                    DataKeyNames="odc_c_iid" PageSize="15" 
                                        onselectedindexchanged="gvListaOC_SelectedIndexChanged" 
                                        onpageindexchanging="gvListaOC_PageIndexChanging" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Proveedor"> 
                                            <ItemTemplate> 
                                                <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%> 
                                            </ItemTemplate> 
                                        </asp:TemplateField> 
                                        <asp:BoundField DataField="odc_c_vdescmoneda" HeaderText="Moneda" />
                                        <asp:BoundField DataField="odc_c_zfecha" HeaderText="Fecha Entrega" />
                                        <asp:BoundField DataField="odc_c_etotal" HeaderText="Total" />
                                        <asp:CommandField ShowSelectButton="True" />
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

                <asp:View ID="vwAlmacen" runat="server">
                    
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; ALMACÉN</td>
                        </tr>
                        <tr>
                            <td align="left" class="txt2" colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
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
                                                                    <asp:Button ID="btnFiltrarAlm" runat="server" CssClass="button small gris" 
                                                                        Style="width: 100px" Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeAlmacen" runat="server" 
                                                                        CssClass="button small gris" 
                                                                        Style="width: 100px; " Text="Regresar" 
                                                                        onclick="btnRegresarDesdeAlmacen_Click" />
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
                                <asp:UpdatePanel ID="upGvListaITem0" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvListaAlmacen" runat="server" AllowPaging="True" 
                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" DataKeyNames="alm_c_iid" 
                                            EmptyDataText="No hay datos disponibles." GridLines="None" 
                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" 
                                            Width="100%" onselectedindexchanged="gvListaAlmacen_SelectedIndexChanged" 
                                            onpageindexchanging="gvListaAlmacen_PageIndexChanging">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:BoundField DataField="alm_c_vdes" HeaderText="Almacén" />
                                                <asp:CommandField ShowSelectButton="True" />
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
                <asp:View ID="vwDetalleOC" runat="server">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; DETALLE OC</td>
                        </tr>
                        <tr>
                            <td align="left" class="txt2" colspan="2">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
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
                                                                    &nbsp;</td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDetOc" runat="server" 
                                                                        CssClass="button small gris" 
                                                                        Style="width: 100px; " Text="Regresar" 
                                                                        onclick="btnRegresarDetOc_Click" />
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
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvOCDetalle" runat="server" AllowPaging="True" 
                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                            DataKeyNames="odc_c_iitemid" EmptyDataText="No ha seleccionado ningun item." 
                                            GridLines="None" Height="16px" 
                                            PagerStyle-CssClass="pgr" 
                                            ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" Width="100%">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="SELECCIONAR"> 
                                                    <ItemTemplate> 
                                                        <asp:CheckBox ID="chkSelect" runat="server" /> 
                                                    </ItemTemplate> 
                                                </asp:TemplateField> 
                                                <asp:TemplateField HeaderText="Código">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Descripción">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cantidad">
                                                    <ItemTemplate>
                                                        <%# Eval("ocd_c_icantidad")%>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtCantidad0" runat="server"></asp:TextBox>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Precio">
                                                    <ItemTemplate>
                                                        <%# Eval("odc_c_eprecio")%>
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
                            <td align="left" class="tit-nav-paginas">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
            <asp:UpdatePanel ID="upMensaje" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="divPopUpMsg" class="PopupMostrar" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" width="800px">
                        <tr>
                            <td>
                                <uc1:Mensaje ID="ucMensaje" Visible="false" runat="server" />
                                <uc2:Mensaje ID="ucMensaje2" Visible="false" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvListaOC" EventName="RowDeleting" />
            </Triggers>
        </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
