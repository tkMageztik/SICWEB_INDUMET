<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="frmRegOC.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegOC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 59px;
        }
        .style3
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            width: 305px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvOC" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA
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
                                <asp:GridView ID="gvListaOC" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" DataKeyNames="odc_c_iid" 
                                        onrowediting="gvListaOC_RowEditing">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Código">
                                            <ItemTemplate>
                                                <%# Eval("SIC_T_PROVEEDOR.pro_c_vraz_soc")%>
                                            </ItemTemplate>                             
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Moneda" DataField="ocd_c_vdescmoneda" />
                                        <asp:BoundField HeaderText="Fecha Entrega" DataField="odc_c_zfecha" />
                                        <asp:BoundField HeaderText="Total" DataField="ocd_c_dtotal" />
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt;
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
                                                    <td align="left" class="txt-box-estilo">
                                                        Proveedor
                                                    </td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRSProv" runat="server" Width="282px" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:LinkButton ID="btnBuscarProveedor" runat="server" CssClass="lnk" 
                                                            OnClick="btnBuscarProveedor_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" rowspan="2">
                                                        Fecha Entrega
                                                    </td>
                                                    <td align="left" class="style1" rowspan="2">
                                                        <asp:Calendar ID="calFechaEntrega" runat="server"></asp:Calendar>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        Estado </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboEstado" runat="server" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1">
                                                        Moneda
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboMoneda" runat="server" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" AllowPaging="True" 
                                                            AlternatingRowStyle-CssClass="alt" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            EmptyDataText="No ha seleccionado ningun item." GridLines="None" 
                                                            Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" AutoGenerateColumns="False" DataKeyNames="ocd_c_iitemid" 
                                                            onrowcancelingedit="gvItemsSeleccionados_RowCancelingEdit" 
                                                            onrowediting="gvItemsSeleccionados_RowEditing" 
                                                            onrowupdating="gvItemsSeleccionados_RowUpdating">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
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
                                                                        <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Precio">
                                                                <ItemTemplate>
                                                                        <%# Eval("ocd_c_dprecio")%>
                                                                </ItemTemplate>  
                                                                </asp:TemplateField>

                                                                <asp:CommandField ShowEditButton="True" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnBuscarItems" runat="server" Text="Buscar Items" CssClass="lnk" 
                                                            onclick="btnBuscarItems_Click" />
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
                                                        I.G.V.&nbsp;(<asp:Label ID="lblIGV" runat="server" Text="18%"></asp:Label>
                                                        )</td>
                                                    <td align="left" class="style3">
                                                        <asp:Label ID="lblIGVCal" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Percepción (<asp:Label ID="lblPercepcion" runat="server" Text="2%"></asp:Label>
                                                        )</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;<asp:Label ID="lblPercepcionCal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Sub Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblSubTotal" runat="server" Text="[SubTotal]"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblTotal" runat="server" Text="[SubTotal]"></asp:Label>
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
            <asp:View ID="vwListaItem" runat="server">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt; SELECCIONAR ITEM<br />
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
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Button ID="btnBuscarItem" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px" Text="Buscar" onclick="btnBuscarItem_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeItems" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px; height: 26px;" Text="Regresar" 
                                                                        onclick="btnRegresarDesdeItems_Click" />
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
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" 
                                        EmptyDataText="No hay datos disponibles." BorderWidth="0px" ViewStateMode="Enabled" 
                                    DataKeyNames="itm_c_iid" onpageindexchanging="gvListaItem_PageIndexChanging" 
                                        onrowdatabound="gvListaItem_RowDataBound" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SELECCIONAR"> 
                                            <ItemTemplate> 
                                                <asp:CheckBox ID="chkSelect" runat="server" /> 
                                            </ItemTemplate> 
                                        </asp:TemplateField> 
                                        <asp:BoundField DataField="itm_c_ccodigo" HeaderText="CÓDIGO" />
                                        <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="DESCRIPCIÓN" />
                                        <asp:BoundField DataField="itm_c_dprecio" HeaderText="PRECIO" />
                                        <asp:BoundField DataField="itm_c_vpardes" HeaderText="UNIDAD DE MEDIDA" />
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
            <asp:View ID="vwProveedor" runat="server">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt; SELECCIONAR PROVEEDOR</td>
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
                                                                    &nbsp;</td>
                                                                <td align="center">
                                                                    &nbsp;</td>
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
                                <asp:UpdatePanel ID="upProveedor" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                <asp:GridView ID="gvProveedores" runat="server" BorderStyle="None"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" AutoGenerateColumns="False" 
                                        DataKeyNames="pro_c_vdoc_id" 
                                        onselectedindexchanged="gvProveedores_SelectedIndexChanged" 
                                        onpageindexchanging="gvProveedores_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:BoundField DataField="pro_c_vdoc_id" HeaderText="RUC" />
                                        <asp:BoundField DataField="pro_c_vraz_soc" HeaderText="Razón Social" />
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
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
