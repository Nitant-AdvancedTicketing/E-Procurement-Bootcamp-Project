<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertItem.aspx.cs" Inherits="advproj.InsertItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Department Maintenance</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>Insert Item</b></h2>
        <table class="table-style" style="width:700px">
            <tr>
                <td>Item ID </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Item</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged">
                        <asp:ListItem Value="Notebook" Text="Notebook" />
                        <asp:ListItem Value="Laptops" Text="Laptops" />
                        <asp:ListItem Value="Stationery" Text="Stationery" />
                        <asp:ListItem Value="Other" Text="Other" />
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" /></td>
            </tr>
            <tr>
                <td>Item Type</td>
                <td>
                    <asp:DropDownList ID="DropdownList1" runat="server">
                        <asp:ListItem Text="IT" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                    </asp:DropDownList></td>
            </tr>

            <tr>
                <td colspan="3" style="text-align: center">
                    <asp:Button ID="MaintainSave1" class="button-style" runat="server" Text="Save" PostBackUrl="~/MaintainItemList.aspx" />
                    &nbsp;
                    <asp:Button ID="MaintainCancel1" class="button-style" runat="server" Text="Cancel" PostBackUrl="~/MaintainItemList.aspx" />

                </td>
                
            </tr>
        </table>
    </form>

</asp:Content>