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
                                            <td class="txt-box-estilo">
                                                RUC
                                            </td>
                                            <td style="margin-left: 80px">
                                                <asp:TextBox ID="txtFiltroRuc" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td class="txt-box-estilo">
                                                Razón Social
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroRS" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="txt-box-estilo">
                                                Desde
                                            </td>
                                            <td style="margin-left: 80px">
                                                <asp:TextBox ID="txtFiltroFecIni" runat="server"></asp:TextBox>
                                                &nbsp;<asp:CalendarExtender ID="txtFiltroFecIni_CalendarExtender" runat="server"
                                                    TargetControlID="txtFiltroFecIni" Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td class="txt-box-estilo">
                                                Hasta
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroFecFin" runat="server"></asp:TextBox>
                                                <asp:CalendarExtender ID="txtFiltroFecFin_CalendarExtender" runat="server" TargetControlID="txtFiltroFecFin"
                                                    Format="dd/MM/yyyy" TodaysDateFormat="dd/MM/yyyy" />
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                            <tr>
                                <td align="left" class="tit-nav-paginas">
                                    <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="gvItemsAlmacen" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                                GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                                AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                                PageSize="15" BorderWidth="0px" DataKeyNames="mve_c_iid">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <Columns>
                                                </Columns>
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
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
