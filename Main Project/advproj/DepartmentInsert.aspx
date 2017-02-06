<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DepartmentInsert.aspx.cs" Inherits="advproj.DepartmentInsert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
    <title>Department Maintenance</title>
    <link href="style/StyleSheet1.css" rel="stylesheet" />
    <style type="text/css">
        
        .auto-style2 {
            text-align: right;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 align="center"><b>INSERT DEPARTMENT DETAILS</b></h2>
        <table class="table-style">
           
            <tr>
               <td class="auto-style2">
                    <asp:Label ID="DepartmentLabelId" runat="server" Font-Bold="True" Text="Department_ID"></asp:Label>
                    :</td>
                <td>
                    <asp:TextBox ID="PurchaseOrder_IDTextBox" runat="server" Width="200px" Text="" ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                
                </tr>

                <tr>
                <td class="FieldLabels">
                    <asp:Label ID="DepartmentNameLabel" runat="server" Font-Bold="True" Text="Department_Name" style="text-align: right"></asp:Label>
                    :</td>
                    <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px" Text="" ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                    </tr>
                <tr>
                    <td></td>
                    <td style="text-align: left">

                        <asp:Button ID="DepartmentSave1" class="button-style" runat="server" cssClass="button-style" Text="Save" OnClick="Button1_Click" PostBackUrl="~/DepartmentDetails.aspx"  />
                        &nbsp;
                        <asp:Button ID="DepartmentCancel2" class="button-style" runat="server" cssClass="button-style" Text="Cancel" OnClick="Button1_Click" PostBackUrl="~/DepartmentDetails.aspx" />
                    </td>
                   
                </tr>
               
        </table>
      
        <div>
               
        
    </div>
    </form>

    </asp:Content>
