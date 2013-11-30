<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegItem.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegItem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/UserControl/wucMensajeAlerta.ascx" TagName="Mensaje" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" ChildrenAsTriggers="False"
        runat="server">
          <ContentTemplate>
            <asp:MultiView ID="mvItem" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                     <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                         <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ITEM&nbsp; 2</td>
                         </tr>
                         <tr>
                             <td align="left" class="tit-nav-paginas">
                                 <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                            GridLines="None" AllowPaging="True" Width="100%"
                                            CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                                            ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles." 
                                            PageSize="15"  BorderWidth="0px" ViewStateMode="Enabled" 
                                     onrowediting="gvListaItem_RowEditing" >
                                     <AlternatingRowStyle CssClass="alt" />
                                     <Columns>
                                         <asp:BoundField DataField="itm_c_ccodigo" HeaderText="Código" />
                                         <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="Descripción" />
                                         <asp:BoundField DataField="itm_c_dprecio" HeaderText="Precio" />
                                         <asp:TemplateField HeaderText="Unidad">
                                             <ItemTemplate>
                                                 <asp:Label ID="lblUnidad" runat="server" 
                                                     Text='<%# Eval("SIC_T_PARAMETRO_DET.par_det_c_vdesc") %>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
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
                            <td class="tit-nav-paginas" align="left" colspan="2">
                                MANTENIMIENTO &gt; ITEM
                            </td>
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
                        <tr>
                            <td class="txt2" align="left" colspan="2" class="box-estilo01">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="txt-box-estilo">
                                            Código</td>
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
                                            Descripción</td>
                                        <td align="left" class="txt-box-estilo">
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" class="txt-box-estilo">
                                            Unidad</td>
                                             <td align="left" class="txt-box-estilo">
                                                 <asp:DropDownList ID="cboUnidad" runat="server">
                                                 </asp:DropDownList>
                                        </td>
                                    </tr>
                                 
                              </table>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    
                </asp:View>  

            </asp:MultiView>
          </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
