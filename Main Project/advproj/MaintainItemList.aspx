<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaintainItemList.aspx.cs" Inherits="advproj.MaintainItemList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Maintain Item List</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <form id="form1" runat="server">
   <h2 align="center"><b>Maintain Item List</b></h2>
        <table class="table-style table-style-custom">
            <tr>
                <td>Item-ID</td>
                <td>Item </td>
                <td>Item Type</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Laptop</td>
                <td>IT</td>
                 <td>
                    <asp:Button ID="MaintainItemEdit1" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainItemDelete1" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Stationery</td>
                <td>Admin</td>
                <td>
                    <asp:Button ID="MaintainItemEdit2" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainItemDelete2" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                
                <td colspan="5" style="text-align: center">
            <asp:Button ID="MaintainInsert1" runat="server" Text="Insert" CssClass="button-style" OnClick="Button1_Click" PostBackUrl="~/InsertItem.aspx" />
                </td>
                
            </tr>
        </table>
    
    
        <p>
            &nbsp;</p>
    </form>


</asp:Content>