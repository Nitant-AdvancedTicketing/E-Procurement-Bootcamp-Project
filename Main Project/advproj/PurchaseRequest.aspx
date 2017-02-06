<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="PurchaseRequest.aspx.cs" Inherits="advproj.PurchaseRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Purchase Request</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="ResourceFiles/jquery.min.js"></script>
    <script src="ResourceFiles/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style/StyleSheet1.css" />
    <script>
        $(document).ready(function ()
        {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div>
            <table class="table-style">
                <tr>
                    <td colspan="3" class="TableTitle">
                        <asp:Label ID="PurchaseRequestLabel" runat="server" Text="PURCHASE REQUEST" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="TableTitle">&nbsp;</td>
                </tr>
                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="PurchaseRequestIDLabel" runat="server" Text="Purchase Request ID" Font-Bold="True" Visible="False"></asp:Label>
                    </td>
                    <td title="Select Type of Item">
                        <asp:TextBox ID="PurchaseRequestIDTextBox" runat="server" Width="200" Enabled="False" Visible="False"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="TypeOfItemLabel" runat="server" Text="Type of Item" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="TypeOfItemDropDown" runat="server" AutoPostBack="True" Width="200px" DataSourceID="ItemTypeSQLDB" DataTextField="ItemType" DataValueField="ItemType" OnSelectedIndexChanged="TypeOfItemDropDown_SelectedIndexChanged">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ItemTypeSQLDB" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT DISTINCT [ItemType] FROM [ItemMaintenance] ORDER BY [ItemType]"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td class="FieldLabels">
                        <asp:Label ID="ItemLabel" runat="server" Text="Item" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:ListBox ID="ItemListBox" runat="server" Width="200px" DataSourceID="ItemNameSQLDB" DataTextField="ItemName" DataValueField="ItemName" AutoPostBack="True" OnSelectedIndexChanged="ItemListBox_SelectedIndexChanged" SelectionMode="Multiple"></asp:ListBox>
                        <asp:SqlDataSource ID="ItemNameSQLDB" runat="server" ConnectionString="<%$ ConnectionStrings:AdvProcurementProcessingConnectionString %>" SelectCommand="SELECT [ItemName] FROM [ItemMaintenance] WHERE ([ItemType] = @ItemType)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TypeOfItemDropDown" DefaultValue="NULL" Name="ItemType" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemListBox" ErrorMessage="Enter the Item" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="FieldLabels">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>

                <tr>                                  
                    <td colspan="3" style="text-align: center; grid-row-align:center; width:inherit;">
                        <asp:GridView ID="ItemDetailsGrid" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" OnRowEditing="ItemDetailsGrid_RowEditing" OnRowUpdating="ItemDetailsGrid_RowUpdating" OnRowCancelingEdit="ItemDetailsGrid_RowCancelingEdit" Visible="False">
                            <FooterStyle BackColor="#FF6600" Font-Bold="True" ForeColor="White" Height="5px" />

                            <HeaderStyle BackColor="#4379cb" />

                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="#99CCFF" />
                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name"  ItemStyle-Width="100" ReadOnly="true"/>
                                <asp:TemplateField HeaderText="Qty"
                                    ItemStyle-VerticalAlign="Top">

                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" Width="100" runat="server" Text='<% #Eval("Qty") %>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtQuantity"
                                            Text='<%#Eval("Qty")%>'
                                            Width="100"
                                            runat="server" />
                                        <br />

                                    </EditItemTemplate>

                                    <ItemStyle VerticalAlign="Top"></ItemStyle>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reason"
                                    ItemStyle-VerticalAlign="Top">

                                    <ItemTemplate>
                                        <asp:Label ID="lblReason" runat="server" Width="100" Text='<%#Eval("Reason")%>'></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtReason"
                                            Text='<%#Eval("Reason")%>'
                                            Width="100"
                                            runat="server" />
                                        <br />

                                    </EditItemTemplate>

                                    <ItemStyle VerticalAlign="Top"></ItemStyle>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>                        
                    </td>                                        
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td colspan="1" style="text-align: center; grid-row-align:center;">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Button ID="SendRequestButton" runat="server" Text="Send Request" class="styleButton" OnClick="SendRequestButton_Click" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
    </form>

</asp:Content>
