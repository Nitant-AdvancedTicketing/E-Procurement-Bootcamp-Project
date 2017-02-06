<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="QuotationRequest.aspx.cs" Inherits="advproj.QuotationRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quotation Request</title>
    <link rel="stylesheet" type="text/css" href="CSS/EProcStyleSheet.css" />    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <table class="table-style">
                <tr>
                    <td colspan="3" class="TableTitle">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="QUOTATION REQUEST"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="width:200px;"></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Quotation_IDLabel" runat="server" Font-Bold="True" Text="Quotation_ID" Visible="False"></asp:Label></td>
                    <td >
                        <asp:TextBox ID="Quotation_IDTextBox" runat="server" TextMode="SingleLine" Width="200px" Enabled="False" ReadOnly="True" Visible="False"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="PR_IDLabel" runat="server" Font-Bold="True" Text="PR_ID"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="PR_IDTextBox" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="PR_IDTextBox_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="ValidPRIDLabel" runat="server" Font-Bold="True" ForeColor="Red" Height="22px" Text="Enter A Valid PR_ID"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PR_IDTextBox" ErrorMessage="Enter Purchase Request ID" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_TypeLabel" runat="server" Font-Bold="True" Text="Vendor_Type"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="Vendor_TypeDropDown" runat="server" Width="200px" AutoPostBack="True" DataSourceID="Vendor_TypeSQLDS" DataTextField="VendorType" DataValueField="VendorType" OnSelectedIndexChanged="Vendor_TypeDropDown_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Vendor_TypeSQLDS" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT DISTINCT [VendorType] FROM [VendorMaintenance] ORDER BY [VendorType]"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_NameLabel" runat="server" Font-Bold="True" Text="Vendor_Name"></asp:Label></td>
                    <td>
                        <asp:ListBox ID="Vendor_NameListBox" runat="server" Width="200px" DataSourceID="Vendor_NameSQLDS" DataTextField="VendorName" DataValueField="VendorName" OnSelectedIndexChanged="Vendor_NameListBox_SelectedIndexChanged" SelectionMode="Multiple"></asp:ListBox>
                        <asp:SqlDataSource ID="Vendor_NameSQLDS" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT [VendorName] FROM [VendorMaintenance] WHERE ([VendorType] = @VendorType) ORDER BY [VendorName]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Vendor_TypeDropDown" DefaultValue="NULL" Name="VendorType" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Vendor_NameListBox" ErrorMessage="Enter Vendor Name" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        &nbsp;</td>
                    <td >
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="align-content:stretch;">
                        <asp:GridView ID="QuotationItemsGridView" runat="server" AutoGenerateEditButton="True" AutoGenerateColumns="False">

                            <HeaderStyle BackColor="#FF6600" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="#FBD8B5" />

                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" ReadOnly="true" />
                                
                                <asp:TemplateField HeaderText="Qty" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server" Text='<% #Eval("Qty") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtQuantity" Text='<%#Eval("Qty")%>' Width="90" runat="server" />
                                    </EditItemTemplate>

                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Reason" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <asp:Label ID="lblReason" runat="server" Text='<%#Eval("Reason")%>'></asp:Label>
                                    </ItemTemplate>

                                    <%--<EditItemTemplate>
                                        <asp:TextBox ID="txtReason" Text='<%#Eval("Reason")%>' Width="90" runat="server" />
                                    </EditItemTemplate>
                                    --%>
                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Button ID="RequestQuotationButton" runat="server" Font-Bold="True" Text="Request Quotation" class="styleButton" OnClick="RequestQuotationButton_Click" />
                    </td>
                </tr>
            </table>
            <br />
            <br />

            <br />
            <br />

        </div>
    </form>
</asp:Content>