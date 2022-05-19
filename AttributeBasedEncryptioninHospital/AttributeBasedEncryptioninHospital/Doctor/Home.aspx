<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/Index.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Patient_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table style="width: 100%;">
        <tr>
            <td class="txt-center" style="text-decoration: underline">
                <strong>Welcome <%=Session["doctor"] %>
                </strong>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gdnews" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="News" HeaderText="News" SortExpression="News" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eclinicConnectionString %>" SelectCommand="SELECT * FROM [News]"></asp:SqlDataSource>
            </td>
        </tr>


    </table>
</asp:Content>

