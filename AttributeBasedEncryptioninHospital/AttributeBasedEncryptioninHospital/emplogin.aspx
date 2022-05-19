<%@ Page Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="emplogin.aspx.cs"
    Inherits="userlogin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center">
        <tr>
            <td colspan="3" style="text-decoration: underline">
                <strong>Employee Login </strong>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 21px; color: black;">
                <span style="color: black">UserID: </span>
            </td>
            <td style="width: 100px; height: 21px">
                <asp:TextBox ID="lidtxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; color: black;">
                <span style="color: black">Password: </span>
            </td>
            <td style="width: 100px">
                <asp:TextBox ID="pwdtxt" runat="server" TextMode="Password" Width="149px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 21px">
            </td>
            <td style="width: 100px; height: 21px">
                <asp:Button ID="Button1" runat="server" Text="Login" Width="65px" OnClick="Button1_Click" CssClass="yellow-button" />
            </td>
        </tr>
    </table>
</asp:Content>
