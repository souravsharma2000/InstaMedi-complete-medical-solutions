<%@ Page Language="C#" MasterPageFile="~/Doctor/Index.master" AutoEventWireup="true"
    CodeFile="appointments.aspx.cs" Inherits="reception" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="Home.aspx">Home</a><i>|</i></li>
                <li>Doctor Login</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td class="txt-center" style="text-decoration: underline">
                <strong>Appointment Details </strong>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    DataKeyNames="patientid" DataSourceID="SqlDataSource1" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="patientname" HeaderText="patientname" SortExpression="patientname" />
                        <asp:BoundField DataField="patientid" HeaderText="patientid" SortExpression="patientid" ReadOnly="True" />
                        <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:BoundField DataField="symtoms" HeaderText="symtoms" SortExpression="symtoms" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />

                        <asp:BoundField DataField="phonemob" HeaderText="phonemob" SortExpression="phonemob" />

                        <asp:BoundField DataField="Approved" HeaderText="Approved" SortExpression="Approved" />
                        <asp:BoundField DataField="AppliedDate" HeaderText="AppliedDate" SortExpression="AppliedDate" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                        <asp:BoundField DataField="AppointmentDateandtime" HeaderText="AppointmentDateandtime" SortExpression="AppointmentDateandtime" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="status" Text="Select" OnClick="status_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>"
                    SelectCommand="SELECT * FROM [Addpatient] WHERE (([Approved] = @Approved) AND ([doctor] = @doctor))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Pending" Name="Approved" Type="String" />
                        <asp:SessionParameter Name="doctor" SessionField="doctorname" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Patient Id
            </td>
            <td>
                <asp:Label ID="lblpatientid" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Status
            </td>
            <td class="contact-form-aits">
                <asp:TextBox ID="lidtxt" CssClass="txt-center" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Submit"
                    OnClick="Button1_Click1" CssClass="btn btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
