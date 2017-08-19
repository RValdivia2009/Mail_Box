<%@ Page Title="Log In" Language="C#" MasterPageFile="~/MasterMailBox.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Package_WebApp.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        &nbsp;</h2>
<h2>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Log In
    </h2>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Please enter your username and password.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Register</asp:HyperLink> if you don't have an account.
    </p>
    &nbsp;&nbsp;
    <asp:Login ID="LoginUser" runat="server" EnableViewState="False" 
    style="text-align: left" 
    Height="380px" Width="506px">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Width="260px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" 
                            TextMode="Password" Width="260px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Keep me logged in</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton" align="right">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                        style="text-align: left" Width="70px"/>
                    &nbsp;&nbsp; &nbsp;
                    <asp:HyperLink ID="HyperLink3" runat="server" 
                        NavigateUrl="~/Account/ChangePassword.aspx">Change Pasword</asp:HyperLink>
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
