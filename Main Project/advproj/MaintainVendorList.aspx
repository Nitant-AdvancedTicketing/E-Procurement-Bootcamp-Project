<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaintainVendorList.aspx.cs" Inherits="advproj.MaintainVendorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Maintain Vendor List</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>Maintain Vendor List</b></h2>
        <table class="table-style table-style-custom" style="width:1000px">
            <tr>
                <td>Vendor-ID</td>
                <td>Vendor Name</td>
                <td>Email-Id</td>
                <td>Mobile No.</td>
                <td>Landline</td>
                <td>Address1</td>
                <td>Address2</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Abcd</td>
                <td><a href="mailto:abcd@bchm.com">abcd@bchm.com</a></td>
                <td>8647296383</td>
                <td>080-263749</td>
                <td>Bangalore</td>
                <td>Mysore</td>
                <td>
                    <asp:Button ID="MaintainVendorEdit1" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainVendorDelete1" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Wxyz</td>
                <td><a href="mailto:wxyz@hsdgtb.com">wxyz@hsdgtb.com</a></td>
                <td>9262719362</td>
                <td>080-253674</td>
                <td>Mumbai</td>
                <td>Bangalore</td>
                <td>
                    <asp:Button ID="MaintainVendorEdit2" CssClass="button-style" runat="server" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="MaintainVendorDelete2" CssClass="button-style" runat="server" Text="Delete" />
                </td>
            </tr>

            <tr>
                <td colspan="9" style="text-align: center">
                    <asp:Button ID="MaintainInsertUser1" runat="server" Text="Insert" CssClass="button-style" OnClick="Button1_Click" PostBackUrl="~/InsertVendor.aspx" />
                </td>
            </tr>
        </table>

    </form>

</asp:Content>
