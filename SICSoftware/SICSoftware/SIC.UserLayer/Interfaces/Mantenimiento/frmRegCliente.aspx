<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    EnableViewStateMac="false" EnableEventValidation="false" CodeBehind="frmRegCliente.aspx.cs"
    Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegCliente" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvCliente" runat="server">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left" colspan="2">
                                MANTENIMIENTO &gt; CLIENTE / PROVEEDOR
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
                                                                    Razón Social :
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFiltroRazonSocial" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    RUC :
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRuc" runat="server" CssClass="ipt_150x20"></asp:TextBox>
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" Text="Buscar"
                                                                        OnClick="btnBuscar_Click" Style="width: 100px" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnNuevo" runat="server" CssClass="lnk" Text="Nuevo" OnClick="btnNuevo_Click"
                                                                        Style="width: 100px" />
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
                            <td align="left" colspan="2" style="padding: 3px">
                                <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvLista" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" OnRowEditing="gvLista_RowEditing" Width="100%"
                                            CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                            ShowHeaderWhenEmpty="true" EmptyDataText="No hay datos disponibles." OnPageIndexChanging="gvLista_PageIndexChanging"
                                            PageSize="15" OnRowDeleting="gvLista_RowDeleting" BorderWidth="0px" ViewStateMode="Enabled"
                                            OnRowCreated="gvLista_RowCreated">
                                            <Columns>
                                                <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="RUC" Visible="true" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField DataField="cli_c_vraz_soc" ItemStyle-Width="35%" HeaderText="RAZÓN SOCIAL" />
                                                <asp:BoundField DataField="cli_c_vrubro" ItemStyle-Width="35%" HeaderText="RUBRO" />
                                                <%--  <asp:TemplateField HeaderText="TIPO">
                                                    <ItemTemplate>
                                                        <%# (Boolean.Parse(Eval("cli_c_bgrupo_ibk").ToString())) ? "AFILIADO" : "NO AFILIADO"%>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                </asp:TemplateField>--%>
                                                <asp:CommandField HeaderText="" ButtonType="Link" EditText="Editar" ShowEditButton="True"
                                                    ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" />
                                                <asp:CommandField HeaderText="" ButtonType="Link" DeleteText="Eliminar" ShowDeleteButton="True"
                                                    ItemStyle-Width="10%" ItemStyle-HorizontalAlign="center" />
                                            </Columns>
                                            <HeaderStyle />
                                            <PagerStyle HorizontalAlign="left" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="gvLista" EventName="PageIndexChanging" />
                                        <asp:AsyncPostBackTrigger ControlID="gvLista" EventName="RowDeleting" />
                                        <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; CLIENTE / PROVEEDOR &gt;
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
                                        <td align="left" class="box-estilo01">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 530px">
                                                        <table>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Tipo de persona <span class="requerido">(*)</span>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboTipoPersona" runat="server" CssClass="slt_150x20">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Nombre Comercial
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <%--<div style="overflow-y:scroll; height:80px">--%>
                                                                                            <div>
                                                                                                <asp:UpdatePanel ID="upNomComer" UpdateMode="Conditional" runat="server">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:GridView ID="gvNombresComerciales" runat="server" AutoGenerateColumns="False"
                                                                                                            BorderStyle="None" BorderStyle-Width="0px" GridLines="None" ShowHeader="False"
                                                                                                            ViewStateMode="Enabled" BorderWidth="0px" OnRowCommand="gvNombresComerciales_RowCommand"
                                                                                                            OnRowDataBound="gvNombresComerciales_RowDataBound" OnRowEditing="gvNombresComerciales_RowEditing">
                                                                                                            <Columns>
                                                                                                                <asp:TemplateField Visible="false">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label runat="server" ID="lblIdNomCom" Text='<%#Eval("nomb_com_c_iid") %>'></asp:Label>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField HeaderText="Nombre" HeaderStyle-HorizontalAlign="Center">
                                                                                                                    <ItemTemplate>
                                                                                                                        <table cellpadding="0" cellspacing="0">
                                                                                                                            <tr>
                                                                                                                                <td>
                                                                                                                                    <asp:TextBox ID="txtNombreComercial" runat="server" MaxLength="200" Text='<%#Eval("nomb_com_c_vnomb") %>'
                                                                                                                                        CssClass="ipt_150x20x2"></asp:TextBox>&nbsp;
                                                                                                                                </td>
                                                                                                                                <td>
                                                                                                                                    <span class="requerido">(*)</span>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:CommandField ButtonType="Link" EditText="Evaluar" ControlStyle-Width="35px"
                                                                                                                    ShowEditButton="true" Visible="false" />
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:LinkButton ID="btnGenerarEval" runat="server" Text="Evaluar" CommandName="eval"
                                                                                                                            Visible="false" CommandArgument='<%# ((GridViewRow) Container).RowIndex  %>'></asp:LinkButton>
                                                                                                                        <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="btnGenerarEval"
                                                                                                                            DisplayModalPopupID="mpe" />
                                                                                                                        <!-- NUEVA ALERTA -->
                                                                                                                        <asp:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="btnGenerarEval"
                                                                                                                            OkControlID="btnYes" CancelControlID="btnNo" BackgroundCssClass="modalBackground-confirm">
                                                                                                                        </asp:ModalPopupExtender>
                                                                                                                        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup-confirm" Style="display: none">
                                                                                                                            <div class="header" align="left">
                                                                                                                                Advance - Real Plaza
                                                                                                                            </div>
                                                                                                                            <div class="body">
                                                                                                                                <table>
                                                                                                                                    <tr>
                                                                                                                                        <td style="width: 50px;" align="center" valign="middle">
                                                                                                                                            <img id="img2" class="imagen" height="32px" src="../../Imagenes/Iconos/informacion.gif"
                                                                                                                                                width="32px" />
                                                                                                                                        </td>
                                                                                                                                        <td>
                                                                                                                                            Ya existe una evaluación para este Cliente con este nombre Comercial.<br />
                                                                                                                                            ¿Desea generar una nueva evaluación y deshabilitar la anterior?
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                </table>
                                                                                                                            </div>
                                                                                                                            <div class="footer" align="center">
                                                                                                                                <asp:Button ID="btnYes" runat="server" Text="Aceptar" CssClass="yes" Font-Size="XX-Small" />
                                                                                                                                <asp:Button ID="btnNo" runat="server" Text="Cancelar" CssClass="no" Font-Size="XX-Small" />
                                                                                                                            </div>
                                                                                                                        </asp:Panel>
                                                                                                                        <!--FIN DE ALERTA NUEVA-->
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle Width="35px" />
                                                                                                                </asp:TemplateField>
                                                                                                                <asp:TemplateField>
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:LinkButton ID="btnEliminarNomComer" runat="server" Text="Eliminar" CommandName="remover"
                                                                                                                            CommandArgument='<%# ((GridViewRow) Container).RowIndex  %>'></asp:LinkButton>
                                                                                                                    </ItemTemplate>
                                                                                                                    <ItemStyle Width="15px" />
                                                                                                                </asp:TemplateField>
                                                                                                            </Columns>
                                                                                                            <HeaderStyle BackColor="#3e761c" ForeColor="White" />
                                                                                                        </asp:GridView>
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:AsyncPostBackTrigger ControlID="btnAgregarNombreComercial" EventName="Click" />
                                                                                                        <asp:AsyncPostBackTrigger ControlID="gvLista" EventName="RowEditing" />
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td style="width: 5px">
                                                                            </td>
                                                                            <td valign="top">
                                                                                <asp:Button ID="btnAgregarNombreComercial" runat="server" CssClass="button small gris"
                                                                                    OnClick="btnAgregarNombreComercial_Click" Text="Agregar" Style="width: 100px" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Fecha de Aniversario
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFechaAniversario" runat="server" CssClass="ipt_150x20x2"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="txtFechaAniversario_CalendarExtender" runat="server"
                                                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaAniversario">
                                                                    </ajaxToolkit:CalendarExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Fecha de Constitución<br />
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    <asp:TextBox ID="txtFecConstitucion" runat="server" CssClass="ipt_150x20x2"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender ID="txtFecConstitucion_CalendarExtender" runat="server"
                                                                        Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFecConstitucion">
                                                                    </ajaxToolkit:CalendarExtender>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    <%--   <asp:DropDownList ID="cboScoring" runat="server" CssClass="ipt_250x20">
                                                                    </asp:DropDownList>--%>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none">
                                                                <td class="txt-box-estilo">
                                                                    Ejecutivo de cobranza <span class="requerido">(*)</span>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    <asp:DropDownList ID="cboEjecutivo" runat="server" CssClass="slt_150x20">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 10px">
                                                    </td>
                                                    <td valign="top">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Razón Social <span class="requerido">(*)</span>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="ipt_250x20" MaxLength="200"></asp:TextBox>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    RUC <span class="requerido">(*)</span>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtNroRuc" runat="server" CssClass="ipt_150x20" MaxLength="11" onkeypress="return SoloNumeros(event)"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    N° de partida
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtNumeroPartida" runat="server" CssClass="ipt_150x20" MaxLength="30"
                                                                        onkeypress="return SoloNumeros(event)"></asp:TextBox>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Rubro detallado&nbsp; (SUNAT)&nbsp;
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRubroDetallado" runat="server" CssClass="ipt_150x20" MaxLength="200"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="txt-box-estilo">
                                                                    Teléfono <span class="requerido">(*)</span>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="ipt_150x20" MaxLength="15"></asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefono_FilteredTextBoxExtender" runat="server"
                                                                        Enabled="True" TargetControlID="txtTelefono" ValidChars="0123456789( ) - * #">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td class="txt-box-estilo">
                                                                                <asp:CheckBox ID="chkCliente" Text="Cliente" Checked="true" runat="server" />
                                                                            </td>
                                                                            <td class="txt-box-estilo">
                                                                                <asp:CheckBox ID="chkProveedor" Text="Proveedor" Checked="false" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    Zona de reparto (Lima)
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboZonaReparto" runat="server" CssClass="ipt_150x20">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td class="txt-box-estilo" style="width: 115px">
                                                                    Dirección
                                                                </td>
                                                                <td valign="top" style="border-width: 0px; border-style: solid; border-color: #CCC;
                                                                    background-color: #f5f5f5;">
                                                                    <table width="83%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:UpdatePanel ID="upGvDireccion" UpdateMode="Conditional" runat="server">
                                                                                    <ContentTemplate>
                                                                                        <asp:GridView ID="gvDireccion" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvDireccion_RowDeleting"
                                                                                            ShowHeader="False" ViewStateMode="Enabled" GridLines="None" BorderStyle="None"
                                                                                            BorderWidth="0px">
                                                                                            <Columns>
                                                                                                <asp:TemplateField ShowHeader="False">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblNumeracion" runat="server">
            <%# (gvDireccion.Rows.Count + 1) + "- "%>
                                                                                                        </asp:Label></ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField ShowHeader="False">
                                                                                                    <ItemTemplate>
                                                                                                        <table>
                                                                                                            <tr>
                                                                                                                <td colspan="4">
                                                                                                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="ipt_450x20" MaxLength="200"></asp:TextBox>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <span class="requerido">(*)</span>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="cboDepartamento" runat="server" AppendDataBoundItems="true"
                                                                                                                        AutoPostBack="True" CssClass="slt_150x20" OnSelectedIndexChanged="cboDepartamento_SelectedIndexChanged"
                                                                                                                        ViewStateMode="Enabled">
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="cboProvincia" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                                                                                        CssClass="slt_150x20" OnSelectedIndexChanged="cboProvincia_SelectedIndexChanged"
                                                                                                                        ViewStateMode="Enabled">
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="cboDistrito" runat="server" AppendDataBoundItems="true" CssClass="slt_150x20"
                                                                                                                        ViewStateMode="Enabled">
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <asp:DropDownList ID="cboTipoDireccion" runat="server" AppendDataBoundItems="true"
                                                                                                                        CssClass="slt_150x20">
                                                                                                                        <asp:ListItem Value="0">Tipo</asp:ListItem>
                                                                                                                    </asp:DropDownList>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField ShowHeader="False">
                                                                                                    <EditItemTemplate>
                                                                                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></EditItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:CommandField ButtonType="Link" DeleteText="Eliminar" ShowDeleteButton="True" />
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                    </ContentTemplate>
                                                                                    <Triggers>
                                                                                        <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                                                                                    </Triggers>
                                                                                </asp:UpdatePanel>
                                                                            </td>
                                                                            <td style="width: 10px">
                                                                            </td>
                                                                            <td>
                                                                                <asp:Button ID="btnAgregar" runat="server" CssClass="button small gris" OnClick="btnAgregar_Click"
                                                                                    Text="Agregar" Style="width: 100px" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" align="center">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="tit-nav-paginas" style="height: 45px; padding-left: 5px">
                                CONTACTOS
                            </td>
                            <td align="right" style="padding-right: 5px">
                                <asp:Button ID="btnAgregarContacto" runat="server" CssClass="button small gris" OnClick="btnAgregarContacto_Click"
                                    Text="Agregar" Style="width: 100px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2" style="padding: 5px">
                                <asp:UpdatePanel ID="upGvContactos" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvContactos" runat="server" BorderStyle="None" OnRowDeleting="gvContactos_RowDeleting"
                                            OnRowEditing="gvContactos_RowEditing" AutoGenerateColumns="False" Width="100%"
                                            ShowHeaderWhenEmpty="true" EmptyDataText="No existen contactos para este Cliente / Proveedor"
                                            OnRowCreated="gvContactos_RowCreated" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                            AlternatingRowStyle-CssClass="alt">
                                            <Columns>
                                                <asp:TemplateField HeaderText="N">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNumeroContacto" runat="server">
                                                 <%# (gvContactos.Rows.Count + 1) + "- "%>
                                                
                                                        </asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="NOMBRES Y APELLIDOS">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EMAIL">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmail" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CARGO">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCargo" runat="server"></asp:Label></ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Link" EditText="Editar" ShowEditButton="True" ItemStyle-Width="40px"
                                                    ItemStyle-HorizontalAlign="center" />
                                                <asp:CommandField ButtonType="Link" DeleteText="Eliminar" ShowDeleteButton="True"
                                                    ItemStyle-Width="40px" ItemStyle-HorizontalAlign="center" />
                                            </Columns>
                                            <HeaderStyle />
                                            <RowStyle />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAgregarContacto" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; CLIENTE / PROVEEDOR &gt;
                                <asp:Label ID="lblContacto" runat="server"></asp:Label>
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardarContacto" runat="server" CssClass="lnk" OnClick="btnGuardarContacto_Click">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelarContacto" runat="server" CssClass="lnk" OnClick="btnCancelarContacto_Click">Cancelar</asp:LinkButton>
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
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellspacing="3" cellpadding="2">
                                                <%--              <tr>
                                                                                <td  colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>--%>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        <asp:Label ID="lblNombreCentroComercial" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Tipo de Documento
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cboTipoDoc" runat="server" AutoPostBack="True" CssClass="slt_150x20"
                                                            OnSelectedIndexChanged="cboTipoDoc_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Documento de Identidad <span class="requerido">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:UpdatePanel ID="up" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:TextBox ID="txtDniContacto" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtDniContacto_FilteredTextBoxExtender"
                                                                    runat="server" Enabled="True" TargetControlID="txtDniContacto" ValidChars="0123456789">
                                                                </ajaxToolkit:FilteredTextBoxExtender>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Nombre <span class="requerido">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNombreContacto" runat="server" CssClass="ipt_150x20" MaxLength="50"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNombreContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtNombreContacto" ValidChars=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarDni" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarNombre" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Apellido Paterno <span id="txt" class="requerido">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtApellidoPaternoContacto" runat="server" CssClass="ipt_150x20"
                                                            MaxLength="50"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtApellidoPaternoContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtApellidoPaternoContacto" ValidChars=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Apellido Materno
                                                        <asp:UpdatePanel ID="upMen" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Label ID="lbl" runat="server" CssClass="requerido"></asp:Label>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtApellidoMaternoContacto" runat="server" CssClass="ipt_150x20"
                                                            MaxLength="50"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtApellidoMaternoContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtApellidoMaternoContacto" ValidChars=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarApellido" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarApellidoMaterno" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Teléfono Fijo
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtTelefonofijoContacto" runat="server" CssClass="ipt_150x20" MaxLength="10"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefonofijoContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtTelefonofijoContacto" ValidChars="0123456789( ) - * #">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Teléfono Móvil
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txttelefonoMovilContacto" runat="server" CssClass="ipt_150x20" MaxLength="9"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txttelefonoMovilContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txttelefonoMovilContacto" ValidChars="0123456789( ) - * #">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarTelefonoFijo" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarTelefonoMovil" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        E-mail <span class="requerido">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtEmailContacto" runat="server" CssClass="ipt_150x20" MaxLength="50"></asp:TextBox>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Fecha de Nacimiento&nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaNacimientoContacto" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtFechaNacimientoContacto_CalendarExtender" runat="server"
                                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaNacimientoContacto">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarEmail" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblValidarFechaNac" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo" valign="top">
                                                        Cargo <span class="requerido">(*)</span>
                                                    </td>
                                                    <td align="left" valign="top">
                                                        <asp:DropDownList ID="cboCargoContacto" runat="server" CssClass="slt_150x20">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="txt-box-estilo" valign="top">
                                                        Observaciones
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtObservacionesContacto" runat="server" CssClass="txta_450x80"
                                                            MaxLength="50" TextMode="MultiLine" onpaste="return false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                        <asp:HiddenField ID="hdfCantRepLeg" runat="server" />
                                                        <asp:HiddenField ID="hdfCantGerGen" runat="server" />
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
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnAgregarContacto" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnNuevo" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnCancelar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnCancelarContacto" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnGuardarContacto" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="gvLista" EventName="RowDeleting" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
