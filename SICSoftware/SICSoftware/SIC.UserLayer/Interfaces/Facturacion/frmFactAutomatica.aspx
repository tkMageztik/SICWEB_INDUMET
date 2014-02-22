<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFactAutomatica.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.frmFactAutomatica" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>
<%@ Register src="ucFactura.ascx" tagname="ucFactura" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 20px;
        }
        .style3
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 21px;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
        <ContentTemplate>

            <script type = "text/javascript">
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
                            <td colspan="2" align="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" 
                                                class="txt-box-estilo">
                                                <tr>
                                                    <td align="left" class="txt-box-estilo" colspan="4">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="left" class="box-estilo01">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="txt-box-estilo">
                                                                                            Concepto</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td style="width: 20px">
                                                                                            <asp:DropDownList ID="cboConcepto" runat="server">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td class="txt-box-estilo">
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            Periodo</td>
                                                                                        <td style="width: 20px">
                                                                                            <asp:DropDownList ID="cboPeriodo" runat="server">
                                                                                            </asp:DropDownList>
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
                                                                                            <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" 
                                                                                                onclick="btnBuscar_Click" Style="width: 100px" Text="Buscar" />
                                                                                            <asp:Button ID="btnRegistrar" runat="server" CssClass="button small gris" 
                                                                                                onclick="btnRegistrar_Click" Style="width: 100px" Text="Registrar" />
                                                                                        </td>
                                                                                        <td align="center">
                                                                                            &nbsp;</td>
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
                                                    <td align="left" class="txt-box-estilo" colspan="4">
                                                        <asp:GridView ID="gvListaVenta" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" 
                                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" 
                                                            Width="100%" DataKeyNames="ven_c_iid" 
                                                            onselectedindexchanged="gvListaVenta_SelectedIndexChanged">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="SELECCIONAR">
                                                                    <HeaderTemplate>
                                                                        <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:checkAll(this);"/>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="chkSelect" runat="server" onclick="javascript:Check_Click(this);"/>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
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
                                                                <asp:BoundField DataField="ven_c_vdestipodoc" HeaderText="TIPO DOCUMENTO" />
                                                                <asp:BoundField DataField="ven_c_vdescmoneda" HeaderText="MONEDA" />
                                                                <asp:TemplateField HeaderText="MONTO TOTAL">
                                                                    <ItemTemplate>
                                                                        <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("ven_c_etotal"))%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="ven_c_zfecha" HeaderText="FECHA DE REGISTRO" />
                                                                <asp:CommandField SelectText="Vista Previa" ShowSelectButton="True" />
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
                <asp:View ID="vwFacturaPreliminar" runat="server">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                FACTURACION &gt; VISTA PREVIA FACTURA</td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:LinkButton ID="btnCancelarCCE" runat="server" CssClass="lnk" 
                                                onclick="btnCancelarCCE_Click">Cancelar</asp:LinkButton>
                                        </td>
                                        <td style="width: 10px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                    </td>
                                                    <td align="left" class="style3">
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="justify" class="style3" colspan="4">
                                                        <uc2:ucFactura ID="ucFactura1" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
                                                        &nbsp;</td>
                                                    <td align="left" class="style3">
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
    </asp:UpdatePanel>
                
</asp:Content>
