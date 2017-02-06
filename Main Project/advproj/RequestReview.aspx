<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="RequestReview.aspx.cs" Inherits="advproj.RequestReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>REQUEST REVIEW</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>REQUEST REVIEW</b></h2>
        <table class="table-style table-style-custom" style="width:1000px">
         <tr>
                 <td>PurchaseRequest_ID</td>
                 <td>Email_ID</td>
                 <td>Item </td>
                 <td>Item Type</td>
                 <td>escription</td>
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
                  <td>
                    <asp:Button ID="RequestReviewApprove1" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Approve" />
                </td>
                <td>
                    <asp:Button ID="RequestReviewDeny1" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Deny" />
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
                    <asp:Button ID="RequestReviewApprove2" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Approve" />
                </td>
                <td>
                    <asp:Button ID="RequestReviewDeny2" CssClass="button-style" runat="server" OnClick="Button1_Click" Text="Deny" />
                </td>
             </tr>
            
             </table>
             </form>
</asp:Content>