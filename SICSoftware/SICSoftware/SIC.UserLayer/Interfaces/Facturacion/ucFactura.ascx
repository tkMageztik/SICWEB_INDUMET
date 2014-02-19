<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucFactura.ascx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.ucFactura" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
   
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
                  
                    <td></td>                    
                    <td style= "width:32px"></td>
                    <td colspan = "2" style= "width: 61px">
                        <table style="border: 2px solid #001E3C; width:150px">
                            <tr>
                                <td>
                                    <asp:Label ID="lblRucProp" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr bgcolor="#001E3C">
                                <td>
                                    <asp:Label ID="lblTipoDoc" runat="server" Font-Bold="True" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblFactura" runat="server" Text=""></asp:Label>
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
                    <td ></td>                    
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Cliente"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCliente" runat="server" Text=""></asp:Label>
                    </td>
                    <td ></td>                    
                    <td ></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="R.U.C / D.N.I"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblRuc" runat="server" Text=""></asp:Label>
                    </td>
                    <td ></td>                    
                    <td ></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Inmueble"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblInmueble" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr align= "left">
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Domicilio"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblDomicilio" runat="server" Text=""></asp:Label>
                    </td>
                    <td style= "width:28px"></td>                    
                    <td ></td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Local"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblLocal" runat="server" Text=""></asp:Label>
                    </td>
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
                                        <%# Eval("fac_det_c_ecantidad")%>
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
                                        <%# Eval("fac_det_c_epreciounit")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Importe">
                                    <HeaderStyle BackColor="#001E3C" ForeColor="White" Width="200px" />
                                    <ItemTemplate>
                                        <%# Eval("fac_det_c_epreciotot")%>
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
    <tr>
        <td align= "right">
            <asp:Button ID="btnCancelar" runat="server" Text="Aceptar" BorderColor="#001E3C" 
                    BackColor= "#003D79" Font-Size="XX-Small" ForeColor="White" 
                />
        </td>
    </tr>
    </table>
</asp:Panel>

