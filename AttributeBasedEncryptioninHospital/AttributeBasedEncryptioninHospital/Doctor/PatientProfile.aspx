<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Index.master" AutoEventWireup="true" CodeFile="PatientProfile.aspx.cs" Inherits="Patient_Default" %>

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
    <table class="table table-bordered">
        <tr>
            <td colspan="4" style="text-decoration: underline">
                <strong>Test</strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" class="table table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Patientid" HeaderText="Patientid" SortExpression="Patientid" />
                        <asp:BoundField DataField="Test" HeaderText="Test" SortExpression="Test" />
                        <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                        <asp:BoundField DataField="DoctorName" HeaderText="DoctorName" SortExpression="DoctorName" />
                        <asp:TemplateField HeaderText="Files">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="Files" Text='<%#Eval("files") %>' CommandArgument='<%#Eval("files") %>' OnClick="Files_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>" SelectCommand="SELECT [Id], [Patientid], [Test], [Comment], [DoctorName],files FROM [Comment] WHERE ([Patientid] = @Patientid)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Patientid" SessionField="userid" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

