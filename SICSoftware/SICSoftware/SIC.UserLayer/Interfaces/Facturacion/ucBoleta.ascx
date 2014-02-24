<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBoleta.ascx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.ucBoleta" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
   
<style type="text/css">
    .style1
    {
        width: 10px;
    }
    .style2
    {
        width: 32px;
    }
</style>
   
<asp:Button ID="btnShowPopup" runat="server" Style="display: none" />

<asp:Panel ID="Mipanel1" runat="server"  Width="531px">

    <table style="width: 522px; border-color: #003162; border-style: solid;">
        <tr>
                
        <td align = "left">                  
            <asp:Button ID="btnOk" runat="server" Text="ok" Visible="false" />
        </td>

    </tr>
    <tr>
        <td align = "center">
            <table class="txt" >
                <tr>
                    <td colspan = "2">
                        <asp:Image ID="imgLogo" runat="server" Height="47px" Width="136px" CssClass="imagen" />
                    </td>
                  
                    <td class="style1"></td>                    
                    <td class="style2"></td>
                    <td colspan = "2" style= "width: 61px" align="right">
                        <table style="border: 2px solid #001E3C; width:150px">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblRucProp" runat="server" Text="test"></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#001E3C">
                                <td align="center">
                                    <asp:Label ID="lblTipoDoc" runat="server" Font-Bold="True" ForeColor="White">BOLETA</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="lblFactura" runat="server" Text="0022"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    
                </tr>
                
               
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Fecha"></asp:Label>
                        
                    </td>
                    <td style= "width: 229px">
                        <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label>
                    </td>
                    <td class="style1" ></td>                    
                    <td class="style2"></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Señor(es)"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="R.U.C."></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblRuc" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Dirección"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblDireccion" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr align="left">
                    <td class="style1" colspan="6">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Código">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="100px" />
                                    <ItemTemplate>
                                        <%# Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Cant.">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="50px" />
                                    <ItemTemplate>
                                        <%# Eval("bol_det_c_ecantidad")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripción">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="530px" />
                                    <ItemTemplate>
                                        <%# Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="P. Unit.">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="200px" />
                                    <ItemTemplate>
                                        <%# Eval("bol_det_c_epreciounit")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Importe">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="200px" />
                                    <ItemTemplate>
                                        <%# Eval("bol_det_c_epreciotot")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan = "6">
                        &nbsp;</td>
                </tr>
                

                <tr>
                    <td colspan = "4" align= "right">
                        <asp:Label ID="Label10" runat="server" Text="Subtotal"></asp:Label>        
                    </td>
                    <td colspan = "2" align="right">
                        <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan = "4" align= "right"> 
                        <asp:Label ID="Label11" runat="server" Text="I.G.V."></asp:Label>              
                    </td>
                    <td colspan = "2" align="right">
                        <asp:Label ID="lblIGV" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan = "4" align = "right">   
                        <asp:Label ID="Label12" runat="server" Text="Total"></asp:Label>
                    </td>
                    <td colspan = "2" align="right">
                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                    </td>
                </tr>                
            
            </table>              

        </td>
    </tr>
    </table>
</asp:Panel>


