<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFactAutomatica.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.frmFactAutomatica" %>

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
            <script type="text/javascript" src="<%= ResolveUrl ("~/Scripts/numeric_input.js") %>"></script>  
            <asp:MultiView ID="mvFacturacionAutomatica" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwMain" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                FACTURACIÓN &gt;&nbsp; AUTOMATICA</td>
                            <td align="right">
                                &nbsp;</td>
                        </tr>
                        </tr>
                        <tr>
                            <td colspan="2" lign="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" 
                                                class="txt-box-estilo">
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Concepto</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboConcepto" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Periodo</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:DropDownList ID="cboPeriodo" runat="server">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        </td>
                                                    <td align="left" class="txt-box-estilo">
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        </td>
                                                    <td align="left" class="txt-box-estilo">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1">
                                                        </td>
                                                    <td align="left" class="style1" colspan="2">
                                                        </td>
                                                    <td class="style1">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="4">
                                                        <asp:GridView ID="gvListaVenta" runat="server" AllowPaging="True" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" 
                                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" Width="100%">
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
                                                                <asp:BoundField DataField="ven_c_vdestipodoc" HeaderText="TIPO DOCUMENTO" />
                                                                <asp:BoundField DataField="ven_c_vdescmoneda" HeaderText="MONEDA" />
                                                                <asp:TemplateField HeaderText="MONTO TOTAL">
                                                                    <ItemTemplate>
                                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("ven_c_etotal"))%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="ven_c_zfecha" HeaderText="FECHA DE REGISTRO" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
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
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style1">
                                                        </td>
                                                    <td align="left" class="style1" colspan="2">
                                                        </td>
                                                    <td class="style1">
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
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo" colspan="2">
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
