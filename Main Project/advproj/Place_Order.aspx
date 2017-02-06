<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="Place_Order.aspx.cs" Inherits="advproj.Place_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Place Order</title>
    <link rel="stylesheet" type="text/css" href="style/StyleSheet1.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>

            <table  class="table-style">
                <tr>
                    <td class="TableTitle" colspan="3">
                        <asp:Label ID="placeorderlabel" runat="server" Font-Bold="True" Text="PLACE ORDER"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="PurchaseOrder_IDLabel" runat="server" Font-Bold="True" Text="Purchase Order_ID" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="PurchaseOrder_IDTextBox" runat="server" Width="200px" Enabled="False" Visible="False"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Quotation_IDLabel" runat="server" Font-Bold="True" Text="Quotation_ID"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Quotation_IDTextBox" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="Quotation_IDTextBox_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="ValidQuotationLabel" runat="server" Font-Bold="True" ForeColor="Red" Text="Enter a Valid Quotation_ID"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Quotation_IDTextBox" ErrorMessage="Enter Quotation ID" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_TypeLabel" runat="server" Font-Bold="True" Text="Vendor_Type"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="Vendor_TypeDropDown" runat="server" Width="200px" AutoPostBack="True" DataSourceID="VendorTypeSQLDS" DataTextField="VendorType" DataValueField="VendorType">

                        </asp:DropDownList>
                        <asp:SqlDataSource ID="VendorTypeSQLDS" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT DISTINCT [VendorType] FROM [VendorMaintenance] ORDER BY [VendorType]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="Vendor_NameLabel" runat="server" Font-Bold="True" Text="Vendor_Name"></asp:Label>
                    </td>
                    <td >
                        <asp:DropDownList ID="Vendor_NameDropDown" runat="server" Width="200px" AutoPostBack="True" DataTextField="VendorName" DataValueField="VendorName">
                        </asp:DropDownList>
                      <%--  <asp:SqlDataSource ID="VendorNameSQLDS" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT [VendorName] FROM [VendorMaintenance] WHERE ([VendorType] = @VendorType) ORDER BY [VendorName]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Vendor_TypeDropDown" DefaultValue="NULL" Name="VendorType" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        --%>
                    </td>
                    <td class="auto-style1">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels" colspan="3">
                        <asp:GridView ID="PlaceOrderGridView" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" OnRowEditing="PlaceOrderGridView_RowEditing" OnRowUpdating="PlaceOrderGridView_RowUpdating" OnRowCancelingEdit="PlaceOrderGridView_RowCancelingEdit">
                            <HeaderStyle BackColor="#4379cb" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="#99CCFF" />

                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name"  ItemStyle-Width="100" ReadOnly="true" >

<ItemStyle Width="100px"></ItemStyle>
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Qty" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server"  Width="100" Text='<% #Eval("Qty") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtQuantity" Text='<%#Eval("Qty")%>' Width="100" runat="server" />
                                    </EditItemTemplate>

                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="TermsAndCondition" ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTermsAndCondition" runat="server" Width="100" Text='<%#Eval("TermsAndCondition")%>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTermsAndCondition" Text='<%#Eval("TermsAndCondition")%>' Width="100" runat="server" />
                                    </EditItemTemplate>

                                    <ItemStyle VerticalAlign="Top"></ItemStyle>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="FieldLabels" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Button ID="SendPOButton" runat="server" Font-Bold="True" Text="SEND PO" Width="200px" class="styleButton" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</asp:Content>
