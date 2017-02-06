<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertRole.aspx.cs" Inherits="advproj.InsertUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Insert User</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
             
        .auto-style1 {
            margin-left: 0px;
        }
        .auto-style2 {
            text-align: center;
        }
        
             
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
            <h2 align="center"><b>Insert Role</b></h2>

        <table class="table-style">
            
            <tr>
                <td class="auto-style2">Role ID :</td>
                <td class="auto-style2"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">Description:</td>
                <td class="auto-style2"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>

       <tr>          
           <td colspan="2" style="text-align:center">
            <asp:Button ID="Button1" runat="server" Text="Save" CssClass="auto-style1"  /> 
                &nbsp;&nbsp; 
                <asp:Button ID="Button2" runat="server" Text="Cancel" />
               </td>
        </tr>
    </table>
    </form>
</asp:Content>
