<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="Busquedas.aspx.cs" Inherits="Package_WebApp.PagesMembers.Page_MailBox.Busquedas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style9
        {
            width: 1027px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table class="style5">
            <tr>
                <td class="style9" style="text-align: left">
                <asp:Label ID="Label4" runat="server" 
                    style="color: #000000; font-weight: 700; text-align: center" Text="Tracking"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBoxTracking" runat="server" style="text-align: center" 
                    Width="128px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>
                <asp:Label ID="Label2" runat="server" style="color: #000000" Text="AWB"></asp:Label>
                </strong>&nbsp;
                <strong>
                <asp:TextBox ID="TextBoxAWB" runat="server" CssClass="style13" 
                    style="text-align: center; font-weight: 700; margin-left: 0px;" 
                    Width="125px" Height="21px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="34px" 
                        ImageUrl="~/Browse 1.ico" onclick="ImageButton2_Click" Width="36px" />
                </strong>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:GridView ID="GridView2" runat="server" style="color: #000000">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    &nbsp;</td>
            </tr>
        </table>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
            DeleteCommand="DELETE FROM `TBL_Package_Main_Store` WHERE `id_Package_Box` = ?" 
            InsertCommand="INSERT INTO `TBL_Package_Main_Store` (`id_Package_Box`, `Date`, `AWB`, `Tracking`, `Nombre_Congsinne`, `Box`, `Cod_Congsinne`, `No_Cuenta`, `userShort`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            SelectCommand="SELECT `id_Package_Box`, `Date`, `AWB`, `Tracking`, `Nombre_Congsinne`, `Box`, `Cod_Congsinne`, `No_Cuenta`, `userShort` FROM `TBL_Package_Main_Store`" 
            UpdateCommand="UPDATE `TBL_Package_Main_Store` SET `Date` = ?, `AWB` = ?, `Tracking` = ?, `Nombre_Congsinne` = ?, `Box` = ?, `Cod_Congsinne` = ?, `No_Cuenta` = ?, `userShort` = ? WHERE `id_Package_Box` = ?">
            <DeleteParameters>
                <asp:Parameter Name="id_Package_Box" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_Package_Box" Type="Int32" />
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="AWB" Type="String" />
                <asp:Parameter Name="Tracking" Type="String" />
                <asp:Parameter Name="Nombre_Congsinne" Type="String" />
                <asp:Parameter Name="Box" Type="String" />
                <asp:Parameter Name="Cod_Congsinne" Type="Int32" />
                <asp:Parameter Name="No_Cuenta" Type="String" />
                <asp:Parameter Name="userShort" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Date" Type="DateTime" />
                <asp:Parameter Name="AWB" Type="String" />
                <asp:Parameter Name="Tracking" Type="String" />
                <asp:Parameter Name="Nombre_Congsinne" Type="String" />
                <asp:Parameter Name="Box" Type="String" />
                <asp:Parameter Name="Cod_Congsinne" Type="Int32" />
                <asp:Parameter Name="No_Cuenta" Type="String" />
                <asp:Parameter Name="userShort" Type="String" />
                <asp:Parameter Name="id_Package_Box" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <br />
    </p>
</asp:Content>
