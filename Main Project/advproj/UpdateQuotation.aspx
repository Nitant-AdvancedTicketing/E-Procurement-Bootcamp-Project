<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="UpdateQuotation.aspx.cs" Inherits="advproj.UpdateQuotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>UPDATE QUOTATION</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>UPDATE QUOTATION</b></h2>
        <table class="table-style table-style-custom" style="width: 1000px">
            <tr>
                <td>Quotation_ID</td>
                <td>PR_ID</td>
                <td>Vendor_ID</td>
                <td>Item</td>
                <td>Unit Price</td>
                <td>Quantity</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="UpdateQuotationEdit1" runat="server" OnClick="Button1_Click" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="UpdateQuotationDelete1" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="UpdateQuotationEdit2" runat="server" OnClick="Button1_Click" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="UpdateQuotationDelete2" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td colspan="8" style="text-align: center">
                    <asp:Button class="UpdateQuotation1" ID="DepartmentInsert1" runat="server" OnClick="Button1_Click" Text="Send Quotation For Approval" PostBackUrl="" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>