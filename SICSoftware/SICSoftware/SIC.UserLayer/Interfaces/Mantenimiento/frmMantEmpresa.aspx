<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMantEmpresa.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmMantEmpresa" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 20px;
        }
        .style2
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #686168;
            height: 21px;
        }
        .style3
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 21px;
        }
        .style4
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvCliente" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwEmpresa" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt;&nbsp; EMPRESA</td>
                            <td align="right">
                                D</td>
                        </tr>
                        </tr>
                        <tr>
                            <td colspan="2" lign="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="style2" colspan="2">
                                                        <strong>Datos de la Empresa</strong></td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
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
                                                        RUC</td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRUC" runat="server" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Razón Social</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:TextBox ID="txtRazonSocial" runat="server" ReadOnly="True" Width="257px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Centro de Costo
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                    <asp:UpdatePanel ID="updCentroCosto" UpdateMode="Conditional" ChildrenAsTriggers="False" runat="server">
                                                    <ContentTemplate> 
                                                        <asp:GridView ID="gvCentroCosto" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            EmptyDataText="No se encontraron centro de costos." GridLines="None" Height="16px" 
                                                            PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%" DataKeyNames="emp_cst_c_iid" 
                                                            onrowediting="gvCentroCosto_RowEditing">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>                                                            
                                                                <asp:TemplateField HeaderText="Código">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_cst_c_iid")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_cst_c_vdesc")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Serie Boleta">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_cst_c_vserieboleta")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Serie Factura">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_cst_c_vseriefactura")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowEditButton="True" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnAgregarCentroCosto" runat="server" CssClass="lnk"
                                                            Text="Agregar Centro Costo" onclick="btnAgregarCentroCosto_Click" />
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
                                                        Locales
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <asp:UpdatePanel ID="updLocal" UpdateMode="Conditional" ChildrenAsTriggers="False" runat="server">
                                                        <ContentTemplate> 
                                                        <asp:GridView ID="gvLocal" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            EmptyDataText="No se encontraron locales." GridLines="None" Height="16px" 
                                                            ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Código">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_dir_c_iid")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción">
                                                                    <ItemTemplate>
                                                                        <%# Eval("emp_dir_c_vdireccion")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Centro de Costo">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_EMP_CENTRO_COSTO.emp_cst_c_vdesc")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowEditButton="True" />
                                                            </Columns>
                                                           
                                                        </asp:GridView>
                                                        </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnAgregarLocal" runat="server" CssClass="lnk" 
                                                            Text="Agregar Locales" />
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
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
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
                <asp:View ID="vwCentroCostoNuevo" runat="server">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt;&nbsp; CENTRO DE COSTO &gt; NUEVO</td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardarCCN" runat="server" CssClass="lnk" 
                                                onclick="btnGuardarCCN_Click">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelarCCN" runat="server" CssClass="lnk" 
                                                onclick="btnCancelarCCN_Click">Cancelar</asp:LinkButton>
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
                                                    <td align="left" class="style2" colspan="2">
                                                        <strong>Datos del Centro de Costo</strong></td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        Descripción</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtDescripcionCCN" runat="server" MaxLength="100"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4" colspan="2">
                                                        <strong>Correlativos de Boleta y Factura</strong></td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        Correlativo de Boleta</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtSerBoletaN" runat="server" MaxLength="3"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        Correlativo de Factura</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtSerFacturaN" runat="server" MaxLength="3"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
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
                <asp:View ID="vwCentroCostoEditar" runat="server">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt;&nbsp; CENTRO DE COSTO &gt; EDITAR</td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardarCCE" runat="server" CssClass="lnk">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelarCCE" runat="server" CssClass="lnk">Cancelar</asp:LinkButton>
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
                                                    <td align="left" class="style2" colspan="2">
                                                        <strong>Datos del Centro de Costo</strong></td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        Descripción</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtDescripcionCCE" runat="server" MaxLength="100"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4" colspan="2">
                                                        <strong>Correlativos de Boleta y Factura</strong></td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        Correlativo de Boleta</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtSerBoletaE" runat="server" MaxLength="3" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        Correlativo de Factura</td>
                                                    <td align="left" class="style4">
                                                        <asp:TextBox ID="txtSerFacturaE" runat="server" MaxLength="3" ReadOnly="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
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
                <asp:View ID="vwLocalNuevo" runat="server">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt;&nbsp; LOCAL &gt; NUEVO</td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="lnk">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="lnk">Cancelar</asp:LinkButton>
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
                                                    <td align="left" class="style2" colspan="2">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4" colspan="2">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
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
                <asp:View ID="vwLocalEditar" runat="server">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt;&nbsp; LOCAL &gt; EDITAR</td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="lnk">Guardar</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton4" runat="server" CssClass="lnk">Cancelar</asp:LinkButton>
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
                                                    <td align="left" class="style2" colspan="2">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4" colspan="2">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
                                                        &nbsp;</td>
                                                    <td align="left" class="style4">
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
                    
                </Triggers>
            </asp:UpdatePanel>
        </ContentTemplate>
        <Triggers>
            
        </Triggers>
    </asp:UpdatePanel>
                
</asp:Content>
