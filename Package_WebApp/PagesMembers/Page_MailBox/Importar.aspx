<%@ Page Title="" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true" CodeBehind="Importar.aspx.cs" Inherits="Package_WebApp.PagesMembers.Page_MailBox.Importar" %>


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style10
        {
            border: 2px solid #034AF3;
            width: 432px;
            height: 150px;
            text-align: center;
        }
        .style11
        {
            height: 150px;
        }
        .style12
        {
            width: 432px;
            height: 21px;
        }
        .style13
        {
            height: 21px;
        }
        .style14
        {
            border: 2px solid #034AF3;
            width: 432px;
            text-align: left;
            height: 40px;
        }
        .style15
        {
            color: #990000;
            font-size: medium;
        }
        .style16
        {
            border: 2px solid #034AF3;
            width: 432px;
            text-align: center;
            height: 4px;
        }
        .style17
        {
            height: 4px;
            color: #990000;
            font-size: medium;
        }
        .style18
        {
            border: 2px solid #034AF3;
        }
        .style19
        {
            height: 4px;
            color: #990000;
            font-size: medium;
            width: 549px;
            text-align: center;
            border: 2px solid #034AF3;
        }
        .style20
        {
            width: 549px;
            height: 40px;
            border: 2px solid #034AF3;
        }
        .style21
        {
            border: 2px solid #034AF3;
            height: 150px;
            width: 549px;
        }
        .style22
        {
            height: 21px;
            width: 549px;
        }
        .style23
        {
            color: #000000;
            font-size: small;
        }
        .style24
        {
            height: 40px;
        }
        .style25
        {
            color: #990000;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function File1_onclick() {

        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style5">
        <tr>
            <td class="style16">
                <span class="style15"><strong>
                <br class="style18" />
                Upload file consignees</strong></span><br class="style18" />
&nbsp;&nbsp;
                <br class="style18" />
            </td>
            <td class="style19">
                <strong>Selecting and Deleting a customer account<br />
                </strong><span class="style23">(one time as clicking &quot;Delete&quot; button will be 
                removed all consignees for the selected account)</span></td>

            <td class="style17">
                </td>

        </tr>
        <tr>
            <td class="style14" valign="top">
                &nbsp;&nbsp;&nbsp; <span class="style25">&nbsp;</span><br />
&nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload1" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click1" 
                    Text="Upload" style="color: #990000; font-weight: 700" Height="20px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="style25">(*.xls files 
                only) </span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" style="color: #FF3300; font-weight: 700; font-size: small;" 
                    Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="SubirExcel" runat="server" Height="27px" 
                    ImageUrl="~/Excel.jpg" onclick="SubirExcel_Click" Width="43px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Insert" runat="server" Height="25px" onclick="Insert_Click" 
                    style="font-weight: 700; color: #800000; font-size: medium; margin-top: 0px" 
                    Text="Insert" Width="83px" />
                <br />
            </td>
            <td class="style20">
                <asp:DropDownList ID="DropDownCuenta" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="Name_Agen_Destination" 
                    DataValueField="id_Agen_Destination" Height="26px" 
                    style="font-weight: 700; font-size: small; color: #990000" Width="226px">
                </asp:DropDownList>
            &nbsp;&nbsp;
                <asp:Button ID="ButtonFiltar" runat="server" onclick="ButtonFiltar_Click" 
                    style="font-weight: 700; color: #800000" Text="Filter" Width="53px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Delete Selected Records" Height="32px" 
                    style="color: #FF0000; font-weight: 700; font-family: 'Arial Black'" 
                    Width="206px" />
            </td>

            <td class="style24">
            </td>

        </tr>
        <tr>
            <td class="style10" valign="top">
                <asp:GridView ID="GridView1" runat="server" Width="236px">
                </asp:GridView>
            </td>
            <td class="style21" valign="top">
                <asp:GridView ID="GridView2" runat="server" Width="470px">
                </asp:GridView>
            &nbsp;&nbsp;
            </td>
            <td class="style11">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                <br />
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <br />
            </td>
            <td class="style22">
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
                    SelectCommand="SELECT [id_Agen_Destination], [Name_Agen_Destination] FROM [tbl_N_Agen_Destination]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/ITN_DataBaseScaning.mdb" 
                    SelectCommand="SELECT [id_Agen_Destination], [Name_Agen_Destination] FROM [tbl_N_Agen_Destination]">
                </asp:AccessDataSource>
                &nbsp;&nbsp;
            </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
