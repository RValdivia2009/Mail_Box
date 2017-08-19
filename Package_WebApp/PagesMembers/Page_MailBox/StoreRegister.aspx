

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="StoreRegister.aspx.cs" Inherits="Package_WebApp.PagesMembers.Page_MailBox.StoreRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style11
        {
            width: 189px;
            text-align: center;
        }
        .style12
        {
            width: 246px;
        text-align: left;
    }
        .style14
        {
            height: 15px;
            color: #990000;
        text-align: left;
    }
        .style17
        {
            width: 246px;
            height: 15px;
        text-align: left;
    }
        .style18
        {
            width: 189px;
            height: 15px;
        text-align: left;
    }
        .style19
        {
            color: #990000;
        }
        .style20
        {
            color: #993300;
        }
    .style21
    {
        text-align: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style5">
        <tr>
            <td class="style17">
&nbsp;&nbsp;<span class="style19"><strong>&nbsp;&nbsp;Package in process</strong></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style18">
                &nbsp;</td>
            <td class="style14">
                <strong>Packages stored</strong></td>
        </tr>
        <tr>
            <td class="style12" valign="top">
                <asp:GridView ID="GridViewActual" runat="server" Width="406px" 
                    AllowPaging="True" PageSize="30">
                </asp:GridView>
            </td>
            <td class="style11" valign="top">
                <span class="style20"><strong>Select AWB to move:<br />
                <br />
                </strong></span>&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="21px" 
                    Width="142px" style="text-align: center; font-weight: 700; font-size: large"></asp:TextBox>
                <br />
                <br />
                <br />
&nbsp;<asp:ImageButton ID="ImageButton_Iz" runat="server" ImageUrl="~/Iconos/fLECHA_I.png" 
                    onclick="ImageButton_Iz_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton_Dr" runat="server" ImageUrl="~/Iconos/fLECHA_D.png" 
                    onclick="ImageButton_Dr_Click" />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td valign="top" class="style21">
                <asp:GridView ID="GridViewStore" runat="server" Width="417px" 
                    AllowPaging="True" onpageindexchanging="GridViewStore_PageIndexChanging" 
                    PageSize="30">
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
