<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="test.aspx.cs" Inherits="SIC.UserLayer.Interfaces.Facturacion.test" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Colección)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Interfaces\Facturacion\Report1.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="ListarItemAlmacen" TypeName="SIC.BusinessLayer.ItemAlmacenBL">
        <SelectParameters>
            <asp:Parameter Name="codigo" Type="String" />
            <asp:Parameter Name="descripcion" Type="String" />
            <asp:Parameter Name="idFamilia" Type="Int32" />
            <asp:Parameter Name="idSubFamilia" Type="Int32" />
            <asp:Parameter Name="idAlmacen" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
