<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="PlaceOrder.aspx.cs" Inherits="advproj.PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Quotation Request</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>

            <table class="table-style">
                <tr>
                    <td class="TableTitle" colspan="3">
                        <asp:Label ID="placeorderlabel" runat="server" Font-Bold="True" Text="PLACE ORDER"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="PurchaseOrder_IDLabel" runat="server" Font-Bold="True" Text="Purchase Order_ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="PurchaseOrder_IDTextBox" runat="server" Width="200px" Text="1234" ReadOnly="True" Enabled="False"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Quotation_IDLabel" runat="server" Font-Bold="True" Text="Quotation_ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Quotation_IDTextBox" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Quotation_IDTextBox" ErrorMessage="Enter Quotation ID" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="PR_IDLabel" runat="server" Font-Bold="True" Text="PR_ID"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="PR_IDTextBox" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PR_IDTextBox" ErrorMessage="Enter PR_ID" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_TypeLabel" runat="server" Font-Bold="True" Text="Vendor_Type"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="Vendor_TypeDropDown" runat="server" Width="200px">
                            <asp:ListItem>ADMIN</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_NameLabel" runat="server" Font-Bold="True" Text="Vendor_Name"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="Vendor_NameDropDown" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="ItemLabel" runat="server" Font-Bold="True" Text="Item"></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:ListBox ID="ItemListBox" runat="server" Width="200px"></asp:ListBox>
                    </td>
                    <td class="auto-style1">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ItemListBox" ErrorMessage="Enter item" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Button ID="SendPOButton" runat="server" Font-Bold="True" Text="SEND PO" Width="200px" class="styleButton" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</asp:Content>

