<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="advproj.ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>View Order</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
   
    
        <table class="table-style table-style-custom">

            <tr>
                <td>Purchase Order Id</td>
                <td>Purchase Order Date</td>
                <td>Vendor_Id</td>
                <td>Vendor Type</td>
                <td>Delivery date</td>
                <td>Subtotal</td>
                <td>Status</td>
                 <td>
                    <asp:Button ID="ViewOrderDelete1" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
             <tr>
                <td></td>
                 <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
               <td>
                    <asp:Button ID="ViewOrderDelete2" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
 <tr>
     <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="ViewOrderDelete3" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
 <tr>
                <td colspan="8" style="text-align:center">
                    <asp:Button class="ViewOrder1" ID="ViewOrder1" runat="server" OnClick="Button1_Click" Text="Click To View PO" PostBackUrl="" />
                </td>
              
            </tr>

            </asp:content>
