<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="advproj.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/StyleSheet1.css" rel="stylesheet" />
   
    
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 align="center"><b>LOGIN</b></h2>
    <table class="table-style">


        <tr class="auto-style1">

            <td><b>&nbsp;<asp:label id="usernamelabel" runat="server" text="User Name:"></asp:label>
            </b></td>
            <td>

                <asp:textbox id="usernametextbox" runat="server" placeholder="Enter User Name" textmode="Email" width="200px" bordercolor="#CCCCCC"></asp:textbox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:label id="PasswordLabel" runat="server" font-bold="True" text="Password:"></asp:label>
            </td>
            <td>


                <asp:textbox id="passwordtextbox" runat="server" maxlength="20" textmode="Password" placeholder="Enter Password" width="200px" bordercolor="#CCCCCC"></asp:textbox>
            </td>
        </tr>

        <tr>
            <td></td>
            <td class="buttonstyle">&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="submitbutton" runat="server" text="SUBMIT" style="color: white; background-color: #777373;" onclick="submitbutton_Click" />
                &nbsp; &nbsp;&nbsp;<asp:button id="resetbutton" runat="server" onclick="resetbutton_Click" text="RESET" style="color: white; background-color: #777373;" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>


        </tr>
        <tr>
            <td></td>
            <td rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" style="font-style: italic; font-weight: bold;">forgot password?</a>
            </td>
        </tr>



    </table>
    <div style="text-align: center">
        <asp:label id="InvalidCredentialsMessage" runat="server" forecolor="Red" text="Your username or password is invalid. Please try again."
            visible="False"></asp:label>

    </div>

</asp:Content>
