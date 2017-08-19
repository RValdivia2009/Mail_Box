<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="ScanCourier_Web.Froms.AdminUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="user_ID" DataSourceID="AccessDataSource1" 
        EmptyDataText="There are no data records to display." ForeColor="#333333" 
        GridLines="None" Width="786px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="user_ID" HeaderText="user_ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="user_ID" />
            <asp:BoundField DataField="user_password" HeaderText="user_password" 
                SortExpression="user_password" />
            <asp:BoundField DataField="user_Status" HeaderText="user_Status" 
                SortExpression="user_Status" />
            <asp:BoundField DataField="user_Lavel" HeaderText="user_Lavel" 
                SortExpression="user_Lavel" />
            <asp:BoundField DataField="Usuario" HeaderText="Usuario" 
                SortExpression="Usuario" />
            <asp:BoundField DataField="user_Name" HeaderText="user_Name" 
                SortExpression="user_Name" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
        DeleteCommand="DELETE FROM `Login` WHERE `user_ID` = ?" 
        InsertCommand="INSERT INTO `Login` (`user_ID`, `user_password`, `user_Status`, `user_Lavel`, `Usuario`, `user_Name`) VALUES (?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT `user_ID`, `user_password`, `user_Status`, `user_Lavel`, `Usuario`, `user_Name` FROM `Login`" 
        UpdateCommand="UPDATE `Login` SET `user_password` = ?, `user_Status` = ?, `user_Lavel` = ?, `Usuario` = ?, `user_Name` = ? WHERE `user_ID` = ?">
        <DeleteParameters>
            <asp:Parameter Name="user_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="user_ID" Type="Int32" />
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="user_Status" Type="Int32" />
            <asp:Parameter Name="user_Lavel" Type="String" />
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="user_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_password" Type="String" />
            <asp:Parameter Name="user_Status" Type="Int32" />
            <asp:Parameter Name="user_Lavel" Type="String" />
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="user_Name" Type="String" />
            <asp:Parameter Name="user_ID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>
