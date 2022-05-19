<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Doctor/Index.master"
    CodeFile="EncryptDecrypt.aspx.cs" Inherits="CS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="table">
        <tr>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnEncrypt" Text="Encrypt File" runat="server" OnClick="EncryptFile" CssClass="btn-danger" />
                <asp:Button ID="btnDecrypt" Text="Decrypt File" runat="server" OnClick="DecryptFile" CssClass="btn-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
