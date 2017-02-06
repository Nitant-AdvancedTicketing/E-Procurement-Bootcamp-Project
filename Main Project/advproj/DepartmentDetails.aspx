<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DepartmentDetails.aspx.cs" Inherits="advproj.DepartmentMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Department Maintenance</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>DEPARTMENT DETAILS</b></h2>
        <table class="table-style table-style-custom">

            <tr>
                <td class="FieldLabels">
                    <asp:Label ID="DepartmentLabelId" runat="server" Font-Bold="True" Text="Department_ID"></asp:Label>
                </td>
                <td class="FieldLabels">
                    <asp:Label ID="DepartmentNameLabel" runat="server" Font-Bold="True" Text="Department_Name"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>1</td>
                <td>Finance</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Development</td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Edit" />
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" OnClick="Button1_Click" Text="Delete" />
                </td>
            </tr>
            <tr>
                
                <td colspan="4" style="text-align: center">
                    <asp:Button class="button-style" ID="DepartmentInsert1" runat="server" OnClick="Button1_Click" Text="Insert" PostBackUrl="~/DepartmentInsert.aspx" CssClass="auto-style1" />
                </td>
               
            </tr>

        </table> 
</form>
    
</asp:Content>
