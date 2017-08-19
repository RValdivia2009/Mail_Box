<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="frm_Scaning.aspx.cs" Inherits="Package_WebApp.PagesMembers.Page_MailBox.frm_Scaning" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
    {
        width: 102%;
    }
        .style8
        {
            text-align: center;
            border-right-style: solid;
            border-right-width: 0px;
            border-top-style: solid;
            border-top-width: 0px;
            border-bottom-style: solid;
            border-bottom-width: 0px;
        }
        .style9
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            border-left-color: #800000;
        }
        .style11
        {
            text-align: center;
            width: 702px;
            height: 576px;
        }
        .style12
        {
            height: 576px;
        }
    .style13
    {
        color: #990033;
    }
    .style14
    {
        color: #000000;
    }
    .style15
    {
        text-align: center;
        width: 8px;
        height: 576px;
    }
        .style16
        {
            color: #990000;
        }
        .style18
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            height: 19px;
            border-left-color: #800000;
        }
        .style20
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            height: 28px;
            border-left-color: #800000;
        }
        .style23
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            height: 32px;
            border-left-color: #800000;
        }
        .style24
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            height: 29px;
            border-left-color: #800000;
        }
        .style25
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            border-left-color: #800000;
        }
        .style26
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            height: 11px;
            border-left-color: #800000;
        }
        .style27
        {
            border-right-style: solid;
            border-right-width: 0px;
            border-top-style: solid;
            border-top-width: 0px;
            border-bottom-style: solid;
            border-bottom-width: 0px;
        }
        .style28
        {
            border-right: 0px solid #800000;
            border-top: 0px solid #800000;
            border-bottom: 0px solid #800000;
            text-align: center;
            width: 259px;
            border-left-color: #800000;
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <table class="style1">
        <tr>
            <td class="style28" valign="top">
                55</td>
            <td class="style15" rowspan="11">
&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td class="style11" rowspan="11">
                <span class="style16"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Excel.jpg" 
                    onclick="ImageButton1_Click" style="margin-left: 0px" Width="50px" />
                </strong></span>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Package_Box" DataSourceID="AccessDataSource2" 
                    EmptyDataText="There are no data records to display." 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="632px" 
                    style="color: #000000" Height="114px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id_Package_Box" HeaderText="ID" ReadOnly="True" 
                            SortExpression="id_Package_Box" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                            Visible="False" />
                        <asp:BoundField DataField="AWB" HeaderText="AWB" SortExpression="AWB" />
                        <asp:BoundField DataField="Box" HeaderText="Box" SortExpression="Box" />
                        <asp:BoundField DataField="Tracking" HeaderText="Tracking" 
                            SortExpression="Tracking" >
                        <HeaderStyle HorizontalAlign="Center" Width="150px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre_Congsinne" HeaderText="Congsinne" 
                            SortExpression="Nombre_Congsinne" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cod_Congsinne" HeaderText="Cod_Congsinne" 
                            SortExpression="Cod_Congsinne" Visible="False" />
                        <asp:BoundField DataField="No_Cuenta" HeaderText="Suite" 
                            SortExpression="No_Cuenta" >
                        <HeaderStyle Width="50px" />
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="D:\Roberto_V\APPLICATIONS_Otras\ScanCourier_Web\ScanCourier_Web\ITN_DataBaseScaning.mdb" 
                    DeleteCommand="DELETE FROM `TBL_Package_Main` WHERE `id_Package_Box` = ?" 
                    InsertCommand="INSERT INTO `TBL_Package_Main` (`id_Package_Box`, `Date`, `AWB`, `Tracking`, `Nombre_Congsinne`, `Box`, `Cod_Congsinne`, `No_Cuenta`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT id_Package_Box, [Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta FROM TBL_Package_Main ORDER BY id_Package_Box DESC" 
                    
                    UpdateCommand="UPDATE `TBL_Package_Main` SET `Date` = ?, `AWB` = ?, `Tracking` = ?, `Nombre_Congsinne` = ?, `Box` = ?, `Cod_Congsinne` = ?, `No_Cuenta` = ? WHERE `id_Package_Box` = ?">
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
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="AWB" Type="String" />
                        <asp:Parameter Name="Tracking" Type="String" />
                        <asp:Parameter Name="Nombre_Congsinne" Type="String" />
                        <asp:Parameter Name="Box" Type="String" />
                        <asp:Parameter Name="Cod_Congsinne" Type="Int32" />
                        <asp:Parameter Name="No_Cuenta" Type="String" />
                        <asp:Parameter Name="id_Package_Box" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td class="style12" rowspan="11">
            </td>
        </tr>
        <tr>
            <td class="style25" valign="top">
                <asp:TextBox ID="ID_Package" runat="server" Width="71px" Visible="False"></asp:TextBox>
                <br class="style27" />
            </td>
        </tr>
        <tr>
            <td class="style18" valign="top">
                <span class="style14">
                <strong>Trackking</strong></span><br class="style27" />
                <asp:TextBox ID="TextBoxTracking" runat="server" Width="180px" 
                    style="text-align: center"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style26" valign="top">
                <strong>
                <span class="style14">Cuenta</span><br class="style27" />
                <asp:TextBox ID="TextBoxCuenta" runat="server" style="text-align: center" 
                    Width="65px"></asp:TextBox>
                <br />
                <br />
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style18" valign="top">
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Save" 
                    Width="60px" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ButtonUpdate" runat="server" onclick="ButtonUpdate_Click" 
                    Text="Update" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style20" valign="top">
                <asp:Button ID="Button4" runat="server" Font-Bold="True" ForeColor="Red" 
                    onclick="Button4_Click" Text="DELETE" Width="64px" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style23" valign="top">
                <br class="style27" />
            </td>
        </tr>
        <tr>
            <td class="style23" valign="top">
                <strong> <span class="style14">Consignee&nbsp;</span><br class="style9" />
&nbsp;
                <asp:TextBox ID="TextBoxName" runat="server" style="margin-left: 0px; text-align: center; font-size: small;" 
                    Width="197px" Enabled="False" ReadOnly="True"></asp:TextBox>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style23" valign="top">
                <strong>&nbsp;<asp:Label ID="Label2" runat="server" style="color: #000000" 
                    Text="AWB"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxAWB" runat="server" Width="187px" 
                    style="text-align: center; font-weight: 700; font-size: large; margin-left: 0px;" 
                    CssClass="style13"></asp:TextBox>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style24" valign="top">
                <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #000000" 
                    Text="BOX"></asp:Label>
                <strong><span class="style14">
                <br />
                </span>&nbsp;
                <asp:TextBox ID="TextBoxCaja" runat="server" Width="48px" CssClass="style13" 
                    style="text-align: center; font-weight: 700; font-size: large"></asp:TextBox>
&nbsp;&nbsp;&nbsp;</strong></td>
        </tr>
        <tr>
            <td class="style25" valign="top">
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                <br class="style27" />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3" valign="top">
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="D:\Roberto_V\APPLICATIONS_Otras\ScanCourier_Web\ScanCourier_Web\ITN_DataBaseScaning.mdb" 
                    DeleteCommand="DELETE FROM TBL_Package_Main WHERE (id_Package_Box = ?)" 
                    InsertCommand="INSERT INTO TBL_Package_Main(id_Package_Box, [Date], Agen_Destination, AWB, Tracking, Cod_Congsinne, Congsinne, Nombre_Congsinne, Box) VALUES (?, ?, ?, ?, ?, ?, ?,,)" 
                    SelectCommand="SELECT id_Package_Box, [Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne FROM TBL_Package_Main" 
                    
                    UpdateCommand="UPDATE TBL_Package_Main SET [Date] = ?, Agen_Destination = ?, AWB = ?, Tracking = ?, Cod_Congsinne = ?, Congsinne = ?, Nombre_Congsinne =, Box = WHERE (id_Package_Box = ?)">
                    <DeleteParameters>
                        <asp:Parameter Name="id_Package_Box" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id_Package_Box" Type="Int32" />
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="Agen_Destination" Type="Int32" />
                        <asp:Parameter Name="AWB" Type="String" />
                        <asp:Parameter Name="Tracking" Type="String" />
                        <asp:Parameter Name="Cod_Congsinne" Type="Int32" />
                        <asp:Parameter Name="Congsinne" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Date" Type="DateTime" />
                        <asp:Parameter Name="Agen_Destination" Type="Int32" />
                        <asp:Parameter Name="AWB" Type="String" />
                        <asp:Parameter Name="Tracking" Type="String" />
                        <asp:Parameter Name="Cod_Congsinne" Type="Int32" />
                        <asp:Parameter Name="Congsinne" Type="String" />
                        <asp:Parameter Name="id_Package_Box" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</p>

</asp:Content>
