<%@ Page Language="C#" Debug="true" MasterPageFile="~/Patient/Index.master" AutoEventWireup="true"
    CodeFile="PatientRegister.aspx.cs" Inherits="ipregister" Title="Untitled Page" %>


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
                <li><a href="#">Home</a><i>|</i></li>
                <li>Patient Registration</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td colspan="4" style="text-decoration: underline">
                <strong>Add Patient</strong>
            </td>
        </tr>
        <tr>
            <td class="txt-lt">PatientName:
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="TextBox1" CssClass="txt-center" runat="server" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="*" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>

            <td class="txt-lt">Patient ID:
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="TextBox2" CssClass="txt-center" runat="server" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="contact-form-aits">Gender:
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList CssClass="txt-center" ID="DropDownList1" runat="server">
                    <asp:ListItem>...select...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1"
                    ErrorMessage="*" InitialValue="...select..." SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>

            <td class="txt-lt">Age:
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="TextBox3" CssClass="txt-center" runat="server" onkeypress="CheckNumeric(event);"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="*" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="txt-lt">Address:
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="TextBox4" CssClass="txt-center" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                    ErrorMessage="*" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>
            <td class="txt-lt">Phoneno(mob):
            </td>
            <td class="contact-form-aits">
                <asp:TextBox CssClass="txt-center" ID="TextBox6" runat="server" onkeypress="CheckNumeric(event);"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6"
                    ErrorMessage="*" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="txt-lt">Symptoms:
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="TextBox12" CssClass="txt-center" runat="server" onkeypress="return AllowAlphabet(event)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox12"
                    ErrorMessage="*" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>





            <td class="txt-lt">Department:
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList CssClass="txt-center" ID="DropDownList3" runat="server" AutoPostBack="True" AppendDataBoundItems="true"
                    OnTextChanged="DropDownList3_TextChanged" DataSourceID="SqlDataSource3" DataTextField="Department"
                    DataValueField="Department">
                    <asp:ListItem>...Select...</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>"
                    SelectCommand="SELECT [Department] FROM [Department]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList3"
                    ErrorMessage="*" InitialValue="...select..." SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>

            <td class="txt-lt">Select Doctor:
            </td>
            <td class="contact-form-aits">
                <asp:DropDownList CssClass="txt-center" ID="DropDownList5" runat="server"
                    AppendDataBoundItems="True" DataSourceID="SqlDataSource4" DataTextField="name"
                    DataValueField="name">
                    <asp:ListItem>...select...</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                    ConnectionString="<%$ ConnectionStrings:hospitaldatabasesecurityConnectionString %>"
                    SelectCommand="SELECT [name] FROM [Adddoctor]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList5"
                    ErrorMessage="*" InitialValue="...select..." SetFocusOnError="True">
                </asp:RequiredFieldValidator>

            </td>


            <td class="txt-lt">DOB
            </td>
            <td class="contact-form-aits">
               
                <asp:TextBox ID="txtdob" runat="server" CssClass="txt-center"></asp:TextBox>
            </td>


        </tr>
        <tr>
            <td class="contact-form-aits">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
