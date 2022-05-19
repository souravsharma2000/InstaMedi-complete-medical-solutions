<%@ Page Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="PatientRegister.aspx.cs"
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
                <strong>Patient Register </strong>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: black" class="txt-center">Email Id: </span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox CssClass="txt-center" ID="txtemail" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                    ErrorMessage="Incorrect Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
              <%--  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
            </td>
        </tr>
           <tr>
            <td>
                <span style="color: black" class="txt-center">Password: </span>
            </td>
            <td class="contact-form-aits">
                <asp:TextBox CssClass="txt-center" ID="txtpwd" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="contact-form-aits">
                <asp:Button ID="Button1" runat="server" Text="Submit"
                    OnClick="Button1_Click" CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
