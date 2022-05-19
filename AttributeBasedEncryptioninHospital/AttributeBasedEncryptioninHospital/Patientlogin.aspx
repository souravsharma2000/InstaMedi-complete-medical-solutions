<%@ Page Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Patientlogin.aspx.cs"
    Inherits="userlogin" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="#">Home</a><i>|</i></li>
                <li>Patient Login</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">

        <tr>
            <td colspan="2" style="text-decoration: underline">
                <strong>Patient Login </strong>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: black" class="txt-center">UserID: </span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox CssClass="txt-center" ID="lidtxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: black" class="txt-center">Password: </span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox CssClass="txt-center" ID="txtpwd" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="contact-form-aits">
                <asp:Button ID="Button1" runat="server" Text="Submit"
                    OnClick="Button1_Click" CssClass="btn btn-danger" />
                <a href="PatientRegister.aspx">Patient Register</a>
            </td>
        </tr>
    </table>
</asp:Content>
