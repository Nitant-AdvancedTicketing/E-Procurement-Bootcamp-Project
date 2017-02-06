<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="RequestItem.aspx.cs" Inherits="advproj.RequestItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>REQUEST ITEM</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>REQUEST ITEM</b></h2>
         <table class="table-style table-style-custom" style="width:500px">
             <tr>
                 <td>Purchase Request_ID</td>
                 <td>Purchase Requesr Date</td>
                 <td>Status</td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td></td>
                 <td></td>
                 <td></td>
             </tr>
             <tr>
                 <td colspan="3" style="text-align:center">
                    <asp:Button ID="RequestItemNewRequest1" runat="server" class="button-style" OnClick="Button1_Click" Text="New Request" Width="81px" PostBackUrl="~/PurchaseRequest.aspx" />
                </td>
             </tr>

         </table>

    </form>
</asp:Content>