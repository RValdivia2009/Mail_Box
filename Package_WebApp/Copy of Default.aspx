<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Package_WebApp.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 1162px;
        }
        .style2
        {
            width: 474px;
        }
        .style3
        {
            width: 70px;
        }
        .style4
        {
            width: 70px;
            text-align: right;
        }
        .style5
        {
            width: 70px;
            text-align: right;
            height: 20px;
        }
        .style6
        {
            width: 474px;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
    <tr>
        <td class="style4">
            <span class="style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User</span> <span class="style11">Name:</span></td>
        <td class="style2">
            <asp:DropDownList ID="comboBox1" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="user_Name" 
                    DataValueField="user_ID" Height="26px" Width="145px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Password</td>
        <td class="style6">
            <asp:TextBox ID="textBox_password" runat="server" Height="20px" Width="137px" 
                    TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style2">
            <asp:Button ID="button_aceptar" runat="server" Text="Login" 
                    onclick="button_aceptar_Click" Width="60px" CssClass="style13" />
&nbsp;&nbsp;
            <asp:Button ID="button_salir" runat="server" Text="Exit" Width="65px" 
                    CssClass="style13" onclick="button_salir_Click1" Visible="False" />
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style2">
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
        SelectCommand="SELECT [user_ID], [user_Name] FROM [Login]"></asp:AccessDataSource>
        </td>
    </tr>
</table>
</asp:Content>
