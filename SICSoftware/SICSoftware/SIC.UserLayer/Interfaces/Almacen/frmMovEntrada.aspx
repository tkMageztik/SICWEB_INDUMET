<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmMovEntrada.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Movimientos.frmMovEntrada"
    Culture="es-PE" UICulture="es-PE" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta2.ascx" TagName="Mensaje" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/numeric_input.js") %>"></script>
            <asp:MultiView ID="mvMovimientoEntrada" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwListaMovEnt" runat="server">
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
                                                                    &nbsp;<asp:CalendarExtender ID="txtFiltroFecIni_CalendarExtender" runat="server"
                                                                        TargetControlID="txtFiltroFecIni" Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Hasta
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFiltroFecFin_CalendarExtender" runat="server" TargetControlID="txtFiltroFecFin"
                                                                        Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Estado
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboEstado" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>
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
                                        <asp:GridView ID="gvListaMovEn" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                            AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                            PageSize="15" BorderWidth="0px" DataKeyNames="mve_c_iid" OnSelectedIndexChanged="gvListaMovEn_SelectedIndexChanged"
                                            OnRowCommand="gvListaMovEn_RowCommand">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="RUC PROVEEDOR">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RAZÓN SOCIAL PROVEEDOR">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ORDEN_DE_COMPRA.SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Fecha" DataField="mve_c_zfecharegistro" />
                                                <asp:BoundField DataField="mve_c_vdesestado" HeaderText="Estado" />
                                                <asp:CommandField ShowSelectButton="True" SelectText="Modificar" />
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
                <asp:View ID="vwInsModMovEnt" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                ALMACÉN &gt; MOVIMIENTOS DE ENTRADA &gt;
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
                            <td colspan="2" align="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="style37">
                                                        <strong>Datos de la Orden de Compra</strong>
                                                    </td>
                                                    <td align="left" class="style21" width="500px">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style2">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
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
                                                    <td align="left" class="style37">
                                                        Serie - Número
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtSerieOC" runat="server" ReadOnly="True" Height="26px" Width="50px"></asp:TextBox>&nbsp;
                                                        <asp:TextBox ID="txtNumeroOC" runat="server" ReadOnly="True" Height="26px" Width="206px"></asp:TextBox>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                    <td align="left" class="style2">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;<asp:LinkButton ID="btnBuscarOC" runat="server" CssClass="lnk" OnClick="btnBuscarOC_Click">Buscar</asp:LinkButton>
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style37">
                                                        Proveedor
                                                    </td>
                                                    <td align="left" class="style21">
                                                        <asp:TextBox ID="txtProveedorOC" runat="server" ReadOnly="True" Width="382px" Height="27px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style2">
                                                    </td>
                                                    <td align="left" class="style30">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style14">
                                                    </td>
                                                    <td align="left" class="style10">
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style31">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style37">
                                                        <strong>Datos de la Factura</strong>
                                                    </td>
                                                    <td align="left" class="style21">
                                                    </td>
                                                    <td align="left" class="style2">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style38">
                                                        Serie - Número
                                                    </td>
                                                    <td align="left" style="margin-left: 120px">
                                                        <asp:TextBox ID="txtSerieFact" runat="server" Width="35px" MaxLength="3"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtNumeroFact" runat="server" Width="328px" MaxLength="6"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style1" style="margin-left: 120px">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        Fecha de Factura
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:TextBox ID="txtFechaFact" runat="server"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFechaFact_CalendarExtender" runat="server" TargetControlID="txtFechaFact"
                                                            Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style38">
                                                        <strong>Datos de la Guía</strong>
                                                    </td>
                                                    <td align="left" class="style22">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
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
                                                    <td align="left" class="style24">
                                                        Serie - Número
                                                    </td>
                                                    <td align="left" class="style25">
                                                        <asp:TextBox ID="txtSerieGuia" runat="server" Width="35px" MaxLength="3"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtNumeroGuia" runat="server" MaxLength="6" Width="328px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style26">
                                                    </td>
                                                    <td align="left" class="style32">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style26">
                                                        Fecha de Guia
                                                    </td>
                                                    <td align="left" class="style26">
                                                        <asp:TextBox ID="txtFechaGuia" runat="server"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFechaGuia_CalendarExtender" runat="server" TargetControlID="txtFechaGuia"
                                                            Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style38">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style22">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
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
                                                    <td align="left" class="style3" colspan="2">
                                                        <strong>Datos del Almacén</strong>
                                                    </td>
                                                    <td align="left" class="style3">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style31">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style27">
                                                        Almacén
                                                    </td>
                                                    <td align="left" class="style28">
                                                        <asp:TextBox ID="txtAlmacen" runat="server" ReadOnly="True" Height="24px" Width="385px"></asp:TextBox>
                                                        <asp:LinkButton ID="btnBuscarAlmacen" runat="server" CssClass="lnk" OnClick="btnBuscarAlmacen_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="style29">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style33">
                                                        &nbsp;
                                                    </td>
                                                    <%--<td align="left" class="style29">
                                                        Estado
                                                    </td>--%>
                                                    <td align="left" class="style29">
                                                        <%--<asp:DropDownList ID="cboEstado" runat="server">
                                                        </asp:DropDownList>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
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
                                                    <td align="left" class="style38">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style23">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style30">
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
                                                    <td align="left" class="style38">
                                                        &nbsp;Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="4" width="40%">
                                                        <div style="width: 100%; height: 300px; overflow: scroll">
                                                            <asp:GridView ID="gvItemsSeleccionados" runat="server" AlternatingRowStyle-CssClass="alt"
                                                                BorderStyle="None" BorderWidth="0px" CssClass="mGrid" EmptyDataText="No ha seleccionado una Orden de Compra."
                                                                GridLines="None" Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True"
                                                                ViewStateMode="Enabled" Width="100%" AutoGenerateColumns="False" DataKeyNames="mve_c_iocdet_id">
                                                                <AlternatingRowStyle CssClass="alt" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Descripción">
                                                                        <ItemTemplate>
                                                                            <%# Eval("mve_c_vdescripcion_item")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="mve_c_ecant_pedida" HeaderText="Can. Pedida" />
                                                                  
                                                                    <asp:TemplateField HeaderText="Can. Recibida">
                                                                         <ItemTemplate>
                                                                            <asp:TextBox ID="txtCantidad" runat="server" Text='<%# Bind("mve_c_ecant_recibida") %> '
                                                                            onkeypress="return onlyDotsAndNumbers(event)"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Can. Atendida">
                                                                         <ItemTemplate>
                                                                            <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("CantidadAtendida"))%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerStyle CssClass="pgr" />
                                                            </asp:GridView>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style38">
                                                        &nbsp;Observaciones
                                                    </td>
                                                    <td align="left" class="style23">
                                                        &nbsp;
                                                        <asp:TextBox ID="txtObs" runat="server" Height="54px" MaxLength="350" TextMode="MultiLine"
                                                            Width="462px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style34">
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
                                                    <td align="left" class="style38">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style23">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style34">
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
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; ORDENES DE COMPRA
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
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
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
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Button ID="btnFiltrarOC" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeOC" runat="server" CssClass="button small gris" Style="width: 100px;
                                                                        height: 26px;" Text="Regresar" OnClick="btnRegresarDesdeOC_Click" />
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
                                            AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                            BorderWidth="0px" DataKeyNames="odc_c_iid" PageSize="15" OnSelectedIndexChanged="gvListaOC_SelectedIndexChanged"
                                            OnPageIndexChanging="gvListaOC_PageIndexChanging">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:BoundField DataField="odc_c_cserie" HeaderText="Serie" />
                                                <asp:BoundField DataField="odc_c_vcodigo" HeaderText="Código" />
                                                <asp:TemplateField HeaderText="RUC">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="PROVEEDOR">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="odc_c_vdescmoneda" HeaderText="Moneda" />
                                                <asp:BoundField DataField="odc_c_zfecharegistro" HeaderText="Fecha Entrega" />
                                                <asp:BoundField DataField="odc_c_etotal" HeaderText="Total" />
                                                <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
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
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; ALMACÉN
                            </td>
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
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
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
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Button ID="btnFiltrarAlm" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeAlmacen" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px;" Text="Regresar" OnClick="btnRegresarDesdeAlmacen_Click" />
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
                                        <asp:GridView ID="gvListaAlmacen" runat="server" AllowPaging="True" AlternatingRowStyle-CssClass="alt"
                                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                            DataKeyNames="alm_c_iid" EmptyDataText="No hay datos disponibles." GridLines="None"
                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" Width="100%"
                                            OnSelectedIndexChanged="gvListaAlmacen_SelectedIndexChanged" OnPageIndexChanging="gvListaAlmacen_PageIndexChanging">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:BoundField DataField="alm_c_vdesc" HeaderText="Almacén" />
                                                <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
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
                                MANTENIMIENTO &gt; MOVIMIENTOS DE ENTRADA &gt; DETALLE OC
                            </td>
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
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
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
                                                        </table>
                                                    </td>
                                                    <td align="right">
                                                        <table>
                                                            <tr>
                                                                <td align="center">
                                                                    &nbsp;
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDetOc" runat="server" CssClass="button small gris" Style="width: 100px;"
                                                                        Text="Regresar" OnClick="btnRegresarDetOc_Click" />
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
                                        <asp:GridView ID="gvOCDetalle" runat="server" AllowPaging="True" AlternatingRowStyle-CssClass="alt"
                                            AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                            DataKeyNames="odc_c_iitemid" EmptyDataText="No ha seleccionado ningun item."
                                            GridLines="None" Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True"
                                            ViewStateMode="Enabled" Width="100%">
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
                                                        <%# Eval("odc_c_epreciototal")%>
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
                    <asp:AsyncPostBackTrigger ControlID="gvListaMovEn" EventName="RowCommand" />
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
