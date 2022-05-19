<%@ Page Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Adminlogin.aspx.cs"
    Inherits="doctorlogin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="index.html">Home</a><i>|</i></li>
                <li>Admin Login</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td colspan="3" style="text-decoration: underline">
                <strong style="color: black">Admin Login </strong>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: black">Admin:</span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="lidtxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: black">Password</span><span style="color: white">:</span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="pwdtxt" runat="server" TextMode="Password" CssClass="txt-center"></asp:TextBox>
            </td>
        </tr>


        <tr>
            <td></td>
            <td class="contact-form-aits">
                <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"
                    CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
