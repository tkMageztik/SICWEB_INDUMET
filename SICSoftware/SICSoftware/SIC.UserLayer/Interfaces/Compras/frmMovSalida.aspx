<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMovSalida.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Compras.frmMovSalida" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta2.ascx" TagName="Mensaje" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">    
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style3
        {
            height: 21px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>            
            <asp:MultiView ID="mvMovSalida" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwListaMovimiento" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                ALMACÉN &gt; MOVIMIENTOS DE ENTRADA
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
                                                                <td style="margin-left: 80px">
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
                                                                <td style="margin-left: 80px">
                                                                    <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                                    &nbsp;<asp:CalendarExtender ID="CalendarExtender1" runat="server"
                                                                        TargetControlID="txtFiltroVenDesde" Format="dd/MM/yyyy" 
                                                                        TodaysDateFormat="dd/MM/yyyy" />
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
                                            PageSize="15" BorderWidth="0px" DataKeyNames="mve_c_iid" 
                                            onselectedindexchanged="gvListaMovSal_SelectedIndexChanged" >
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>                                                 
                                                <asp:BoundField DataField="mvs_c_vdestiposalida" HeaderText="Tipo Salida" />
                                                <asp:BoundField HeaderText="Fecha" DataField="mve_c_zfecharegistro" />
                                                <asp:TemplateField HeaderText="RUC Cliente">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RAZÓN SOCIAL Cliente">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowSelectButton="True" SelectText="Ver" />
                                                <asp:ButtonField CommandName="Cerrar" Text="Cerrar" ButtonType="Link" />
                                                <asp:ButtonField CommandName="Anular" Text="Anular" ButtonType="Link" />    
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
                                            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="lnk" 
                                                onclick="btnGuardar_Click">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelar" runat="server" CssClass="lnk">Cancelar</asp:LinkButton>
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
                                                        Tipo movimiento</td>
                                                    <td align="left" class="style3" style="margin-left: 40px">
                                                        <asp:UpdatePanel ID="updTipoMov" UpdateMode="Conditional" runat="server">
                                                        <ContentTemplate>
                                                        <asp:DropDownList ID="cboTipoMovimiento" runat="server" 
                                                            AppendDataBoundItems="True" AutoPostBack="True">
                                                        </asp:DropDownList>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="6">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        <strong>Datos de la Venta</strong></td>
                                                    <td align="left" class="style1">
                                                        <asp:LinkButton ID="btnSeleccionarVenta" runat="server" CssClass="lnk" 
                                                            onclick="btnSeleccionarVenta_Click">Seleccionar Venta</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Cliente</td>
                                                    <td align="left" class="style1">
                                                        <asp:TextBox ID="txtRUCCli" runat="server" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True" 
                                                            Width="114px"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtRSCli" runat="server" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True" 
                                                            Width="282px"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnBuscarCliente" runat="server" CssClass="lnk" 
                                                            onclick="btnSeleccionarVenta_Click">Buscar Cliente</asp:LinkButton>
                                                        </td>
                                                    <td class="txt-box-estilo" align="left">
                                                        Fecha</td>
                                                    <td align="left" class="style1">
                                                        <asp:TextBox ID="txtFechaVenta" runat="server" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True" 
                                                            Width="114px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            DataKeyNames="" 
                                                            EmptyDataText="No ha seleccionado una venta." GridLines="None" Height="16px" 
                                                            PagerStyle-CssClass="pgr" 
                                                            ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" Width="100%" >
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
                                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("mvs_det_c_ecant"))%>
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
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
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
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Observaciones</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtObs" runat="server" Height="54px" MaxLength="350" 
                                                            TextMode="MultiLine" Width="462px"></asp:TextBox>
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
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
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
                                MANTENIMIENTO &gt; VENTA
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
                                                                        Text="Buscar" OnClick="btnBuscar_Click" />
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
                                                PageSize="15" BorderWidth="0px" DataKeyNames="ven_c_iid" 
                                                OnPageIndexChanging="gvListaVenta_PageIndexChanging" 
                                                onselectedindexchanged="gvListaVenta_SelectedIndexChanged">
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
                <asp:View ID="vwBuscarItem" runat="server">

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