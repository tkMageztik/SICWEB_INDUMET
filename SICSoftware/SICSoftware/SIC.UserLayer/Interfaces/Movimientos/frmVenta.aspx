<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmVenta.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Movimientos.frmVenta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta2.ascx" TagName="Mensaje" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            var TotalChkBx;
            var Counter;

            window.onload = function () {
                //Get total no. of CheckBoxes in side the GridView.
                TotalChkBx = parseInt('<%= this.gvListaItem.Rows.Count %>');

                //Get total no. of checked CheckBoxes in side the GridView.
                Counter = 0;
            }

            function HeaderClick(CheckBox) {
                //Get target base & child control.
                var TargetBaseControl =
       document.getElementById('<%= this.gvListaItem.ClientID %>');
                var TargetChildControl = "chkSelect";

                //Get all the control of the type INPUT in the base control.
                var Inputs = TargetBaseControl.getElementsByTagName("input");

                //Checked/Unchecked all the checkBoxes in side the GridView.
                for (var n = 0; n < Inputs.length; ++n)
                    if (Inputs[n].type == 'checkbox' &&
                Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                        Inputs[n].checked = CheckBox.checked;

                //Reset Counter
                Counter = CheckBox.checked ? TotalChkBx : 0;
            }

            function ChildClick(CheckBox, HCheckBox) {
                //get target control.
                var HeaderCheckBox = document.getElementById(HCheckBox);

                //Modifiy Counter; 
                if (CheckBox.checked && Counter < TotalChkBx)
                    Counter++;
                else if (Counter > 0)
                    Counter--;

                //Change state of the header CheckBox.
                if (Counter < TotalChkBx)
                    HeaderCheckBox.checked = false;
                else if (Counter == TotalChkBx)
                    HeaderCheckBox.checked = true;
            }
</script>
            <asp:MultiView ID="mvOC" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; VENTA</td>
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris"
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
                                <asp:GridView ID="gvListaVenta" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" DataKeyNames="ven_c_iid" 
                                        onrowediting="gvListaVenta_RowEditing" onrowdeleting="gvListaVenta_RowDeleting" 
                                        onpageindexchanging="gvListaVenta_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Código">
                                            <ItemTemplate>
                                                <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                            </ItemTemplate>                             
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Moneda" DataField="ven_c_vdescmoneda" />
                                        <asp:BoundField HeaderText="Fecha Entrega" DataField="ven_c_zfecha" />
                                        <asp:BoundField HeaderText="Total" DataField="ven_c_etotal" />
                                        <asp:CommandField ShowEditButton="True" CancelText="Cancelar" 
                                            DeleteText="Eliminar" EditText="Editar" />
                                        <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" />
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
                                MANTENIMIENTO &gt; VENTA &gt;
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
                                                        Cliente
                                                    </td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRSProv" runat="server" Width="282px" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnBuscarProveedor" runat="server" CssClass="lnk" 
                                                            OnClick="btnBuscarProveedor_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td class="style1">
                                                        Fecha</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblFechaRegistro" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Moneda
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboMoneda" runat="server" AutoPostBack="True" 
                                                            onselectedindexchanged="cboMoneda_SelectedIndexChanged" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        Tipo Documento</td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboTipoDocumento" runat="server" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" AllowPaging="True" 
                                                            AlternatingRowStyle-CssClass="alt" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            EmptyDataText="No ha seleccionado ningun item." GridLines="None" 
                                                            Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" AutoGenerateColumns="False" DataKeyNames="ven_det_c_iitemid" 
                                                            onrowcancelingedit="gvItemsSeleccionados_RowCancelingEdit" 
                                                            onrowediting="gvItemsSeleccionados_RowEditing" 
                                                            onrowupdating="gvItemsSeleccionados_RowUpdating">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Código">
                                                                    <ItemTemplate>
                                                                        <%# Eval("codigoItem")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción">
                                                                    <ItemTemplate>
                                                                        <%# Eval("descItem")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cantidad">
                                                                <ItemTemplate>
                                                                        <%# Eval("ven_det_c_ecantidad")%>
                                                                </ItemTemplate>  
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtCantidad" runat="server"
                                                                        Text='<%# Bind("ven_det_c_ecantidad") %> '>
                                                                        </asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Unitario">
                                                                <ItemTemplate>
                                                                        <%# Eval("ven_det_c_epreciounit")%>
                                                                </ItemTemplate>  
                                                                <EditItemTemplate>
                                                                        <asp:TextBox ID="txtPrecio" runat="server"
                                                                            Text='<%# Bind("ven_det_c_epreciounit") %> '>
                                                                        </asp:TextBox>
                                                                </EditItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="CxU">
                                                                <ItemTemplate>
                                                                        <%# Eval("ven_det_c_epreciototal")%>
                                                                </ItemTemplate>  
                                                                </asp:TemplateField>

                                                                <asp:CommandField ShowEditButton="True" CancelText="Cancelar" EditText="Editar" 
                                                                    UpdateText="Actualizar" />
                                                                <asp:TemplateField HeaderText="Unit. Ref. (Soles)">
                                                                    <ItemTemplate>
                                                                        <%# Eval("precioReferenciaSoles")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
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
                                                        &nbsp;Tasa de Cambio</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblTC" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                 <tr>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;
                                                     </td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
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
                                                        &nbsp;</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Sub Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblSubTotal" runat="server" Text="[SubTotal]"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
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
                                                        &nbsp;</td>
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
                                MANTENIMIENTO &gt; VENTA &gt; SELECCIONAR ITEM<br />
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
                                        onrowdatabound="gvListaItem_RowDataBound" 
                                        onrowcreated="gvListaItem_RowCreated" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SELECCIONAR"> 
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:HeaderClick(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate> 
                                                <asp:CheckBox ID="chkSelect" runat="server" /> 
                                            </ItemTemplate> 
                                        </asp:TemplateField> 
                                        <asp:BoundField DataField="itm_c_ccodigo" HeaderText="CÓDIGO" />
                                        <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="DESCRIPCIÓN" />
                                        <asp:BoundField DataField="itm_c_dprecio_compra" HeaderText="PRECIO" />
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
                                MANTENIMIENTO &gt; VENTA &gt; SELECCIONAR CLIENTE</td>
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
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    <table>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <asp:Button ID="btnFiltroProveedor" runat="server" CssClass="button small gris" 
                                                                                    Style="width: 100px" Text="Buscar" />
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Button ID="btnRegresarDesdeProveedor" runat="server" 
                                                                                    CssClass="button small gris" onclick="btnRegresarDesdeProveedor_Click" 
                                                                                    Style="width: 100px; height: 26px;" Text="Regresar" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
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
                                <asp:GridView ID="gvCliente" runat="server" BorderStyle="None"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" AutoGenerateColumns="False" 
                                        DataKeyNames="cli_c_vdoc_id" 
                                        onselectedindexchanged="gvCliente_SelectedIndexChanged" 
                                        onpageindexchanging="gvCliente_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="RUC" />
                                        <asp:BoundField DataField="cli_c_vraz_soc" HeaderText="Razón Social" />
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
                <asp:AsyncPostBackTrigger ControlID="gvListaVenta" EventName="RowDeleting" />
            </Triggers>
        </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

