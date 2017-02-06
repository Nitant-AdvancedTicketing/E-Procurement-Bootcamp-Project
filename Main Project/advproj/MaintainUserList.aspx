<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaintainUserList.aspx.cs" Inherits="advproj.MaintainUserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Maintain User List</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>Maintain User List</b></h2>
        <table class="table-style table-style-custom" style="width:800px;">

            <tr>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Email-ID</td>
                <td>Role</td>
                <td>Department</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Gunashree</td>
                <td>GG</td>
                <td><a href="mailto:guna.ggowda@gmail.com">guna.ggowda@gmail.com</a></td>
                <td>Requester</td>
                <td>Progress</td>
                <td>
                    <asp:Button ID="MaintainUserEdit1" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainUserDelete1" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>Sonavva</td>
                <td>N</td>
                <td>sona.n@gmail.com</td>
                <td>Admin</td>
                <td>Automation</td>
                <td>
                    <asp:Button ID="MaintainUserEdit2" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainUserDelete2" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>

            <tr>
                <td colspan="7" style="text-align: center">
                    <asp:Button ID="MaintainInsertUser1" runat="server" Text="Insert" CssClass="button-style" OnClick="Button1_Click" PostBackUrl="~/InsertUser.aspx" />
                </td>
            </tr>
        </table>

    </form>
</asp:Content>
