<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="wucMensajeAlerta2.ascx.cs"
    Inherits="SIC.UserLayer.UserControl.wucMensajeAlerta2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
<ajaxtoolkit:ModalPopupExtender BackgroundCssClass="modalBackground" CancelControlID="btnSecond"
    runat="server" PopupControlID="Mipanel1" ID="ModalPopupExtender1" TargetControlID="btnShowPopup" />
<asp:Panel ID="Mipanel1" runat="server" CssClass="modalPopup" DefaultButton="btnOk"
    Width="320px">
    <div id="Cabecera" style="width: 320px">
        <table style="width: 320px">
            <tr style="background-color: #3E761C">
                <td align="left" class="style1">
                    <asp:Label ID="lblTitulo" runat="server" Text="SICWEB - INDUMET" ForeColor="White"
                        Font-Bold="True"></asp:Label>
                    <%-- <asp:ImageButton runat="server" ID="ibtnCancelar" AlternateText="Cancelar" ToolTip = "Cancelar" 
                ImageUrl="~/Imagenes/u290_original.png" CssClass='LinkURL' Height="20px" 
                Width="20px"  />  --%>
                    <asp:Button ID="btnOk" runat="server" Text="ok" Visible="false" />
                </td>
            </tr>
        </table>
    </div>
    <div id="cuerpo" class="BodyMensaje">
        <table class="TabBodyMensaje">
            <tr>
                <td style="width: 50px;" align="center">
                    <asp:Image ID="imgMensaje" runat="server" Height="32px" Width="32px" CssClass="imagen" />
                </td>
                <td align="left" class="style8">
                    <div style="margin-right: 15px;">
                        <asp:Label ID="lblMensaje" runat="server" Text="" CssClass="Label1"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="pie" style="width: 320px">
        <table width="320">
            <tr style="background-color: White">
                <td align="center">
                    <asp:Button ID="btnFirst" runat="server" Text="First" BorderColor="#3E761C" BackColor="#3E761C"
                        Font-Size="XX-Small" ForeColor="White" OnClick="btnFirst_Click" Style="height: 21px" />
                </td>
                <td align="center">
                    <asp:Button ID="btnSecond" runat="server" BackColor="#3E761C" BorderColor="#3E761C"
                        Font-Size="XX-Small" ForeColor="White" OnClick="btnSecond_Click" Text="Second" />
                </td>
                <td align="center">
                    <asp:Button ID="btnThird" runat="server" BackColor="#3E761C" BorderColor="#3E761C"
                        Font-Size="XX-Small" ForeColor="White" OnClick="btnThird_Click" Text="Third" />
                </td>
            </tr>
        </table>
    </div>
</asp:Panel>
