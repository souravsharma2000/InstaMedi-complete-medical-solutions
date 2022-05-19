<%@ Page Title="" Language="C#" MasterPageFile="~/Patient/Index.master" AutoEventWireup="true" CodeFile="AppointApply.aspx.cs" Inherits="Patient_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <td>
                <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="False" DataKeyNames="patientid" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="patientname" HeaderText="Patientname" SortExpression="patientname" />
                        <asp:BoundField DataField="patientid" HeaderText="Patientid" ReadOnly="True" SortExpression="patientid" />
                        <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                        <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
                        <asp:BoundField DataField="symtoms" HeaderText="Symtoms" SortExpression="symtoms" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                        <asp:BoundField DataField="phonemob" HeaderText="Phonemob" SortExpression="phonemob" />
                        <asp:BoundField DataField="doctor" HeaderText="Doctor" SortExpression="doctor" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                        <asp:BoundField DataField="Approved" HeaderText="Approved" SortExpression="Approved" />
                        <asp:BoundField DataField="AppliedDate" HeaderText="AppliedDate" SortExpression="AppliedDate" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                        <asp:BoundField DataField="AppointmentDateandtime" HeaderText="AppointmentDateandtime" SortExpression="AppointmentDateandtime" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>" SelectCommand="SELECT * FROM [Addpatient]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

