<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="frmRegOC.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegOC" %>

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
            <asp:MultiView ID="mvOC" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                COMPRAS &gt; ORDEN DE COMPRA</td>
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
                                                                    RUC Prov.
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroRuc" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 20px; margin-left: 160px;">
                                                                    Moneda
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    <asp:DropDownList ID="cboFiltroMoneda" runat="server" AppendDataBoundItems="True"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="cboMoneda_SelectedIndexChanged" Width="201px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    Estado
                                                                </td>
                                                                <td style="width: 20px">
                                                                    <asp:DropDownList ID="cboFiltroEstado" runat="server" AppendDataBoundItems="True"
                                                                        AutoPostBack="True" OnSelectedIndexChanged="cboMoneda_SelectedIndexChanged" Width="201px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="font-weight: 700">
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
                            <tr>
                                <td align="left" class="tit-nav-paginas">
                                    <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvListaOC" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                                GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                                AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                                PageSize="15" BorderWidth="0px" DataKeyNames="odc_c_iid" OnRowEditing="gvListaOC_RowEditing"
                                                OnRowDeleting="gvListaOC_RowDeleting" OnPageIndexChanging="gvListaOC_PageIndexChanging"
                                                OnSelectedIndexChanged="gvListaOC_SelectedIndexChanged" OnRowDataBound="gvListaOC_RowDataBound"
                                                OnRowCommand="gvListaOC_RowCommand">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="SERIE" DataField="odc_c_cserie" />
                                                    <asp:BoundField HeaderText="CÓDIGO" DataField="odc_c_vcodigo" />
                                                    <asp:TemplateField HeaderText="RUC PROVEEDOR">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vdoc_id")%> 
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="PROVEEDOR">
                                                        <ItemTemplate>
                                                            <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="ESTADO" DataField="odc_c_vdescestado" />
                                                    <asp:BoundField HeaderText="MONEDA" DataField="odc_c_vdescmoneda" />
                                                    <asp:BoundField HeaderText="MONTO TOTAL" DataField="odc_c_etotal" DataFormatString="{0:0,0.00}" />
                                                    <asp:CommandField SelectText="Ver" ShowSelectButton="True" />
                                                    <asp:CommandField ShowEditButton="True" CancelText="Cancelar" DeleteText="Eliminar"
                                                        EditText="Modificar" />
                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="Anular" />
                                                    <asp:ButtonField CommandName="Cerrar" Text="Cerrar" ButtonType="Link" />
                                                    <asp:TemplateField><ItemTemplate><asp:LinkButton ID="lnkDescargar" runat="server" OnClick="lnkDescargar_Click">Descargar</asp:LinkButton></ItemTemplate></asp:TemplateField>
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers><asp:AsyncPostBackTrigger ControlID="gvListaOC" EventName="PageIndexChanging" /></Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                COMPRAS &gt; ORDEN DE COMPRA &gt;
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
                            <td colspan="2" lign="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Código
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtSerie" runat="server" MaxLength="3" Width="35" ReadOnly="true"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtNumero" runat="server" MaxLength="8" ReadOnly="true"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <%--Fecha--%>
                                                        Fecha Emsión
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <%--<asp:Label ID="lblFecha" runat="server"></asp:Label>--%>
                                                        <asp:TextBox ID="txtFecEmi" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFecEmi_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                            TargetControlID="txtFecEmi" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Proveedor
                                                    </td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRUCProv" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="114px"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtRSProv" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="282px"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnBuscarProveedor" runat="server" CssClass="lnk" OnClick="btnBuscarProveedor_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Rango de entrega
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtFecEnIni" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFecEnIni_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                            TargetControlID="txtFecEnIni" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtFecEntFin" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFecEntFin_CalendarExtender" runat="server" Format="dd/MM/yyyy"
                                                            TargetControlID="txtFecEntFin" TodaysDateFormat="dd/MM/yyyy"></asp:CalendarExtender>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Estado
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboEstado" runat="server" Width="201px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="cboEstado_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Clase
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboClaseOC" runat="server" AutoPostBack="True" Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Moneda
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboMoneda" runat="server" Width="201px" AutoPostBack="True"
                                                            OnSelectedIndexChanged="cboMoneda_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Direccion de entrega
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtDirecEntrega" runat="server" BackColor="#CCCCCC" BorderColor="Black"
                                                            BorderStyle="None" BorderWidth="1px" ReadOnly="True" Width="282px"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnBuscarDireccion" runat="server" CssClass="lnk" OnClick="btnBuscarDireccion_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" colspan="3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <div style="width: 100%; height: 300px; overflow: scroll">
                                                            <asp:GridView ID="gvItemsSeleccionados" runat="server" AlternatingRowStyle-CssClass="alt"
                                                                AutoGenerateColumns="False" BorderStyle="None" BorderWidth="0px" CssClass="mGrid"
                                                                DataKeyNames="odc_c_iitemid" EmptyDataText="No ha seleccionado ningun item."
                                                                GridLines="None" Height="16px" PagerStyle-CssClass="pgr"
                                                                ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" Width="100%" 
                                                                OnRowDeleting="gvItemsSeleccionados_RowDeleting">
                                                                <AlternatingRowStyle CssClass="alt" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="Código"><ItemTemplate></ItemTemplate></asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Descripción"><ItemTemplate></ItemTemplate></asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Cantidad"><ItemTemplate><asp:TextBox ID="txtCantidad" runat="server" Text='<%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("odc_c_ecantidad") )%> '
                                                                                onkeypress="return onlyDotsAndNumbers(event)" ontextchanged="txtRowCantidadPrecio_TextChanged" AutoPostBack="true" >
                                                                            </asp:TextBox></ItemTemplate></asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Unitario"><ItemTemplate><asp:TextBox ID="txtPrecio" runat="server" Text='<%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("odc_c_epreciounit") )%> '
                                                                                onkeypress="return onlyDotsAndNumbers(event)" ontextchanged="txtRowCantidadPrecio_TextChanged" AutoPostBack="true" > 
                                                                            </asp:TextBox></ItemTemplate></asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Sub Total"><ItemTemplate></ItemTemplate></asp:TemplateField>
                                                                    <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" />
                                                                    <asp:TemplateField HeaderText="Unit. Ref. (Soles)"><ItemTemplate></ItemTemplate></asp:TemplateField>
                                                                </Columns>
                                                                <PagerStyle CssClass="pgr" />
                                                            </asp:GridView>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnBuscarItems" runat="server" CssClass="lnk" OnClick="btnBuscarItems_Click"
                                                            Text="Buscar Items" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style3">
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
                                                        Tasa de Cambio
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblTC" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Percepción aplica a partir de:
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblPercepMax" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style3">
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
                                                        )
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblIGVCal" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:CheckBox ID="chkPercepcion" CssClass="chk" runat="server" AutoPostBack="True"
                                                            OnCheckedChanged="chkPercepcion_CheckedChanged" />Percepción (<asp:Label ID="lblPercepcion"
                                                                runat="server" Text="2%"></asp:Label>
                                                        )
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblPercepcionCal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Sub Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblSubTotal" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
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
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <asp:TextBox ID="txtObs" runat="server" Height="54px" MaxLength="350" TextMode="MultiLine"
                                                            Width="462px"></asp:TextBox>
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
                                COMPRAS &gt; ORDEN DE COMPRA &gt; SELECCIONAR ITEM<br />
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
                                                                    Familia
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboFamilia" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                                        OnSelectedIndexChanged="cboFamilia_SelectedIndexChanged">
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
                                                                    <asp:DropDownList ID="cboSubFamilia" runat="server" AppendDataBoundItems="true">
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
                                                                    <asp:Button ID="btnBuscarItem" runat="server" CssClass="button small gris" Style="width: 100px"
                                                                        Text="Buscar" OnClick="btnBuscarItem_Click" />
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
                                            BorderWidth="0px" ViewStateMode="Enabled" DataKeyNames="itm_c_iid" OnPageIndexChanging="gvListaItem_PageIndexChanging"
                                            OnRowDataBound="gvListaItem_RowDataBound" OnRowCreated="gvListaItem_RowCreated"
                                            PageSize="15">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="SELECCIONAR"><HeaderTemplate><asp:CheckBox ID="chkAll" runat="server" onclick="javascript:checkAll(this);" /></HeaderTemplate><ItemTemplate><asp:CheckBox ID="chkSelect" runat="server" onclick="javascript:Check_Click(this);" /></ItemTemplate></asp:TemplateField>
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
                                COMPRAS &gt; ORDEN DE COMPRA &gt; SELECCIONAR PROVEEDOR
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
                                                                    RUC:
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td style="width: 20px">
                                                                    <asp:TextBox ID="txtBusqRucProv" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    RAZÓN SOCIAL:
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtBusqRazProv" runat="server"></asp:TextBox>
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
                                                                    <asp:Button ID="btnRgresarDesdeProveedor" runat="server" CssClass="button small gris"
                                                                        OnClick="btnRgresarDesdeProveedor_Click" Style="width: 100px; height: 26px;"
                                                                        Text="Regresar" />
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
                                            <asp:GridView ID="gvProveedores" runat="server" BorderStyle="None" GridLines="None"
                                                AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                                ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles." PageSize="15"
                                                BorderWidth="0px" AutoGenerateColumns="False" DataKeyNames="cli_c_vdoc_id,cli_c_vraz_soc"
                                                OnSelectedIndexChanged="gvProveedores_SelectedIndexChanged" OnPageIndexChanging="gvProveedores_PageIndexChanging">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="RUC" />
                                                    <asp:BoundField DataField="cli_c_vraz_soc" HeaderText="Razón Social" />
                                                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwDireccion" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                COMPRAS &gt; ORDEN DE COMPRA &gt; SELECCIONAR DIRECCION DE ENTREGA
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
                                                                    &nbsp;
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDireccion" runat="server" CssClass="button small gris"
                                                                        OnClick="btnRegresarDireccion_Click" Style="width: 100px;" Text="Regresar" />
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
                                            <asp:GridView ID="gvDireccion" runat="server" BorderStyle="None" GridLines="None"
                                                AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                                ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles." PageSize="15"
                                                BorderWidth="0px" AutoGenerateColumns="False" DataKeyNames="emp_dir_c_iid" OnPageIndexChanging="gvDireccion_PageIndexChanging"
                                                OnSelectedIndexChanged="gvDireccion_SelectedIndexChanged">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:BoundField DataField="emp_dir_c_vdireccion" HeaderText="DIRECCION" />
                                                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
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
                    <asp:AsyncPostBackTrigger ControlID="gvListaOC" EventName="RowCommand" />
                    <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="gvListaOC" EventName="RowDeleting" />
                    
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
        <%-- <Triggers>
            <asp:PostBackTrigger ControlID="gvListaOC" />
        </Triggers>--%>
    </asp:UpdatePanel>
</asp:Content>
