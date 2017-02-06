<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ForgetPasswordPage.aspx.cs" Inherits="advproj.ForgetPasswordPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 align="center"><b>Reset Password</b></h2>
    <table class="table-style">
        <tr>
            <td>
                <asp:label id="Newpasswordlabel" runat="server" font-bold="True" text="New Password:"></asp:label>
            </td>
            <td>


                <asp:textbox id="Newpasswordtextbox" runat="server" maxlength="20" textmode="Password" placeholder="Enter New Password" width="200px"></asp:textbox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:label id="ConfirmpasswordLabel" runat="server" font-bold="True" text="Confirm Password:"></asp:label>
            </td>
            <td>


                <asp:textbox id="Confirmpasswordtextbox" runat="server" maxlength="20" textmode="Password" placeholder="Enter Password to confirm" width="200px"></asp:textbox>
            </td>
        </tr>

        <tr>

            <td colspan="2" class="buttonstyle">
                <asp:button id="submitbutton" button runat="server" text="SUBMIT" style="color: white; background-color: #777373;" onclick="submitbutton_Click" />

            </td>


        </tr>
    </table>
    <div style="text-align: center">
        <asp:label id="InvalidPasswordMessage" runat="server" forecolor="Red" text="Your password does not match. Please try again." visible="False"></asp:label>
</asp:Content>
