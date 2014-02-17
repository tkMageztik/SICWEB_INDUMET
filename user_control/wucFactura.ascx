<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucFactura.ascx.cs" Inherits="ADV.UserLayer.Interfaces.Facturacion.UserControl.wucFactura" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
   
<asp:Button ID="btnShowPopup" runat="server" Style="display: none" />

<ajaxtoolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
CancelControlID="ibtnCancelar" runat="server" PopupControlID="Mipanel1" 
ID="ModalPopupExtender1"
TargetControlID="btnShowPopup" />

<asp:Panel ID="Mipanel1" runat="server" CssClass="modalPopup" 
    DefaultButton="btnOk" Width="531px">
    <link href="../../../Styles/css.css" rel="Stylesheet" type="text/css" />
<div id = "Cabecera" style="width: 531px">    
    <table style="width: 522px; border-color: #003162; border-style: solid;">
        <tr>
                
        <td align = "left" colspan= "2">                  
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
                <tr>
                    <td colspan = "6">
                        <table width = "515px" style="border: 1px solid #001E3C;">
                            <tr>
                                <td style="background-color: #001E3C ; width :352px">
                                    <asp:Label ID="Label6" runat="server" Text="Concepto" ForeColor= "White"></asp:Label>
                                </td>
                                <td style="background-color: #001E3C; width : 150px">
                                <asp:Label ID="Label7" runat="server" Text="Monto" ForeColor= "White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align = "left"  >                        

                                    <asp:Label ID="lblConcepto" runat="server" Text=""></asp:Label>
                                </td>    
                                <td>                        
                                    <asp:Label ID="lblMonto" runat="server" Text=""></asp:Label>
                                </td>                  
                            </tr>
                            <tr>
                                <td align= "left" >
                                    <asp:Label ID="lblDetracciones" runat="server" Text=""></asp:Label>
                                </td>
                                <td>                        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align= "center">
                                    <asp:Label ID="lblServRecau" runat="server" Text="" Font-Bold="true" ></asp:Label>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr align= "left">
                                <td>
                                    <asp:Label ID="lblmontoLetras" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                

                <tr>
                    <td colspan = "4" align= "right">
                        <asp:Label ID="Label10" runat="server" Text="Subtotal"></asp:Label>        
                    </td>
                    <td colspan = "2">
                        <asp:Label ID="lblSubTotal" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan = "4" align= "right"> 
                        <asp:Label ID="Label11" runat="server" Text="I.G.V."></asp:Label>              
                    </td>
                    <td colspan = "2">
                        <asp:Label ID="lblIGV" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan = "4" align = "right">   
                        <asp:Label ID="Label12" runat="server" Text="Total"></asp:Label>
                    </td>
                    <td colspan = "2">
                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                    </td>
                </tr>                
            
            </table>              

        </td>
    </tr>
    <tr>
        <td align= "right">
            <asp:Button ID="ibtnCancelar" runat="server" Text="Aceptar" BorderColor="#001E3C" 
                    BackColor= "#003D79" Font-Size="XX-Small" ForeColor="White"/>
        </td>
    </tr>
    </table>
</div>


    
</asp:Panel>

