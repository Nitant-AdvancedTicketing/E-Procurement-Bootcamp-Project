<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertUser.aspx.cs" Inherits="advproj.InsertRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>InsertRole</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <h2 align="center"><b>Insert User</b></h2>

        <table class="table-style">
            <tr>
                <td> First Name </td>
                <td > <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td >Last Name </td>
                <td > <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td >Email-Id </td>
                <td > <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Role</td>
                <td> <asp:DropdownList ID="TextBox2" runat="server" Width="125px">
                    <asp:ListItem Text="IT" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                     </asp:DropdownList></td>
            </tr>
            <tr>
                <td>Department</td>
                <td> <asp:DropdownList ID="TextBox3" runat="server" Width="128px">
                    <asp:ListItem Text="IT" Value="0"></asp:ListItem> 
                    <asp:ListItem Text="Ops Manager" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Team Leader" Value="2"></asp:ListItem> 
                     </asp:DropdownList></td>
            </tr>
         <tr>
                <td colspan="2" style="text-align:center">

                    <asp:Button ID="InsertUserSave1" class="button-style" runat="server" CssClass="button-style" Text="Save" OnClick="Button1_Click" PostBackUrl="~/MaintainUserList.aspx" />
                
                    <asp:Button ID="InsertUserCancel1" class="button-style" runat="server" CssClass="button-style" Text="Cancel" OnClick="Button1_Click" PostBackUrl="~/MaintainUserList.aspx" />
                </td>
            </tr>
            </table>
    </form>
</asp:Content>
