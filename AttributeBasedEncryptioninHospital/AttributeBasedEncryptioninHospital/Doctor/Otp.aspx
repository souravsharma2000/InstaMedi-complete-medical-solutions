<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Index.master" AutoEventWireup="true" CodeFile="Otp.aspx.cs" Inherits="Doctor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="index.html">Home</a><i>|</i></li>
                <li>Doctor Login</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td colspan="2" class="txt-center" style="text-decoration: underline">
                <strong>View Details </strong>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits">Patient ID <asp:Label ID="lblemail" runat="server" Text="Label" Visible="false" ></asp:Label>
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList ID="ddlpatientid" runat="server" DataSourceID="SqlDataSource1" CssClass="txt-center"
                    DataTextField="patientid" DataValueField="patientid">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>"
                    SelectCommand="SELECT [patientid] FROM [Addpatient]"></asp:SqlDataSource>
            </td>
        </tr>
          <tr>
            <td class="contact-form-aits">UserName
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="txtuname" runat="server"  CssClass="txt-center"
                    >
                </asp:TextBox>
             
            </td>
        </tr>
          <tr>
            <td class="contact-form-aits">Dob
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="txtdob" runat="server" CssClass="txt-center">
                </asp:TextBox>
            
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits" colspan="2">
                <asp:Button ID="Sendotp" runat="server" Text="Submit" OnClick="Sendotp_Click" CssClass="btn btn-danger" />
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits">OTP</td>
            <td class="contact-form-aits">
                <asp:TextBox ID="txtcomment" runat="server" CssClass="txt-center"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits" colspan="2">
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="btn btn-danger" Visible="False" />
            </td>
        </tr>
    </table>
</asp:Content>

