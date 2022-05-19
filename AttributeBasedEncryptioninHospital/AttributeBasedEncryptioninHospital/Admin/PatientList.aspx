<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Index.master" AutoEventWireup="true" CodeFile="PatientList.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="banner1 jarallax">
        <div class="container">
        </div>
    </div>

    <div class="services-breadcrumb">
        <div class="container">
            <ul>
                <li><a href="#">Home</a><i>|</i></li>
                <li>Doctor List</li>
            </ul>
        </div>
    </div>
    <table class="table table-bordered" align="centre">
        <tr>
            <td colspan="4">
                <b>
                    <br />
                    <span style="text-decoration: underline">Patient List</span></b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="patientid">
                    <Columns>
                        <asp:BoundField DataField="patientname" HeaderText="patientname" SortExpression="patientname" />
                        <asp:BoundField DataField="patientid" HeaderText="patientid" SortExpression="patientid" ReadOnly="True" />
                        <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                       
                        <asp:BoundField DataField="symtoms" HeaderText="symtoms" SortExpression="symtoms" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="department" HeaderText="department" SortExpression="department" />
                        
                        <asp:BoundField DataField="phonemob" HeaderText="phonemob" SortExpression="phonemob" />
                        <asp:BoundField DataField="doctor" HeaderText="doctor" SortExpression="doctor" />
                        <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                        <asp:BoundField DataField="Approved" HeaderText="Approved" SortExpression="Approved" />
                        <asp:BoundField DataField="AppliedDate" HeaderText="AppliedDate" SortExpression="AppliedDate" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                        <asp:BoundField DataField="AppointmentDateandtime" HeaderText="AppointmentDateandtime" SortExpression="AppointmentDateandtime" />
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>" SelectCommand="SELECT * FROM [Addpatient]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

