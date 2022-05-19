<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Index.master" AutoEventWireup="true" CodeFile="DoctorList.aspx.cs" Inherits="Admin_Default" %>

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
                    <span style="text-decoration: underline">Doctor List</span></b>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="loginid" HeaderText="Loginid" SortExpression="loginid" />
                        <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                        <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                       
                        <asp:BoundField DataField="phonenumber" HeaderText="Phonenumber" SortExpression="phonenumber" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="Delete" Text="Delete" CssClass="btn btn-danger" OnClick="Delete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>" SelectCommand="SELECT * FROM [Adddoctor]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

