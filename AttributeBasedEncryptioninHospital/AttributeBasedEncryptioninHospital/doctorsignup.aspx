<%@ Page Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true"
    CodeFile="doctorsignup.aspx.cs" Inherits="doctorsignup" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function AllowAlphabet(e) {
            isIE = document.all ? 1 : 0
            keyEntry = !isIE ? e.which : event.keyCode;
            if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
                return true;
            else {
                alert('Please Enter Only Character values.');
                return false;
            }
        }

    </script>
     
    <script language="javascript" type="text/javascript">
        function CheckNumeric(e) {

            if (window.event) // IE 
            {
                if ((e.keyCode < 48 || e.keyCode > 57) & e.keyCode != 8) {
                    event.returnValue = false;
                    return false;

                }
            }
            else { // Fire Fox
                if ((e.which < 48 || e.which > 57) & e.which != 8) {
                    e.preventDefault();
                    return false;

                }
            }
        }
     
    </script>
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="index.html">Home</a><i>|</i></li>
                <li>Doctor Signup</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td colspan="3" class="txt-center" style="text-decoration: underline">
                <strong>Add Doctor</strong>
            </td>
        </tr>
        <tr>
            <td style="height: 26px">Name
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="nametxt" runat="server" CssClass="txt-center" onkeypress="return AllowAlphabet(event)"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"
                    Style="position: relative" ControlToValidate="nametxt">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Login Id
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="lidtxt" runat="server" CssClass="txt-center"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Login Id"
                    Style="position: relative" ControlToValidate="lidtxt">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Password
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="pwdtxt" runat="server" CssClass="txt-center"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pwdtxt"
                    ErrorMessage="Enter Password" Style="position: relative">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="conpwdtxt" runat="server" CssClass="txt-center"></asp:TextBox>

                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pwdtxt"
                    ControlToValidate="conpwdtxt" ErrorMessage="Not Matching" Style="position: relative">Not Matching</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>Department
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList ID="depddl" runat="server" CssClass="txt-center">
                    <asp:ListItem>----Select----</asp:ListItem>
                    <asp:ListItem>Cardiology</asp:ListItem>
                    <asp:ListItem>Neurology</asp:ListItem>
                    <asp:ListItem>Opthalmology,</asp:ListItem>
                    <asp:ListItem>Nephrology</asp:ListItem>
                    <asp:ListItem>Surgery</asp:ListItem>
                    <asp:ListItem>Pediatrics</asp:ListItem>
                </asp:DropDownList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="depddl"
                    ErrorMessage="Enter Your Department" Style="position: relative">*</asp:RequiredFieldValidator>
            </td>
        </tr>
       
        <tr>
            <td>Phone Number
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="phtxt" runat="server" CssClass="txt-center" onkeypress="CheckNumeric(event);"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>Address
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="addtxt" runat="server" CssClass="txt-center"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>E-Mail
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="emtxt" runat="server" CssClass="txt-center"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emtxt"
                    ErrorMessage="Incorrect Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits" colspan="6">
                <asp:Button ID="subbtn" runat="server" Text="Submit" Width="94px" OnClick="subbtn_Click"
                    CssClass="btn btn-danger" />
                <asp:Label ID="lbllat" runat="server" BackColor="Black" ></asp:Label>
                <asp:Label ID="lbllong" runat="server" BackColor="Black" ></asp:Label>
            </td>

        </tr>
        
    </table>
</asp:Content>
