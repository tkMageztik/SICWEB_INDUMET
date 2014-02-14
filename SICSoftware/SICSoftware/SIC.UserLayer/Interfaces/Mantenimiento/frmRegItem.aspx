<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmRegItem.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegItem"
    Culture="auto" UICulture="auto" %>

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
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script language="javascript" type="text/javascript">
        // Except only numbers and dot (.) for salary textbox
        function onlyDotsAndNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode == 46) {
                return true;
            }
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
        //Except only numbers for Age textbox
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        // No alphabets for Emp No textbox
        function noAlphabets(event) {
            var charCode = (event.which) ? event.which : event.keyCode
            if ((charCode >= 97) && (charCode <= 122) || (charCode >= 65) && (charCode <= 90))
                return false;

            return true;
        }
    </script>
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvItem" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ITEM&nbsp;
                                <br />
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" OnClick="btnBuscar_Click"
                                                                        Style="width: 100px" Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnNuevo" runat="server" CssClass="lnk" Height="26px" OnClick="btnNuevo_Click"
                                                                        Text="Nuevo" Width="101px" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    &nbsp;
                                                                </td>
                                                                <td align="center">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td align="right">
                                                        &nbsp;
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
                                            PageSize="15" BorderWidth="0px" ViewStateMode="Enabled" OnRowEditing="gvListaItem_RowEditing"
                                            DataKeyNames="itm_c_iid" OnRowDeleting="gvListaItem_RowDeleting" OnPageIndexChanging="gvListaItem_PageIndexChanging">
                                            <AlternatingRowStyle CssClass="alt" />
                                            <Columns>
                                                <asp:BoundField DataField="itm_c_ccodigo" HeaderText="CÓDIGO" />
                                                <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="DESCRIPCIÓN" />
                                                <asp:TemplateField HeaderText="PRECIO COMPRA">
                                                    <ItemTemplate>
                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_c_dprecio_compra"))%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="PRECIO VENTA">
                                                    <ItemTemplate>
                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_c_dprecio_venta"))%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="itm_c_vpardes" HeaderText="UNIDAD DE MEDIDA" />
                                                <asp:TemplateField HeaderText="FAMILIA">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ITEM_SUB_FAMILIA.SIC_T_ITEM_FAMILIA.ifm_c_des")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SUBFAMILIA">
                                                    <ItemTemplate>
                                                        <%# Eval("SIC_T_ITEM_SUB_FAMILIA.isf_c_des")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="True" CancelText="Cancelar" DeleteText="Eliminar"
                                                    EditText="Editar" />
                                                <asp:CommandField ShowDeleteButton="True" />
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
                <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; ITEM &gt;
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
                                                    <td align="left">
                                                        <asp:TextBox ID="txtCodigo" runat="server" MaxLength="100"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Descripción
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="100"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Unidad de Medida
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboUnidad" runat="server">
                                                        </asp:DropDownList>
                                                        <asp:LinkButton ID="btnMostrarAgregarFam1" runat="server" CssClass="lnk" OnClick="btnMostrarAgregarFam1_Click">Agregar</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Precio de Compra
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtPrecioCompra" runat="server" onkeypress="return onlyDotsAndNumbers(event)"
                                                            MaxLength="20"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Precio de Venta
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtPrecioVenta" runat="server" onkeypress="return onlyDotsAndNumbers(event)"
                                                            MaxLength="20"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Familia
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboFamilia" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                            OnSelectedIndexChanged="cboFamilia_SelectedIndexChanged">
                                                            <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:LinkButton ID="btnMostrarAgregarFam0" runat="server" CssClass="lnk" OnClick="btnMostrarAgregarFam_Click">Agregar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        SubFamilia
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboSubFamilia" runat="server" AppendDataBoundItems="true">
                                                            <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:LinkButton ID="btnMostrarAgregarFam" runat="server" CssClass="lnk" OnClick="btnMostrarAgregarFam_Click">Agregar</asp:LinkButton>
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
                                                    <td align="left" class="style2">
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
                <asp:View ID="vwAgregarFamilia" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; ITEM &gt; FAMILIAS Y SUB FAMILIAS
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkRegresar" runat="server" CssClass="lnk" OnClick="lnkRegresar_Click">Regresar</asp:LinkButton>
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
                                                        Familias
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboFamiliaAgr" runat="server" AppendDataBoundItems="true" AutoPostBack="True"
                                                            OnSelectedIndexChanged="cboFamiliaAgr_SelectedIndexChanged">
                                                            <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left">
                                                        Agregar Familia
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtNombreFamilia" runat="server" MaxLength="20"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnAgregarFamilia" runat="server" CssClass="lnk" OnClick="btnAgregarFamilia_Click">Agregar</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        SubFamilia
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboSubFamiliaAgr" runat="server" AppendDataBoundItems="true">
                                                            <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Agregar SubFamilia
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtNombreSubFamilia" runat="server" MaxLength="20"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="btnAgregarSubFamilia" runat="server" CssClass="lnk" OnClick="btnAgregarSubFamilia_Click">Agregar</asp:LinkButton>
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
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style2">
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
                <asp:View ID="vwUnidadMedida" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                MANTENIMIENTO &gt; ITEM &gt; UNIDAD DE MEDIDA
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="lnk" OnClick="lnkRegresar_Click">Regresar</asp:LinkButton>
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
                                                        Unidades de Medida
                                                    </td>
                                                    <td align="left">
                                                        <asp:DropDownList ID="cboUnidadMedida" runat="server" AppendDataBoundItems="true"
                                                            AutoPostBack="True">
                                                            <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left">
                                                        Agregar Unidad de Medida
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtUnidadMedida" runat="server" MaxLength="20"></asp:TextBox>
                                                        &nbsp;
                                                        <asp:LinkButton ID="lnkAgregarUnidadMedida" runat="server" CssClass="lnk" OnClick="lnkAgregarUnidadMedida_Click">Agregar</asp:LinkButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                    <td align="left">
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
                                                    <td align="left" class="style2">
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
                    <asp:AsyncPostBackTrigger ControlID="gvListaItem" EventName="RowDeleting" />
                    <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
