<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmVenta.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Movimientos.frmVenta" %>

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
            height: 20px;
        }
    </style>
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
            <asp:MultiView ID="mvOC" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                FACTURACIÓN &gt; VENTA
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
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFiltroFecIni_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                                        TargetControlID="txtFiltroFecIni" TodaysDateFormat="dd/MM/yyyy" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Hasta
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                                    <asp:CalendarExtender ID="txtFiltroFecFin_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                                        TargetControlID="txtFiltroFecFin" TodaysDateFormat="dd/MM/yyyy" />
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" OnClick="btnBuscar_Click" />
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
                                                PageSize="15" BorderWidth="0px" DataKeyNames="ven_c_iid" OnRowEditing="gvListaVenta_RowEditing"
                                                OnRowDeleting="gvListaVenta_RowDeleting" OnPageIndexChanging="gvListaVenta_PageIndexChanging">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="RUC CLIENTE">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="RAZ. SOCIAL CLIENTE">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
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
                                                    <asp:CommandField ShowEditButton="True" CancelText="Cancelar" DeleteText="Eliminar"
                                                        EditText="Editar" />
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
                                FACTURACIÓN &gt; VENTA &gt;
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
                                                        Centro de Costo&nbsp;
                                                    </td>
                                                    <td align="left" class="style3" style="margin-left: 40px">
                                                        <asp:DropDownList ID="cboCentroCosto" runat="server" AppendDataBoundItems="True"
                                                            AutoPostBack="True" OnSelectedIndexChanged="cboCentroCosto_SelectedIndexChanged"
                                                            Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="style1">
                                                        Fecha
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblFechaRegistro" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Cliente
                                                    </td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRSProv" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="282px"></asp:TextBox>
                                                        &nbsp;<asp:LinkButton ID="btnBuscarProveedor" runat="server" CssClass="lnk" OnClick="btnBuscarProveedor_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td class="style1">
                                                        RUC
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtRucProv" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="282px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Moneda
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboMoneda" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboMoneda_SelectedIndexChanged"
                                                            Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style1">
                                                        Tipo Documento
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboTipoDocumento" runat="server" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Estado
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboEstado" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboMoneda_SelectedIndexChanged"
                                                            Width="201px">
                                                        </asp:DropDownList>
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
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <div style="width: 99%; height: 300px; overflow: scroll">
                                                            <asp:GridView ID="gvItemsSeleccionados" runat="server" AlternatingRowStyle-CssClass="alt"
                                                                BorderStyle="None" BorderWidth="0px" CssClass="mGrid" EmptyDataText="No ha seleccionado ningun item."
                                                                GridLines="None" Height="16px" PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True"
                                                                ViewStateMode="Enabled" Width="100%" AutoGenerateColumns="False" DataKeyNames="ven_det_c_iitemid,ven_det_c_iidalmacen" 
                                                                onrowdeleting="gvItemsSeleccionados_RowDeleting">
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
                                                                            <asp:TextBox ID="txtCantidad" runat="server" Text='<%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("ven_det_c_ecantidad") )%>'
                                                                                onkeypress="return onlyDotsAndNumbers(event)" ontextchanged="txtRowCantidadPrecio_TextChanged" AutoPostBack="true" >
                                                                            </asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Unitario">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtPrecio" runat="server" Text='<%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("ven_det_c_epreciounit") )%>'
                                                                                onkeypress="return onlyDotsAndNumbers(event)" ontextchanged="txtRowCantidadPrecio_TextChanged" AutoPostBack="true" >
                                                                            </asp:TextBox>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Sub Total">
                                                                        <ItemTemplate>
                                                                            <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}",Eval("ven_det_c_epreciototal"))%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" />
                                                                    <asp:TemplateField HeaderText="Unit. Ref. (Soles)">
                                                                        <ItemTemplate>
                                                                            <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("precioReferenciaSoles"))%>
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
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnBuscarItems" runat="server" Text="Buscar Items" CssClass="lnk"
                                                            OnClick="btnBuscarItems_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1">
                                                        &nbsp;Tasa de Cambio
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:Label ID="lblTC" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
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
                                                    <td align="left" class="style1">
                                                        I.G.V.&nbsp;(<asp:Label ID="lblIGV" runat="server" Text="18%"></asp:Label>
                                                        )
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblIGVCal" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="style1">
                                                    </td>
                                                    <td align="left" class="style1">
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
                                                        &nbsp;
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
                                FACTURACIÓN &gt; VENTA &gt; SELECCIONAR ITEM<br />
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
                                                                <td style="width: 20px" class="txt-box-estilo">
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
                                                                        Text="Buscar" OnClick="btnFiltrarItem_Click" />
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
                                <asp:UpdatePanel ID="upGvListaITem" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                            AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                            BorderWidth="0px" ViewStateMode="Enabled" DataKeyNames="itm_alm_c_iid,itm_c_iid,alm_c_iid"
                                            OnPageIndexChanging="gvListaItem_PageIndexChanging" OnRowDataBound="gvListaItem_RowDataBound"
                                            OnRowCreated="gvListaItem_RowCreated">
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
                <asp:View ID="vwProveedor" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                FACTURACIÓN &gt; VENTA &gt; SELECCIONAR CLIENTE
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
                                                                                <asp:Button ID="btnFiltroProveedor" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                                    Text="Buscar" />
                                                                            </td>
                                                                            <td align="center">
                                                                                <asp:Button ID="btnRegresarDesdeProveedor" runat="server" CssClass="button small gris"
                                                                                    OnClick="btnRegresarDesdeProveedor_Click" Style="width: 100px; height: 26px;"
                                                                                    Text="Regresar" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
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
                            <tr>
                                <td align="left" class="tit-nav-paginas">
                                    <asp:UpdatePanel ID="upProveedor" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvCliente" runat="server" BorderStyle="None" GridLines="None" AllowPaging="True"
                                                Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                                ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles." PageSize="15"
                                                BorderWidth="0px" AutoGenerateColumns="False" DataKeyNames="cli_c_vdoc_id" OnSelectedIndexChanged="gvCliente_SelectedIndexChanged"
                                                OnPageIndexChanging="gvCliente_PageIndexChanging">
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
