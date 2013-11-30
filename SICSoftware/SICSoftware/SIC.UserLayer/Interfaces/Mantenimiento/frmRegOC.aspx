<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegOC.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegOC" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            height: 59px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">

        <ContentTemplate>
           <asp:MultiView ID="mvOC" runat="server">
             <asp:View ID="View1" runat="server">
                   <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                         <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA</td>
                         </tr>
                         <tr>
                             <td align="left" class="tit-nav-paginas">

                                 <asp:GridView  ID="gvListaOC" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" Width="100%"
                                            CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                            ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles." 
                                            PageSize="15"  BorderWidth="0px" ViewStateMode="Enabled">
                                     <AlternatingRowStyle CssClass="alt" />
                                     <Columns>
                                         <asp:BoundField HeaderText="Proveedor" />
                                         <asp:BoundField HeaderText="N° Items" />
                                         <asp:BoundField HeaderText="Moneda" />
                                         <asp:BoundField HeaderText="Fecha Entrega" />
                                         <asp:BoundField HeaderText="Total" />
                                         <asp:CommandField ShowEditButton="True" />
                                         <asp:CommandField ShowDeleteButton="True" />
                                     </Columns>
                                     <PagerStyle CssClass="pgr" />
                                 </asp:GridView>

                             </td>
                        </tr>

                    </table>


             </asp:View>
             <asp:View ID="View2" runat="server">
                <table style="width:100%;">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA</td>
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
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Proveedor</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Precio</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Condiciones de Pago</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Fecha Entrega</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Moneda</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:DropDownList ID="DropDownList1" runat="server" Width="201px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Estado</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:Label ID="lblEstado" runat="server" Text="[ESTADO]"></asp:Label>
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
                                            Condiciones de Pago</td>
                                        <td align="left" class="style1">
                                            <asp:TextBox ID="TextBox5" runat="server" Height="49px" Width="206px"></asp:TextBox>
                                        </td>
                                        <td align="left" class="style1">
                                            Condiciones de la O.C.</td>
                                        <td align="left" class="style1">
                                            <asp:TextBox ID="TextBox6" runat="server" Height="49px" Width="206px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            I.G.V.</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:Label ID="lblIGV" runat="server" Text="18%"></asp:Label>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Percepción</td>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Sub Total</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:Label ID="lblIGV0" runat="server" Text="[SubTotal]"></asp:Label>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Total</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:Label ID="lblIGV1" runat="server" Text="[SubTotal]"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Items</td>
                                        <td align="left" class="txt-box-estilo" colspan="2">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                                AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                EmptyDataText="No hay datos disponibles." GridLines="None" Height="16px" 
                                                PagerStyle-CssClass="pgr" PageSize="15" ShowHeaderWhenEmpty="True" 
                                                ViewStateMode="Enabled" Width="100%">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Cod. Item" />
                                                    <asp:BoundField HeaderText="Descripción" />
                                                    <asp:BoundField HeaderText="Cantidad" />
                                                    <asp:BoundField HeaderText="Precio Unitario" />
                                                    <asp:CommandField ShowDeleteButton="True" />
                                                    <asp:CommandField ShowEditButton="True" />
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Agregar" />
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
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                        <td align="left" class="txt-box-estilo">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
             </asp:View>
           </asp:MultiView>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
