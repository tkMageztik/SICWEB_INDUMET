<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmMovSalida.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Compras.frmMovSalida" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta2.ascx" TagName="Mensaje" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/numeric_input.js") %>"></script>
            <script type="text/javascript">
                function Check_Click(objRef) {
                    //Get the Row based on checkbox
                    var row = objRef.parentNode.parentNode;

                    //Get the reference of GridView
                    var GridView = row.parentNode;

                    //Get all input elements in Gridview
                    var inputList = GridView.getElementsByTagName("input");

                    for (var i = 0; i < inputList.length; i++) {
                        //The First element is the Header Checkbox
                        var headerCheckBox = inputList[0];

                        //Based on all or none checkboxes
                        //are checked check/uncheck Header Checkbox
                        var checked = true;
                        if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                            if (!inputList[i].checked) {
                                checked = false;
                                break;
                            }
                        }
                    }
                    headerCheckBox.checked = checked;
                }

                function checkAll(objRef) {
                    var GridView = objRef.parentNode.parentNode.parentNode;
                    var inputList = GridView.getElementsByTagName("input");
                    for (var i = 0; i < inputList.length; i++) {
                        //Get the Cell To find out ColumnIndex
                        var row = inputList[i].parentNode.parentNode;
                        if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                            if (objRef.checked) {
                                inputList[i].checked = true;
                            }
                            else {

                                inputList[i].checked = false;
                            }
                        }
                    }
                }
            </script>
            <asp:MultiView ID="mvMovSalida" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwListaMovimiento" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                ALMACÉN &gt; MOVIMIENTOS DE SALIDA
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
                                                                    Desde
                                                                </td>
                                                                <td style="margin-left: 80px">
                                                                    <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                                    &nbsp;<asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFiltroVenDesde"
                                                                        Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Hasta
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtFiltroVenHasta"
                                                                        Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Estado</td>
                                                                <td style="margin-left: 80px">
                                                                    <asp:DropDownList ID="cboEstadoMovimiento" runat="server" 
                                                                        AppendDataBoundItems="True">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;</td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;</td>
                                                                <td>
                                                                    &nbsp;</td>
                                                                <td style="width: 20px">
                                                                    &nbsp;</td>
                                                                <td class="txt-box-estilo">
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
                                                                        Style="width: 100px; height: 26px;" Text="Buscar" />
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
                                <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvListaMovSal" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                            AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                            PageSize="15" BorderWidth="0px" DataKeyNames="mvs_c_iid" 
                                            OnSelectedIndexChanged="gvListaMovSal_SelectedIndexChanged" 
                                            onrowcommand="gvListaMovSal_RowCommand" 
                                            onpageindexchanging="gvListaMovSal_PageIndexChanging">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:BoundField DataField="mvs_c_vdestiposalida" HeaderText="Tipo Salida" />
                                                <asp:BoundField HeaderText="Fecha" DataField="mvs_c_zfecharegistro" />
                                                <asp:TemplateField HeaderText="Estado">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_MOV_ESTADO.mov_estado_vdescrpcion")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                                
                                                <asp:CommandField ShowSelectButton="True" SelectText="Modificar" />
                                                <asp:ButtonField CommandName="Cerrar" Text="Cerrar" ButtonType="Link" />
                                                <asp:ButtonField CommandName="Anular" Text="Anular" ButtonType="Link" />                                                
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnImprimir" runat="server" Text="Imprimir" 
                                                         Visible='<%# PuedeImprimir((int) Eval("mvs_c_itiposalida")) %>' 
                                                         CommandName="Imprimir" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="pgr" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwNuevoMovimiento" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; MOVIMIENTO SALIDA &gt;
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
                        </tr>
                        <tr>
                            <td colspan="2" lign="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Tipo movimiento
                                                    </td>
                                                    <td align="left" class="style3" style="margin-left: 40px">
                                                        <asp:UpdatePanel ID="updTipoMov" UpdateMode="Conditional" runat="server">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="cboTipoMovimiento" runat="server" AppendDataBoundItems="True"
                                                                    AutoPostBack="True" OnSelectedIndexChanged="cboTipoMovimiento_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="style1">
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
                                                    <td align="left" class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="style1">
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
                                                    <td align="left" class="txt-box-estilo" colspan="6">
                                                        <asp:Panel ID="pnlDatosSalVenta" runat="server">
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" class="txt-box-estilo">
                                                                        <strong>Datos de la Venta</strong>
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        <asp:LinkButton ID="btnSeleccionarVenta" runat="server" CssClass="lnk" OnClick="btnSeleccionarVenta_Click">Seleccionar Venta</asp:LinkButton>
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="txt-box-estilo">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="txt-box-estilo">
                                                                        Cliente
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        <asp:TextBox ID="txtRUCCli" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="114px"></asp:TextBox>
                                                                        &nbsp;-
                                                                        <asp:TextBox ID="txtRSCli" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="282px"></asp:TextBox>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td align="left" class="txt-box-estilo">
                                                                        Fecha
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        <asp:TextBox ID="txtFechaVenta" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="114px"></asp:TextBox>
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" class="style4">
                                                                    </td>
                                                                    <td align="left" class="style1">
                                                                    </td>
                                                                    <td class="style1">
                                                                    </td>
                                                                    <td class="style1">
                                                                    </td>
                                                                    <td align="left" class="style4">
                                                                    </td>
                                                                    <td align="left" class="style4">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
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
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" AlternatingRowStyle-CssClass="alt"
                                                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                            DataKeyNames="itm_c_iid,alm_c_iid" 
                                                            EmptyDataText="No ha seleccionado una venta." GridLines="None"
                                                            Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled"
                                                            Width="100%" onrowdatabound="gvItemsSeleccionados_RowDataBound">
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
                                                                        <asp:TextBox ID="txtCantidad" runat="server" Text='<%# Bind("mvs_det_c_ecant") %> '
                                                                            onkeypress="return onlyDotsAndNumbers(event)"></asp:TextBox>                                                                        
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Almacén">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_ALMACEN.alm_c_vdesc")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:LinkButton ID="btnBuscarItems" runat="server" CssClass="lnk" OnClick="btnBuscarItems_Click"
                                                            Text="Buscar Items" />
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
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Observaciones
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtObs" runat="server" Height="54px" MaxLength="350" TextMode="MultiLine"
                                                            Width="462px"></asp:TextBox>
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
                <asp:View ID="vwVenta" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; MOVIMIENTO DE SALIDA &gt; VENTA
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
                                                                    <asp:TextBox ID="txtFiltroVenRuc" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Razón Social
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroVenRS" runat="server"></asp:TextBox>
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
                                                                    <asp:TextBox ID="txtFiltroVenDesde" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFiltroVenDesde_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                                        TargetControlID="txtFiltroVenDesde" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Hasta
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroVenHasta" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFiltroVenHasta_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                                        TargetControlID="txtFiltroVenHasta" TodaysDateFormat="dd/MM/yyyy" />
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
                                                                    <asp:Button ID="btnBuscarVenta" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" OnClick="btnBuscarVenta_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegerserVenta" runat="server" CssClass="lnk" Height="26px" OnClick="btnRegerserVenta_Click"
                                                                        Text="Regresar" Width="101px" />
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
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvListaVenta" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                                GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                                AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                                PageSize="15" BorderWidth="0px" DataKeyNames="ven_c_iid" OnPageIndexChanging="gvListaVenta_PageIndexChanging"
                                                OnSelectedIndexChanged="gvListaVenta_SelectedIndexChanged">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="RUC CLIENTE">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="RAZ. SOCIAL CLIENTE">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
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
                                                    <asp:CommandField ShowSelectButton="true" SelectText="Seleccionar" />
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwListaItem" runat="server">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; MOVIMIENTO DE SALIDA &gt; SELECCIONAR ITEM<br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="txt2">
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
                                                                <td class="txt-box-estilo" style="width: 20px">
                                                                    Almacen
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboFiltroAlmacen" runat="server" AppendDataBoundItems="True">
                                                                    </asp:DropDownList>
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
                                                                    <asp:Button ID="btnFiltrarItems" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" OnClick="btnFiltrarItems_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeItems" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px; height: 26px;" Text="Regresar" OnClick="btnRegresarDesdeItems_Click" />
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
                                <asp:UpdatePanel ID="upGvListaITem" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvListaItem" runat="server" AllowPaging="True" AlternatingRowStyle-CssClass="alt"
                                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                            DataKeyNames="itm_alm_c_iid,itm_c_iid,alm_c_iid" EmptyDataText="No hay datos disponibles."
                                            GridLines="None" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled"
                                            Width="100%" OnRowDataBound="gvListaItem_RowDataBound" 
                                            onpageindexchanging="gvListaItem_PageIndexChanging" >
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                               <asp:TemplateField HeaderText="SELECCIONAR">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:checkAll(this);" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="javascript:Check_Click(this);" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CÓDIGO">
                                                    <ItemTemplate>
                                                        <%#Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DESCRIPCIÓN">
                                                    <ItemTemplate>
                                                        <%#Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="PRECIO VENTA">
                                                    <ItemTemplate>
                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("SIC_T_ITEM.itm_c_dprecio_venta"))%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="UNIDAD DE MEDIDA">
                                                    <ItemTemplate>
                                                        <%#Eval("SIC_T_ITEM.itm_c_vpardes")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ALMACEN">
                                                    <ItemTemplate>
                                                        <%#Eval("SIC_T_ALMACEN.alm_c_vdesc")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="STOCK">
                                                    <ItemTemplate>
                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_alm_c_ecantidad"))%>
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
                <asp:View ID="vwBuscarCliente" runat="server">
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
