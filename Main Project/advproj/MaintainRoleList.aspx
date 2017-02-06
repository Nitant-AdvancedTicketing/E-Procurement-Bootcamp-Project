<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaintainRoleList.aspx.cs" Inherits="advproj.MaintainRoleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Maintain Role List</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
   <h2 align="center"><b>Maintain Role List</b></h2>
        <table class="table-style table-style-custom">

            <tr>
                <td>Role-ID</td>
                <td>Role Description</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Admin</td>
                <td>
                    <asp:Button ID="MaintainRoleEdit1" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainRoleDelete1" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Requester</td>
                 <td>
                    <asp:Button ID="MaintainRoleEdit2" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainRoleDelete2" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
       <td colspan="4" style="text-align:center" >
        <asp:Button ID="MaintainInsertRole1" runat="server" Text="Insert" CssClass="button-style" OnClick="Button1_Click" PostBackUrl="~/InsertRole.aspx" />
        </td>
       </tr> </table>
   
    </form>
</asp:Content>

