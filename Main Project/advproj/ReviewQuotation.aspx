<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ReviewQuotation.aspx.cs" Inherits="advproj.ReviewQuotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>REQUEST QUOTATION</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>REQUEST QUOTATION</b></h2>
      
         <table class="table-style table-style-custom" style="width:1000px">
             <tr>
                 <td>Quotation_ID</td>
                 <td>PR_ID</td>
                 <td>Vendor_ID</td>
                 <td>Item</td>
                 <td>Unit Price</td>
                 <td>Quantity</td>
                 <td>Status</td>
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
                 <td></td>
                   <td>
                    <asp:Button ID="QuotationReviewApprove2" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Approve" />
                </td>
                <td>
                    <asp:Button ID="QuotationReviewDeny2" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Deny" />
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
                    <asp:Button ID="QuotationReviewApprove1" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Approve" />
                </td>
                <td>
                    <asp:Button ID="QuotationReviewDeny1" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Deny" />
                </td>
             </tr>
             
             </table>

    </form>
</asp:Content>