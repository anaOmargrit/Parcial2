<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="GestionArchivos.aspx.cs" Inherits="Parcial2.GestionArchivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario">
        <h1 class="titulo" >Gestión de archivos</h1>
        <asp:Label ID="lb_mensaje" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:FileUpload ID="fu_archivo" runat="server" />
        <br />
        <br />
        <asp:Button ID="bt_cargar" runat="server" Text="Cargar" OnClick="bt_cargar_Click" />
        <br />
        <br />
        <asp:Label ID="lb_resultado" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Label ID="lb_grilla" runat="server" Text=""></asp:Label>
        <br />
        <asp:GridView ID="gv_archivos" runat="server" Width="567px" OnRowCommand="gv_archivos_RowCommand">
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Descargar" HeaderText="Descargar" ShowHeader="True" Text="Descargar" />
            </Columns>
            <EmptyDataTemplate>
                Descargar
            </EmptyDataTemplate>
        </asp:GridView>
        <br /> 
    </div>    
</asp:Content>
