<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertVendor.aspx.cs" Inherits="advproj.InserVendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Insert Vendor</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <h2 align="center"><b>Insert Vendor</b></h2>

        <table class="table-style">
            <tr>
                <td>Vendor ID : </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Vendor Name :</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Email Id :</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Mobile No. :</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Landline No. :</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Address1 :</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Address1 :</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center">

                    <asp:Button ID="InsertVendorSave1" class="button-style" runat="server" CssClass="button-style" Text="Save" OnClick="Button1_Click" PostBackUrl="~/MaintainVendorList.aspx" />
               
                    <asp:Button ID="InsertVendorCancel1" class="button-style" runat="server" CssClass="button-style" Text="Cancel" OnClick="Button1_Click" PostBackUrl="~/MaintainVendorList.aspx" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
