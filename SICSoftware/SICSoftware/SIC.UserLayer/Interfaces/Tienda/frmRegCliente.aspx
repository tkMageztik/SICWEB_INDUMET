<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegCliente.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Tienda.frmRegCliente" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvCliente" runat="server">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left" colspan="2">
                                CREDITOS Y COBRANZAS &gt; CLIENTES
                            </td>
                        </tr>
                        <tr>
                            <td class="txt2" align="left" colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 125px;" class="txt-box-estilo">
                                                        Filtrar por:
                                                    </td>
                                                    <td style="width: 195px;">
                                                        <asp:DropDownList ID="cboTipo" runat="server" AppendDataBoundItems="true" CssClass="slt_150x20">
                                                            <asp:ListItem Value="2">Tipo</asp:ListItem>
                                                            <asp:ListItem Value="1">AFILIADO</asp:ListItem>
                                                            <asp:ListItem Value="0">NO AFILIADO</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="txt-box-estilo" style="width: 195px;" align="right">
                                                        RUC :
                                                    </td>
                                                    <td style="width: 195px;">
                                                        <asp:TextBox ID="txtRuc" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                    </td>
                                                    <td class="txt-box-estilo" style="width: 132px;">
                                                        &nbsp Razon Social :
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFiltroRazonSocial" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="btnBuscar" runat="server" CssClass="lnk" OnClick="btnBuscar_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="center">
                                                        <asp:LinkButton ID="btnNuevo" runat="server" CssClass="lnk" OnClick="btnNuevo_Click">Nuevo</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="txt2">
                                &nbsp;
                            </td>
                            <td align="right">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2">
                                <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvLista" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" OnRowEditing="gvLista_RowEditing" Width="100%"
                                            CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                            OnPageIndexChanging="gvLista_PageIndexChanging" PageSize="15" OnRowDeleting="gvLista_RowDeleting"
                                            ViewStateMode="Enabled" OnRowCreated="gvLista_RowCreated" 
                                            onselectedindexchanged="gvLista_SelectedIndexChanged">
                                            <Columns>
                                                <%--  <asp:BoundField DataField="nomb_com_c_iid" HeaderText="nomb_com_c_iid" Visible="False" />--%>
                                                <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="cli_c_cdoc_id" Visible="False" />
                                                <%--  <asp:BoundField DataField="nomb_com_c_vnomb" HeaderText="NOMBRE COMERCIAL" />--%>
                                                <asp:BoundField DataField="cli_c_vraz_soc" ItemStyle-Width="40%" HeaderText="RAZÓN SOCIAL" />
                                                <asp:BoundField DataField="cli_c_vrubro" ItemStyle-Width="40%" HeaderText="RUBRO" />
                                                <asp:TemplateField HeaderText="TIPO">
                                                    <ItemTemplate>
                                                        <%# (Boolean.Parse(Eval("cli_c_bgrupo_ibk").ToString())) ? "AFILIADO" : "NO AFILIADO"%>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="90px" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Image" EditImageUrl="~/Imagenes/btn_editar.png" ShowEditButton="True"
                                                    ItemStyle-Width="40px" ItemStyle-HorizontalAlign="center" />
                                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/btn_eliminar.png"
                                                    ShowDeleteButton="True" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="center" />
                                            </Columns>
                                            <HeaderStyle />
                                            <PagerStyle HorizontalAlign="left" />
                                            <RowStyle />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnBuscar" EventName="Click" />
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
                                CREDITOS Y COBRANZAS &gt; CLIENTE &gt;
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
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table width="100%" border="0" cellspacing="3" cellpadding="2">
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Tipo de persona <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cboTipoPersona" runat="server" CssClass="slt_150x20">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Razón Social <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="ipt_250x20" MaxLength="200"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cboTipoDocumento" runat="server" CssClass="slt_150x20">
                                                            <asp:ListItem Value="0" Text="DNI"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Carné de extranjería"></asp:ListItem>
                                                            <asp:ListItem Value="2" Text="RUC"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="style5">(*)</span>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        <asp:TextBox ID="txtNroRuc" runat="server" CssClass="ipt_150x20" MaxLength="11"></asp:TextBox>
                                                        <ajaxToolkit:MaskedEditExtender ID="txtNroRuc_MaskedEditExtender" runat="server"
                                                            AutoComplete="False" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder=""
                                                            CultureDateFormat="" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder=""
                                                            CultureTimePlaceholder="" Enabled="True" Mask="99999999999" MaskType="Number"
                                                            TargetControlID="txtNroRuc">
                                                        </ajaxToolkit:MaskedEditExtender>
                                                        &nbsp;*
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Nombre Comercial <span>(*)
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:UpdatePanel ID="upNomComer" UpdateMode="Conditional" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:GridView ID="gvNombresComerciales" runat="server" AutoGenerateColumns="False"
                                                                                BorderStyle="None" BorderStyle-Width="2px" OnRowDeleting="gvNombresComerciales_RowDeleting"
                                                                                ShowHeader="False" ViewStateMode="Enabled" BorderWidth="0px" OnRowEditing="gvNombresComerciales_RowEditing">
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label runat="server" ID="lblIdNomCom" Text='<%#Eval("nomb_com_c_iid") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField>
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtNombreComercial" runat="server" Text='<%#Eval("nomb_com_c_vnomb") %>'
                                                                                                CssClass="ipt_150x20x2"></asp:TextBox>&nbsp;<span class="style1">*</span></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:CommandField ButtonType="Image" Visible="false" EditImageUrl="~/Imagenes/document.png"
                                                                                        ControlStyle-Width="15px" ControlStyle-Height="15px" ShowEditButton="True" />
                                                                                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/btn_eliminar.png"
                                                                                        ShowDeleteButton="True" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="btnAgregarNombreComercial" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                                <td style="vertical-align: top; padding-top: 4px;">
                                                                    <asp:LinkButton ID="btnAgregarNombreComercial" runat="server" CssClass="lnk" OnClick="btnAgregarNombreComercial_Click">Agregar</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        N° de partida <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNumeroPartida" runat="server" CssClass="ipt_150x20" MaxLength="30"></asp:TextBox>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Rubro detallado&nbsp; (SUNAT) &nbsp;*
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtRubroDetallado" runat="server" CssClass="ipt_150x20" MaxLength="200"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Aniversario
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaAniversario" runat="server" CssClass="ipt_150x20x2"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtFechaAniversario_CalendarExtender" runat="server"
                                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaAniversario">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Teléfono <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="ipt_150x20" MaxLength="15"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefono_FilteredTextBoxExtender" runat="server"
                                                            Enabled="True" TargetControlID="txtTelefono" ValidChars="0123456789( ) - * #">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        &nbsp;*
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Afiliado <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButtonList ID="rbGrupoIbk" runat="server" CssClass="txt-box-estilo" RepeatDirection="Horizontal">
                                                            <asp:ListItem Selected="True" Value="0">No</asp:ListItem>
                                                            <asp:ListItem Value="1">Si</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Ejecutivo de cobranza <span class="style5">(*)</span>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboEjecutivo" runat="server" CssClass="ipt_150x20x2">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td class="txt-box-estilo">
                                                        Zona de reparto (Lima)<span class="style5"> (*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cboZonaReparto" runat="server" CssClass="ipt_150x20">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Fecha de Constitución
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        <asp:TextBox ID="txtFecConstitucion" runat="server" CssClass="ipt_150x20x2"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtFecConstitucion_CalendarExtender" runat="server"
                                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFecConstitucion">
                                                        </ajaxToolkit:CalendarExtender>
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
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Dirección
                                                    </td>
                                                    <td colspan="5" style="border-width: 1px; border-style: solid; border-color: #CCC;
                                                        padding: 3px; background-color: #f5f5f5;">
                                                        <table width="83%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:UpdatePanel ID="upGvDireccion" UpdateMode="Conditional" runat="server">
                                                                        <ContentTemplate>
                                                                            <asp:GridView ID="gvDireccion" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                                                                OnRowDeleting="gvDireccion_RowDeleting" ShowHeader="False" ViewStateMode="Enabled"
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
                                                                                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="ipt_450x20" MaxLength="200"></asp:TextBox>&nbsp;<span
                                                                                                class="style5">(*)</span><br />
                                                                                            <asp:DropDownList ID="cboDepartamento" runat="server" AppendDataBoundItems="true"
                                                                                                AutoPostBack="True" CssClass="slt_150x20" OnSelectedIndexChanged="cboDepartamento_SelectedIndexChanged"
                                                                                                ViewStateMode="Enabled">
                                                                                            </asp:DropDownList>
                                                                                            <asp:DropDownList ID="cboProvincia" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                                                                CssClass="slt_150x20" OnSelectedIndexChanged="cboProvincia_SelectedIndexChanged"
                                                                                                ViewStateMode="Enabled">
                                                                                            </asp:DropDownList>
                                                                                            <asp:DropDownList ID="cboDistrito" runat="server" AppendDataBoundItems="true" CssClass="slt_150x20"
                                                                                                ViewStateMode="Enabled">
                                                                                            </asp:DropDownList>
                                                                                            <asp:DropDownList ID="cboTipoDireccion" runat="server" AppendDataBoundItems="true"
                                                                                                CssClass="slt_150x20">
                                                                                                <asp:ListItem Value="0">Tipo</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField ShowHeader="False">
                                                                                        <EditItemTemplate>
                                                                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></EditItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/btn_eliminar.png"
                                                                                        ShowDeleteButton="True" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                                <td style="vertical-align: top; padding-top: 15px;">
                                                                    <asp:LinkButton ID="btnAgregar" runat="server" CssClass="lnk" OnClick="btnAgregar_Click">Agregar</asp:LinkButton>
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
                            <td class="tit-nav-paginas" style="height: 45px;">
                                CONTACTOS
                            </td>
                            <td align="right">
                                <asp:LinkButton ID="btnAgregarContacto" runat="server" CssClass="lnk" OnClick="btnAgregarContacto_Click">Agregar</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="2">
                                <asp:UpdatePanel ID="upGvContactos" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvContactos" runat="server" BorderStyle="None" OnRowDeleting="gvContactos_RowDeleting"
                                            OnRowEditing="gvContactos_RowEditing" AutoGenerateColumns="False" Width="100%"
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
                                                <asp:CommandField ButtonType="Image" EditImageUrl="~/Imagenes/btn_editar.png" ShowEditButton="True"
                                                    ItemStyle-Width="40px" ItemStyle-HorizontalAlign="center" />
                                                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Imagenes/btn_eliminar.png"
                                                    ShowDeleteButton="True" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="center" />
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
                                CREDITOS Y COBRANZAS &gt; CLIENTE &gt;
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
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table width="100%" border="0" cellspacing="3" cellpadding="2">
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
                                                    <td colspan="2">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Documento de Identidad <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtDniContacto" runat="server" CssClass="ipt_150x20" MaxLength="8"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtDniContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtDniContacto" ValidChars="0123456789">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        &nbsp;<asp:Label ID="lblValidarDni" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Nombre <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtNombreContacto" runat="server" CssClass="ipt_150x20" MaxLength="50"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNombreContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtNombreContacto" ValidChars=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        &nbsp;<asp:Label ID="lblValidarNombre" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Apellido Paterno <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtApellidoPaternoContacto" runat="server" CssClass="ipt_150x20"
                                                            MaxLength="50"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtApellidoPaternoContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtApellidoPaternoContacto" ValidChars=" abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        &nbsp;<asp:Label ID="lblValidarApellido" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Apellido Materno
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
                                                    <td class="txt-box-estilo">
                                                        Teléfono Fijo
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtTelefonofijoContacto" runat="server" CssClass="ipt_150x20" MaxLength="10"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefonofijoContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txtTelefonofijoContacto" ValidChars="0123456789( ) - * #">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        &nbsp;<asp:Label ID="lblValidarTelefonoFijo" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Teléfono Móvil
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txttelefonoMovilContacto" runat="server" CssClass="ipt_150x20" MaxLength="9"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txttelefonoMovilContacto_FilteredTextBoxExtender"
                                                            runat="server" Enabled="True" TargetControlID="txttelefonoMovilContacto" ValidChars="0123456789( ) - * #">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        <asp:Label ID="lblValidarTelefonoMovil" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        E-mail <span class="style5">(*)</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtEmailContacto" runat="server" CssClass="ipt_150x20" MaxLength="50"></asp:TextBox>
                                                        <asp:Label ID="lblValidarEmail" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                    <td class="txt-box-estilo">
                                                        Fecha de Nacimiento
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFechaNacimientoContacto" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="txtFechaNacimientoContacto_CalendarExtender" runat="server"
                                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="txtFechaNacimientoContacto">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:Label ID="lblValidarFechaNac" runat="server" CssClass="txt2" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="txt-box-estilo">
                                                        Cargo <span class="style5">(*)</span>
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboCargoContacto" runat="server" CssClass="slt_150x20">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="txt-box-estilo">
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
            <asp:AsyncPostBackTrigger ControlID="gvLista" EventName="RowEditing" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
