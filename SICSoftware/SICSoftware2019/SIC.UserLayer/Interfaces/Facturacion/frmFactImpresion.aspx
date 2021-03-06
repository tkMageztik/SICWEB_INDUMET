﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmFactImpresion.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.frmFactImpresion" %>

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
                                                                                            Tipo Documento</td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="cboDocumento" runat="server" AutoPostBack="True" 
                                                                                                onselectedindexchanged="cboDocumento_SelectedIndexChanged">
                                                                                                <asp:ListItem>Factura</asp:ListItem>
                                                                                                <asp:ListItem>Boleta</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
                                                                                        <td class="txt-box-estilo">
                                                                                            Rango de Número</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtNumDesde" runat="server" Width="80px"></asp:TextBox>
                                                                                            &nbsp;-
                                                                                            <asp:TextBox ID="txtNumHasta" runat="server" Width="80px"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="txt-box-estilo">
                                                                                            Estado Impresion</td>
                                                                                        <td>
                                                                                            <asp:DropDownList ID="cboEstado" runat="server" AutoPostBack="True" 
                                                                                                onselectedindexchanged="cboDocumento_SelectedIndexChanged">
                                                                                                <asp:ListItem Value="-- Seleccione --"></asp:ListItem>
                                                                                                <asp:ListItem Value="False">No ha sido Impreso</asp:ListItem>
                                                                                                <asp:ListItem Value="True">Impreso Anteriormente</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
                                                                                        <td class="txt-box-estilo">
                                                                                            RUC Cliente</td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRucCliente" runat="server" Width="175px"></asp:TextBox>
                                                                                        </td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
                                                                                        <td>
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
                                                                                            <asp:Button ID="btnBuscarFactura" runat="server" CssClass="button small gris" 
                                                                                                Text="Buscar" Width="100px" onclick="btnBuscarFactura_Click" />
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
                                                    <asp:UpdatePanel ID="upListaFactura" 
                                                    UpdateMode="Conditional" ChildrenAsTriggers="False" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="gvListaFactura" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" 
                                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" 
                                                            Width="100%" DataKeyNames="fac_c_iid" 
                                                            onselectedindexchanged="gvListaFactura_SelectedIndexChanged" 
                                                            AllowPaging="True" onpageindexchanging="gvListaFactura_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>                                                                
                                                                <asp:TemplateField HeaderText="Serie y Número">
                                                                    <ItemTemplate>
                                                                        <%# Eval("fac_c_serie") + "-" + Eval("fac_c_numero").ToString().PadLeft(7,'0')%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cliente">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tipo Documento">
                                                                    <ItemTemplate>
                                                                        Factura
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="FECHA DE REGISTRO" DataField="fac_c_zfecharegistro" />
                                                                <asp:CommandField SelectText="Imprimir" ShowSelectButton="True" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>  
                                                    
                                                    
                                                        <asp:GridView ID="gvListaBoleta" runat="server" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" DataKeyNames="bol_c_iid" 
                                                            EmptyDataText="No hay datos disponibles." GridLines="None" 
                                                            PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" 
                                                            Width="100%" onselectedindexchanged="gvListaBoleta_SelectedIndexChanged" 
                                                            AllowPaging="True" onpageindexchanging="gvListaBoleta_PageIndexChanging">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Serie y Número">
                                                                    <ItemTemplate>
                                                                        <%# Eval("bol_c_serie") + "-" + Eval("bol_c_numero").ToString().PadLeft(7,'0')%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cliente">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_VENTA.SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tipo Documento">
                                                                    <ItemTemplate>
                                                                        Boleta
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="FECHA DE REGISTRO" DataField="bol_c_zfecharegistro" />
                                                                <asp:CommandField SelectText="Imprimir" ShowSelectButton="True" />
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>                                                  
                                                    
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
                                                    <td align="left" class="style1" colspan="4">
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="left" class="box-estilo01">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td>
                                                                                <table>
                                                                                    <tr>
                                                                                        <td class="txt-box-estilo">
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
                                                                                        <td class="txt-box-estilo">
                                                                                            &nbsp;</td>
                                                                                        <td>
                                                                                            &nbsp;</td>
                                                                                        <td style="width: 20px">
                                                                                            &nbsp;</td>
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
                                                                                            &nbsp;</td>
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
                                                    <td align="left" class="style1" colspan="4">
                                                    
                                                    </td>
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
