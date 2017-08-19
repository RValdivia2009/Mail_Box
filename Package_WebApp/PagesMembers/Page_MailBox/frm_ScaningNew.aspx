<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="frm_ScaningNew.aspx.cs" Inherits="Package_WebApp.PagesMembers.Page_MailBox.frm_ScaningNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 1078px;
        height: 658px;
    }
        .style3
        {
            width: 16px;
        }
        .style4
        {
            width: 308px;
            text-align: center;
        }
    .style14
    {
        color: #000000;
    }
        .style16
        {
            color: #990000;
        }
        .style22
        {
            text-align: center;
        }
        .style24
        {
            width: 283px;
            text-align: center;
            color: #000000;
        height: 28px;
    }
        .style26
        {
            text-align: center;
            width: 751px;
        }
    .style27
    {
        width: 283px;
        text-align: center;
        height: 272px;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style2">

        <tr>
            <td class="style24" valign="top">
                <asp:DropDownList ID="DropDownCuenta" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="Name_Agen_Destination" 
                    DataValueField="id_Agen_Destination" Height="26px" 
                    style="font-weight: 700; font-size: small; color: #990000" Width="226px">
                </asp:DropDownList>
                <br />
                <br />
                <strong>
                <asp:Label ID="Label2" runat="server" style="color: #000000" Text="AWB"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBoxAWB" runat="server" CssClass="style13" 
                    style="text-align: center; font-weight: 700; font-size: medium; margin-left: 0px;" 
                    Width="157px" Height="16px" BackColor="#F2F2F2"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #000000" 
                    Text="BOX"></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBoxCaja" runat="server" CssClass="style13" 
                    
                    style="text-align: center; font-weight: 700; font-size: medium; " 
                    Width="48px" Height="21px" BackColor="#F2F2F2"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label10" runat="server" style="color: #000000" 
                    Text="-------------------------------------------"></asp:Label>
                </strong>
            </td>
            <td class="style3" rowspan="7">
                &nbsp;</td>
            <td class="style26" rowspan="6" valign="top">
                <strong><span class="style14"><span class="style16">
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;</span></span></strong><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_Package_Box" DataSourceID="AccessDataSource2" 
                    EmptyDataText="There are no data records to display." Height="114px" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" style="color: #000000" 
                    Width="691px" AllowPaging="True" PageSize="30" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" >
                        <HeaderStyle Width="55px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="id_Package_Box" HeaderText="ID" ReadOnly="True" 
                            SortExpression="id_Package_Box" >
                        <ControlStyle Width="5px" />
                        <HeaderStyle ForeColor="White" Width="5px" />
                        <ItemStyle ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                            Visible="False" />
                        <asp:BoundField DataField="AWB" HeaderText="AWB" SortExpression="AWB">
                        <HeaderStyle Width="100px" />
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Box" HeaderText="Box" SortExpression="Box">
                        <HeaderStyle Width="30px" />
                        <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tracking" HeaderText="Tracking" 
                            SortExpression="Tracking" DataFormatString="{0: F}">
                        <HeaderStyle HorizontalAlign="Center" Width="230px" />
                        <ItemStyle Font-Size="XX-Small" HorizontalAlign="Left" Width="50px" 
                            Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Nombre_Congsinne" HeaderText="Congsinne" 
                            SortExpression="Nombre_Congsinne">
                        <HeaderStyle Width="130px" />
                        <ItemStyle Font-Size="XX-Small" HorizontalAlign="Left" Width="60px" 
                            Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Cod_Congsinne" HeaderText="Cod_Congsinne" 
                            SortExpression="Cod_Congsinne" Visible="False" />
                        <asp:BoundField DataField="No_Cuenta" HeaderText="Suite" 
                            SortExpression="No_Cuenta">
                        <HeaderStyle Width="55px" />
                        <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="userShort" HeaderText="User" 
                            SortExpression="userShort">
                        <HeaderStyle Width="90px" />
                        <ItemStyle Width="60px" Wrap="False" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle Wrap="True" />
                </asp:GridView>
            </td>
            <td class="style22" rowspan="6" valign="top">
                <br />
                Add Consignee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <em>
                    <strong>
                <asp:TextBox ID="TextBoxName" runat="server" 
                    style="margin-left: 0px; text-align: center; font-size: small;" 
                    Width="173px" Height="16px" BackColor="#F2F2F2"></asp:TextBox>
                </strong>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="22px" 
                    ImageUrl="~/Iconos/add_peope2.png" onclick="ImageButton2_Click" Width="32px" />
                <br />
                <br />
                <br />
                Search Consignee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <strong>
                <asp:TextBox ID="TextBoxBUSCA" runat="server" style="text-align: center" 
                    Width="173px" AutoPostBack="True" 
                    ontextchanged="TextBoxCuenta_TextChanged" Height="16px" 
                    BackColor="#F2F2F2"></asp:TextBox>
                &nbsp;
                <asp:ImageButton ID="ImageButtonBUSCA" runat="server" Height="22px" 
                    ImageUrl="~/Iconos/find.png" onclick="ImageButtonBUSCA_Click" 
                    Width="30px" />
                </strong>
                <br />
                </em>
                <br />
                <em>
                    <strong>
                <asp:ListBox ID="ListBox2" runat="server" Height="234px" Width="212px" 
                    style="font-size: x-small" BackColor="#F2F2F2">
                </asp:ListBox>
                </strong></em>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong><span class="style14">
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
                    DeleteCommand="DELETE FROM `TBL_Package_Main` WHERE `id_Package_Box` = ?" 
                    InsertCommand="INSERT INTO TBL_Package_Main(id_Package_Box, [Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)" 
                    SelectCommand="SELECT id_Package_Box, [Date], AWB, Tracking, Nombre_Congsinne, Box, Cod_Congsinne, No_Cuenta, userShort FROM TBL_Package_Main ORDER BY id_Package_Box DESC" 
                    UpdateCommand="UPDATE TBL_Package_Main SET [Date] = ?, AWB = ?, Tracking = ?, Nombre_Congsinne = ?, Box = ?, Cod_Congsinne = ?, No_Cuenta = ?, userShort = ? WHERE (id_Package_Box = ?)">
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
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
                    SelectCommand="SELECT Name_Agen_Destination, id_Agen_Destination FROM tbl_N_Agen_Destination ORDER BY Name_Agen_Destination">
                </asp:AccessDataSource>
                <asp:Label ID="Usuario" runat="server" style="color: #000000" Text="Usuario" 
                    Visible="False"></asp:Label>
                <asp:TextBox ID="ID_Package" runat="server" Visible="False" Width="71px"></asp:TextBox>
                <span class="style16">
                <asp:Label ID="textBox_usuario" runat="server" Text="Label" Visible="False"></asp:Label>
                </span>
                </span></strong>
            </td>
        </tr>
        <tr>
            <td class="style27" valign="top">
                <asp:Label ID="Label4" runat="server" 
                    style="color: #000000; font-weight: 700; text-align: center" Text="Tracking"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBoxTracking" runat="server" style="text-align: center; font-size: x-small;" 
                    Width="199px" ontextchanged="TextBoxTracking_TextChanged" Height="17px" 
                    BackColor="#F2F2F2"></asp:TextBox>
                <strong>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" style="font-weight: 700; color: #000000" 
                    Text="Acount No."></asp:Label>
                <asp:TextBox ID="TextBoxCuenta" runat="server" style="text-align: center" 
                    Width="85px" AutoPostBack="True" 
                    ontextchanged="TextBoxCuenta_TextChanged1" Height="16px" 
                    BackColor="#F2F2F2"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <asp:ListBox ID="ListBox1" runat="server" Height="103px" Width="213px" 
                    style="font-size: small" BackColor="#F2F2F2">
                </asp:ListBox>
                <br />
                <br />
                </strong>


                       &nbsp;<em><asp:ImageButton ID="ImageButton3" runat="server" Height="25px" 
                       ImageUrl="~/Iconos/Save-icon.png" onclick="ImageButton3_Click" Width="25px" />


&nbsp;</em>&nbsp;&nbsp;
                &nbsp;<em><asp:ImageButton ID="ImageButton4" runat="server" Height="25px" 
                    ImageUrl="~/Iconos/Ok-icon.png" onclick="ImageButton4_Click" Width="25px" />
&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton5" runat="server" Height="25px" 
                    ImageUrl="~/Iconos/delete.png" onclick="ImageButton5_Click" Width="25px" />
                </em>&nbsp;&nbsp;&nbsp; <em>
                <strong>
                <span class="style14"><span class="style16">
                <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" 
                    ImageUrl="~/Iconos/Excel.jpg" onclick="ImageButton1_Click" style="margin-left: 0px; text-align: center;" 
                    Width="31px" />
                </span></span>
                </strong></em>
                <br />
                <strong>
                <br />
                </strong>
                <asp:Label ID="Label8" runat="server" style="color: #000000" 
                    Text="-------------------------------------------"></asp:Label>
                <strong>
                <br />
                &nbsp;
                &nbsp;
                &nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                </strong>
            </td>
        </tr>
        <tr>
            <%--<td class="style28" valign="top">
                <br />
            </td>--%>
        </tr>
        <tr>
            <%--<td class="style27" valign="top">
                </td>--%>
        </tr>
        <tr>
<%--            <td class="style25" valign="top">
                <strong><span class="style14"><span class="style16">
                &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                </span></span></strong></td>
--%>        </tr>
        <tr>
            <%--<td class="style27" valign="top">
                </td>--%>
<%--        </tr>
        <tr>
            <td class="style29" valign="top">
                </td>
            <td class="style30">
                &nbsp;</td>
        </tr>
--%>    </table>
</asp:Content>
