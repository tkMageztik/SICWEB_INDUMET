<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscListaItem.ascx.cs" Inherits="SIC.UserLayer.Interfaces.Reusable.uscListaItem" %>

    
<table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td class="tit-nav-paginas" align="left">
            &nbsp;<asp:Label ID="lblRuta" runat="server"></asp:Label>
&nbsp;&gt; SELECCIONAR ITEM<br />
        </td>
    </tr>
    <tr>
        <td class="txt2" align="left" colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="left" class="box-estilo01">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="txt-box-estilo">
                                                Código
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroCodigo" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px">
                                            </td>
                                            <td class="txt-box-estilo">
                                                Descripción
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFiltroDescr" runat="server" CssClass="ipt_150x20"></asp:TextBox>
                                            </td>
                                            <td style="width: 20px" class="txt-box-estilo">
                                                Almacen
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboFiltroAlmacen" runat="server" AppendDataBoundItems="True">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="txt-box-estilo">
                                                Familia
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboFiltroFamilia" runat="server" AppendDataBoundItems="true"
                                                    AutoPostBack="True" OnSelectedIndexChanged="cboFiltroFamilia_SelectedIndexChanged">
                                                    <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 20px">
                                                &nbsp;
                                            </td>
                                            <td class="txt-box-estilo">
                                                SubFamilia
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboFiltroSubFamilia" runat="server" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                &nbsp;
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
                                                <asp:Button ID="btnFiltrarItems" runat="server" CssClass="button small gris" Style="width: 100px"
                                                    Text="Buscar" OnClick="btnFiltrarItem_Click" />
                                            </td>
                                            <td align="center">
                                                <asp:Button ID="btnRegresarDesdeItems" runat="server" CssClass="button small gris"
                                                    Style="width: 100px; height: 26px;" Text="Regresar" OnClick="btnRegresarDesdeItems_Click" />
                                            </td>
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
        <td align="left" class="tit-nav-paginas">
            <asp:UpdatePanel ID="upGvListaITem" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                        GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                        AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                        BorderWidth="0px" ViewStateMode="Enabled" DataKeyNames="itm_alm_c_iid,itm_c_iid,alm_c_iid"
                        OnPageIndexChanging="gvListaItem_PageIndexChanging" OnRowDataBound="gvListaItem_RowDataBound"
                        OnRowCreated="gvListaItem_RowCreated">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:TemplateField HeaderText="SELECCIONAR">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:checkAll(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" onclick="javascript:Check_Click(this);" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CÓDIGO">
                                <ItemTemplate>
                                    <%#Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESCRIPCIÓN">
                                <ItemTemplate>
                                    <%#Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PRECIO VENTA">
                                <ItemTemplate>
                                    <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("SIC_T_ITEM.itm_c_dprecio_venta"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UNIDAD DE MEDIDA">
                                <ItemTemplate>
                                    <%#Eval("SIC_T_ITEM.itm_c_vpardes")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ALMACEN">
                                <ItemTemplate>
                                    <%#Eval("SIC_T_ALMACEN.alm_c_vdesc")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="STOCK">
                                <ItemTemplate>
                                    <%# string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:F2}", Eval("itm_alm_c_ecantidad"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </td>
    </tr>
    <tr>
        <td align="left" class="tit-nav-paginas">
            &nbsp;
        </td>
    </tr>
</table>
