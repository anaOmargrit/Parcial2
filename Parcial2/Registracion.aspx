<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="Parcial2.Registracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario">
        <h1 class="titulo" ><asp:Label ID="lb_mensaje" runat="server" Text=""></asp:Label>
        </h1>
        Username: <asp:TextBox ID="tb_user" runat="server" Width="325px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_user" ErrorMessage="Debe ingresar un usuario." ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        Email:<asp:TextBox ID="tb_mail" runat="server" Width="356px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_mail" ErrorMessage="Debe ingresar un email." ForeColor="#CC3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El email ingresado no es válido." ForeColor="Maroon" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ControlToValidate="tb_mail"></asp:RegularExpressionValidator>
        <br />
        Edad:
        <asp:TextBox ID="tb_edad" runat="server" Width="351px"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_edad" ErrorMessage="Debes ingresar tu edad." ForeColor="#CC3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Debes ser mayor de 15 años." ForeColor="#990000" MinimumValue="15" MaximumValue="150" Type="Integer" ControlToValidate="tb_edad"></asp:RangeValidator>
        <br />
        Contraseña:<asp:TextBox ID="tb_pass1" runat="server" Width="319px" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_pass1" ErrorMessage="Debes ingresar una contraseña." ForeColor="#CC3300"></asp:RequiredFieldValidator>
        <br />
        Repetir Contraseña:<asp:TextBox ID="tb_pass2" runat="server" Width="270px" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_pass2" ErrorMessage="Debes repetir la contraseña." ForeColor="#CC3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tb_pass1" ControlToValidate="tb_pass2" ErrorMessage="Las contraseñas no coinciden." ForeColor="#990000"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="bt_guardar" runat="server" Text="Guardar" OnClick="bt_guardar_Click" />
        <br />
        <br />
    </div>
</asp:Content>
