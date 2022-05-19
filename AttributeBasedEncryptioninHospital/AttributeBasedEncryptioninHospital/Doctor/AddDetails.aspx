<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Index.master" AutoEventWireup="true"
    CodeFile="AddDetails.aspx.cs" Inherits="Doctor_Default" %>

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
            <td colspan="3" class="txt-center" style="text-decoration: underline">
                <strong>Add Details </strong>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits">Patient ID
            </td>
             <td class="contact-form-aits">
                <asp:DropDownList ID="ddlpatientid" runat="server" DataSourceID="SqlDataSource1" CssClass="txt-center" AppendDataBoundItems="true"
                    DataTextField="patientid" DataValueField="patientid" AutoPostBack="True" OnSelectedIndexChanged="ddlpatientid_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>"
                    SelectCommand="SELECT [patientid] FROM [Addpatient]"></asp:SqlDataSource>
            </td>
        </tr>
          <tr>
            <td class="contact-form-aits">Patient Name
            </td>
             <td class="contact-form-aits">
                 <asp:Label ID="lblname" runat="server" Text="Label" style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="txt-center">Test
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList ID="ddltest" runat="server" CssClass="txt-center">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>N/A</asp:ListItem>
                    <asp:ListItem>Blood Test</asp:ListItem>
                    <asp:ListItem>Urine Test</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
             <td class="contact-form-aits">Comment
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="txtcomment" runat="server" CssClass="txt-center" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
         <tr>
             <td class="contact-form-aits">Upload File</td>
            <td class="contact-form-aits">
                <asp:FileUpload ID="fi" runat="server" CssClass="txt-center"></asp:FileUpload>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits" colspan="3">
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
