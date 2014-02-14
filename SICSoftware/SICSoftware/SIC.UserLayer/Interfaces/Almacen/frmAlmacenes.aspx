<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="frmAlmacenes.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Almacen.frmAlmacenes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="tit-nav-paginas" style="text-align: left;">
            ALMACÉN &gt; ALMACENES</div>
        <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <asp:MultiView ID="mvAlmacenes" runat="server" ActiveViewIndex="0">
                    <asp:View ID="vwListaAlmacenes" runat="server">
                        <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" class="box-estilo01">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                            <tr>
                                <td align="left" class="tit-nav-paginas">
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="vwTransItems" runat="server">
                        <div>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
