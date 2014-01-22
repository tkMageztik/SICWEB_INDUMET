<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="frmRegOC.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Mantenimiento.frmRegOC" %>

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
            height: 59px;
        }
        .style3
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11.5px;
            color: #686168;
            width: 305px;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upGeneral" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            var TotalChkBx;
            var Counter;

            window.onload = function () {
                //Get total no. of CheckBoxes in side the GridView.
                TotalChkBx = parseInt('<%= this.gvListaItem.Rows.Count %>');

                //Get total no. of checked CheckBoxes in side the GridView.
                Counter = 0;
            }

            function HeaderClick(CheckBox) {
                //Get target base & child control.
                var TargetBaseControl =
       document.getElementById('<%= this.gvListaItem.ClientID %>');
                var TargetChildControl = "chkSelect";

                //Get all the control of the type INPUT in the base control.
                var Inputs = TargetBaseControl.getElementsByTagName("input");

                //Checked/Unchecked all the checkBoxes in side the GridView.
                for (var n = 0; n < Inputs.length; ++n)
                    if (Inputs[n].type == 'checkbox' &&
                Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                        Inputs[n].checked = CheckBox.checked;

                //Reset Counter
                Counter = CheckBox.checked ? TotalChkBx : 0;
            }

            function ChildClick(CheckBox, HCheckBox) {
                //get target control.
                var HeaderCheckBox = document.getElementById(HCheckBox);

                //Modifiy Counter; 
                if (CheckBox.checked && Counter < TotalChkBx)
                    Counter++;
                else if (Counter > 0)
                    Counter--;

                //Change state of the header CheckBox.
                if (Counter < TotalChkBx)
                    HeaderCheckBox.checked = false;
                else if (Counter == TotalChkBx)
                    HeaderCheckBox.checked = true;
            }
</script>
            <asp:MultiView ID="mvOC" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA
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
                                                                    
                                                                    RUC Prov.</td>
                                                                <td>
                                                                    
                                                                    <asp:TextBox ID="txtFiltroRuc" runat="server"></asp:TextBox>
                                                                    
                                                                </td>
                                                                <td style="width: 20px; margin-left: 160px;">
                                                                    Moneda</td>
                                                                <td class="txt-box-estilo">
                                                                    
                                                                    <asp:DropDownList ID="cboFiltroMoneda" runat="server" 
                                                                        AppendDataBoundItems="True" AutoPostBack="True" 
                                                                        onselectedindexchanged="cboMoneda_SelectedIndexChanged" Width="201px">
                                                                    </asp:DropDownList>
                                                                    
                                                                </td>
                                                                <td>
                                                                    
                                                                    Estado</td>
                                                                <td style="width: 20px">
                                                                    <asp:DropDownList ID="cboFiltroEstado" runat="server" 
                                                                        AppendDataBoundItems="True" AutoPostBack="True" 
                                                                        onselectedindexchanged="cboMoneda_SelectedIndexChanged" Width="201px">
                                                                    </asp:DropDownList>
                                                                </td>
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
                                                                    <asp:Button ID="btnBuscar" runat="server" CssClass="button small gris" OnClick="btnBuscar_Click"
                                                                        Style="width: 100px" Text="Buscar" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnNuevo" runat="server" CssClass="lnk" Height="26px" OnClick="btnNuevo_Click"
                                                                        Text="Nuevo" Width="101px" />
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
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                <asp:UpdatePanel ID="upGvLista" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                <asp:GridView ID="gvListaOC" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" DataKeyNames="odc_c_iid" 
                                        onrowediting="gvListaOC_RowEditing" onrowdeleting="gvListaOC_RowDeleting" 
                                        onpageindexchanging="gvListaOC_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Proveedor">
                                            <ItemTemplate>
                                                <%# Eval("SIC_T_CLIENTE.cli_c_vraz_soc")%>
                                            </ItemTemplate>                             
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Moneda" DataField="odc_c_vdescmoneda" />
                                        <asp:BoundField HeaderText="Estado" DataField="odc_c_vdescestado" />
                                        <asp:BoundField HeaderText="Total" DataField="odc_c_etotal" />
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:CommandField ShowDeleteButton="True" />
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt;
                                <asp:Label ID="lblAccion" runat="server"></asp:Label>
                            </td>
                            <td align="right">
                                <table width="220" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="btnGuardar" runat="server" CssClass="lnk" 
                                                onclick="btnGuardar_Click">Guardar</asp:LinkButton>
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
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="left" class="box-estilo01">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Código</td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtSerie" runat="server" Height="26px" MaxLength="3" 
                                                            Width="54px"></asp:TextBox>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtNumero" runat="server" MaxLength="6"></asp:TextBox>
                                                        
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Fecha</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblFecha" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Proveedor
                                                    </td>
                                                    <td align="left" class="style3">
                                                        <asp:TextBox ID="txtRSProv" runat="server" BackColor="#CCCCCC" 
                                                            BorderColor="Black" BorderStyle="None" BorderWidth="1px" ReadOnly="True" 
                                                            Width="282px"></asp:TextBox>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:LinkButton ID="btnBuscarProveedor" runat="server" CssClass="lnk" 
                                                            OnClick="btnBuscarProveedor_Click">Buscar</asp:LinkButton>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Rango de entrega</td>
                                                    <td align="left" class="style1">
                                                        <asp:TextBox ID="txtFecEnIni" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFecEnIni_CalendarExtender" runat="server" 
                                                            Format="dd/MM/yyyy" TargetControlID="txtFecEnIni" TodaysDateFormat="dd/MM/yyyy">
                                                        </asp:CalendarExtender>
                                                        &nbsp;-
                                                        <asp:TextBox ID="txtFecEntFin" runat="server" Width="95px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtFecEntFin_CalendarExtender" runat="server" 
                                                            Format="dd/MM/yyyy" TargetControlID="txtFecEntFin" 
                                                            TodaysDateFormat="dd/MM/yyyy">
                                                        </asp:CalendarExtender>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        Estado
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboEstado" runat="server" Width="201px" 
                                                            AutoPostBack="True" onselectedindexchanged="cboEstado_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Clase
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboClaseOC" runat="server" AutoPostBack="True" 
                                                            Width="201px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left" class="style1">
                                                        &nbsp;</td>
                                                    <td align="left" class="style1">
                                                        Moneda
                                                    </td>
                                                    <td align="left" class="style1">
                                                        <asp:DropDownList ID="cboMoneda" runat="server" Width="201px" 
                                                            AutoPostBack="True" onselectedindexchanged="cboMoneda_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                               
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        &nbsp;</td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Items
                                                    </td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <asp:GridView ID="gvItemsSeleccionados" runat="server" AllowPaging="True" 
                                                            AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" 
                                                            BorderStyle="None" BorderWidth="0px" CssClass="mGrid" 
                                                            DataKeyNames="odc_c_iitemid" EmptyDataText="No ha seleccionado ningun item." 
                                                            GridLines="None" Height="16px" 
                                                            onrowcancelingedit="gvItemsSeleccionados_RowCancelingEdit" 
                                                            onrowediting="gvItemsSeleccionados_RowEditing" 
                                                            onrowupdating="gvItemsSeleccionados_RowUpdating" 
                                                            onselectedindexchanged="gvItemsSeleccionados_SelectedIndexChanged" 
                                                            PagerStyle-CssClass="pgr" ShowHeaderWhenEmpty="True" ViewStateMode="Enabled" 
                                                            Width="100%">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Código">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_ITEM.itm_c_ccodigo")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_ITEM.itm_c_vdescripcion")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Cantidad">
                                                                    <ItemTemplate>
                                                                        <%# Eval("odc_c_ecantidad")%>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtCantidad" runat="server" 
                                                                            Text='<%# Bind("odc_c_ecantidad") %> '>
                                                                        
                                                                        </asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Unitario">
                                                                    <ItemTemplate>
                                                                        <%# Eval("odc_c_epreciounit")%>
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtPrecio" runat="server" 
                                                                            Text='<%# Bind("odc_c_epreciounit") %> '>
                                                                           
                                                                        </asp:TextBox>
                                                                    </EditItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="CxU">
                                                                    <ItemTemplate>
                                                                        <%# Eval("odc_c_epreciototal")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowEditButton="True" />
                                                                <asp:TemplateField HeaderText="Unit. Ref.">
                                                                    <ItemTemplate>
                                                                        <%# Eval("SIC_T_ITEM.itm_c_dprecio_compra ")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnBuscarItems" runat="server" CssClass="lnk" 
                                                            onclick="btnBuscarItems_Click" Text="Buscar Items" />
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
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                </tr>
                                                 <tr>
                                                     <td align="left" class="txt-box-estilo">
                                                         Tasa de Cambio</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         <asp:Label ID="lblTC" runat="server"></asp:Label>
                                                     </td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        I.G.V.&nbsp;(<asp:Label ID="lblIGV" runat="server" Text="18%"></asp:Label>
                                                        )</td>
                                                    <td align="left" class="style3">
                                                        <asp:Label ID="lblIGVCal" runat="server"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                     <td align="left" class="txt-box-estilo">
                                                         Percepción (<asp:Label ID="lblPercepcion" runat="server" Text="2%"></asp:Label>
                                                         )</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblPercepcionCal" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Sub Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblSubTotal" runat="server" Text="[SubTotal]"></asp:Label>
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        Total
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        <asp:Label ID="lblTotal" runat="server" Text="[SubTotal]"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;</td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" class="txt-box-estilo">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="txt-box-estilo">
                                                        Observaciones</td>
                                                    <td align="left" class="txt-box-estilo" colspan="3">
                                                        <asp:TextBox ID="txtObs" runat="server" Height="54px" MaxLength="350" 
                                                            TextMode="MultiLine" Width="462px"></asp:TextBox>
                                                    </td>
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
            <asp:View ID="vwListaItem" runat="server">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt; SELECCIONAR ITEM<br />
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
                                                                    Familia</td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboFamilia" runat="server" AppendDataBoundItems="true" 
                                                                        AutoPostBack="True" onselectedindexchanged="cboFamilia_SelectedIndexChanged">
                                                                        <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 20px">
                                                                    &nbsp;</td>
                                                                <td class="txt-box-estilo">
                                                                    SubFamilia</td>
                                                                <td>
                                                                    <asp:DropDownList ID="cboSubFamilia" runat="server" AppendDataBoundItems="true">
                                                                        <asp:ListItem Text="-- Seleccionar --" Value="-1"></asp:ListItem>
                                                                    </asp:DropDownList>
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
                                                                    <asp:Button ID="btnBuscarItem" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px" Text="Buscar" onclick="btnBuscarItem_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="btnRegresarDesdeItems" runat="server" CssClass="button small gris"
                                                                        Style="width: 100px; height: 26px;" Text="Regresar" 
                                                                        onclick="btnRegresarDesdeItems_Click" />
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
                                <asp:UpdatePanel ID="upGvListaITem" UpdateMode="Conditional" runat="server" >
                                <ContentTemplate>
                                <asp:GridView ID="gvListaItem" runat="server" BorderStyle="None" AutoGenerateColumns="False"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" 
                                        EmptyDataText="No hay datos disponibles." BorderWidth="0px" ViewStateMode="Enabled" 
                                    DataKeyNames="itm_c_iid" onpageindexchanging="gvListaItem_PageIndexChanging" 
                                        onrowdatabound="gvListaItem_RowDataBound" 
                                        onrowcreated="gvListaItem_RowCreated" >
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="SELECCIONAR"> 
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:HeaderClick(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate> 
                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                            </ItemTemplate> 
                                        </asp:TemplateField> 
                                        <asp:BoundField DataField="itm_c_ccodigo" HeaderText="CÓDIGO" />
                                        <asp:BoundField DataField="itm_c_vdescripcion" HeaderText="DESCRIPCIÓN" />
                                        <asp:BoundField DataField="itm_c_dprecio_compra" HeaderText="PRECIO" />
                                        <asp:BoundField DataField="itm_c_vpardes" HeaderText="UNIDAD DE MEDIDA" />
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
             </asp:View>
            <asp:View ID="vwProveedor" runat="server">
            <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="tit-nav-paginas" align="left">
                                MANTENIMIENTO &gt; ORDEN DE COMPRA &gt; SELECCIONAR PROVEEDOR</td>
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
                                                                    
                                                                </td>
                                                                <td>
                                                                    
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
                                                                <td class="txt-box-estilo">
                                                                    
                                                                </td>
                                                                <td>
                                                                    
                                                                </td>
                                                                <td style="width: 20px">
                                                                </td>
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
                        <tr>
                            <td align="left" class="tit-nav-paginas">
                                <asp:UpdatePanel ID="upProveedor" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                <asp:GridView ID="gvProveedores" runat="server" BorderStyle="None"
                                    GridLines="None" AllowPaging="True" Width="100%" CssClass="mGrid" PagerStyle-CssClass="pgr"
                                    AlternatingRowStyle-CssClass="alt" ShowHeaderWhenEmpty="True" EmptyDataText="No hay datos disponibles."
                                    PageSize="15" BorderWidth="0px" AutoGenerateColumns="False" 
                                        DataKeyNames="cli_c_vdoc_id" 
                                        onselectedindexchanged="gvProveedores_SelectedIndexChanged" 
                                        onpageindexchanging="gvProveedores_PageIndexChanging">
                                    <AlternatingRowStyle CssClass="alt" />
                                    <Columns>
                                        <asp:BoundField DataField="cli_c_vdoc_id" HeaderText="RUC" />
                                        <asp:BoundField DataField="cli_c_vraz_soc" HeaderText="Razón Social" />
                                        <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <PagerStyle CssClass="pgr" />
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                    </table>
            </asp:View>
            </asp:MultiView>
        <asp:UpdatePanel ID="upMensaje" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="divPopUpMsg" class="PopupMostrar" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" width="800px">
                        <tr>
                            <td>
                                <uc1:Mensaje ID="ucMensaje" Visible="false" runat="server" />
                                <uc2:Mensaje ID="ucMensaje2" Visible="false" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnGuardar" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="gvListaOC" EventName="RowDeleting" />
            </Triggers>
        </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
