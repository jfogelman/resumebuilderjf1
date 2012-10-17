<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddResumeInfo.aspx.cs" Inherits="DocWebtest1.AddResumeInfo" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
        BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
        Height="215px" Width="753px" 
        onfinishbuttonclick="Wizard1_FinishButtonClick">
    <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
        BorderWidth="2px" Font-Bold="True" Font-Size="1.2em" ForeColor="White" 
        HorizontalAlign="Center" />
    <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
        ForeColor="#284E98" />
    <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
        ForeColor="White" />
    <SideBarStyle BackColor="#507CD1" Font-Size="0.8em" VerticalAlign="Top"/>
    <StepStyle Font-Size="0.8em" ForeColor="#333333" Width="500px" />
    <WizardSteps>
        <asp:WizardStep ID="WizardStep1" runat="server" Title="Contact Information">
            <h2>
                Add Contact info</h2>
    <p>
        
       <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
        <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>
        
        
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                SelectCommand="SELECT * FROM [Emails] WHERE ([UserID] = @UserID)" 
                DeleteCommand="DELETE FROM [Emails] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Emails] ([EmailText], [EmailDesc], [UserID]) VALUES (@EmailText, @EmailDesc, @UserID)" 
                UpdateCommand="UPDATE [Emails] SET [EmailText] = @EmailText, [EmailDesc] = @EmailDesc WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmailText" Type="String" />
                    <asp:Parameter Name="EmailDesc" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmailText" Type="String" />
                    <asp:Parameter Name="EmailDesc" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <h3>
                EMAILS</h3>
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" 
                DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailTextTextBox" runat="server" 
                                Text='<%# Bind("EmailText") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailDescTextBox" runat="server" 
                                Text='<%# Bind("EmailDesc") %>' />
                        </td>
                        <td>
                           <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>
                                No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="EmailTextTextBox" runat="server" 
                                Text='<%# Bind("EmailText") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="EmailDescTextBox" runat="server" 
                                Text='<%# Bind("EmailDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">
                                        </th>
                                        <th runat="server">
                                            ID</th>
                                        <th runat="server">
                                            Email Address</th>
                                        <th runat="server">
                                            Label (Optional)</th>
                                        <th runat="server">
                                            UserID</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                        </td>
                        <td>
                            <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
            <h3>
                PHONE NUMBERS</h3>
            <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID" 
                DataSourceID="SqlDataSourcePhone" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneNumberLabel" runat="server" 
                                Text='<%# Eval("PhoneNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                        </td>
                        <td>
                            <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999" ID="phnmask1" />
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" 
                                Text='<%# Bind("PhoneNumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>
                                No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>

                            <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                        </td>
                        <td>
                        <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999" ID="phnmask2" />
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" 
                                Text='<%# Bind("PhoneNumber") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneNumberLabel" runat="server" 
                                Text='<%# Eval("PhoneNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">
                                        </th>
                                        <th runat="server">
                                            ID</th>
                                        <th runat="server">
                                            PhnDesc</th>
                                        <th runat="server">
                                            PhoneNumber</th>
                                        <th runat="server">
                                            UserID</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PhoneNumberLabel" runat="server" 
                                Text='<%# Eval("PhoneNumber") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourcePhone" runat="server" 
                ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                DeleteCommand="DELETE FROM [Phones] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Phones] ([PhnDesc], [PhoneNumber], [UserID]) VALUES (@PhnDesc, @PhoneNumber, @UserID)" 
                SelectCommand="SELECT * FROM [Phones] WHERE ([UserID] = @UserID)" 
                UpdateCommand="UPDATE [Phones] SET [PhnDesc] = @PhnDesc, [PhoneNumber] = @PhoneNumber WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PhnDesc" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PhnDesc" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            ADDRESSES<br />
            <asp:ListView ID="ListView4" runat="server" DataKeyNames="ID" 
                DataSourceID="SqlDataSourceAddr" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddrDescLabel" runat="server" Text='<%# Eval("AddrDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street2Label" runat="server" Text='<%# Eval("Street2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="AddrDescTextBox" runat="server" 
                                Text='<%# Bind("AddrDesc") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Street2TextBox" runat="server" Text='<%# Bind("Street2") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>
                                No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="AddrDescTextBox" runat="server" 
                                Text='<%# Bind("AddrDesc") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="Street2TextBox" runat="server" Text='<%# Bind("Street2") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddrDescLabel" runat="server" Text='<%# Eval("AddrDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street2Label" runat="server" Text='<%# Eval("Street2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">
                                        </th>
                                        <th runat="server">
                                            ID</th>
                                        <th runat="server">
                                            AddrDesc</th>
                                        <th runat="server">
                                            Street1</th>
                                        <th runat="server">
                                            Street2</th>
                                        <th runat="server">
                                            City</th>
                                        <th runat="server">
                                            State</th>
                                        <th runat="server">
                                            Country</th>
                                        <th runat="server">
                                            Zipcode</th>
                                        <th runat="server">
                                            UserID</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddrDescLabel" runat="server" Text='<%# Eval("AddrDesc") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Street2Label" runat="server" Text='<%# Eval("Street2") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                        </td>
                        <td>
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceAddr" runat="server" 
                ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                DeleteCommand="DELETE FROM [Addresses] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Addresses] ([AddrDesc], [Street1], [Street2], [City], [State], [Country], [Zipcode], [UserID]) VALUES (@AddrDesc, @Street1, @Street2, @City, @State, @Country, @Zipcode, @UserID)" 
                SelectCommand="SELECT * FROM [Addresses] WHERE ([UserID] = @UserID)" 
                UpdateCommand="UPDATE [Addresses] SET [AddrDesc] = @AddrDesc, [Street1] = @Street1, [Street2] = @Street2, [City] = @City, [State] = @State, [Country] = @Country, [Zipcode] = @Zipcode WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="AddrDesc" Type="String" />
                    <asp:Parameter Name="Street1" Type="String" />
                    <asp:Parameter Name="Street2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Zipcode" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="AddrDesc" Type="String" />
                    <asp:Parameter Name="Street1" Type="String" />
                    <asp:Parameter Name="Street2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Zipcode" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            </strong>
        </ContentTemplate>
    </asp:UpdatePanel>
        </asp:WizardStep>
        <asp:WizardStep ID="WizardStep2" runat="server" Title="Objective">
        </asp:WizardStep>

        <asp:WizardStep runat="server" Title="Work Experience">
        </asp:WizardStep>
        <asp:WizardStep runat="server" Title="Education">
        </asp:WizardStep>
        <asp:WizardStep runat="server" Title="Skills">
        </asp:WizardStep>

    </WizardSteps>
</asp:Wizard>
<p>
asda
</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    <asp:Wizard ID="Wizard2" runat="server" Width="508px">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Contact Information">
                sdfsdfsdfsdfsdfsdfsdfsdfsdf
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Objective">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Work Experience">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Education">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Skills">
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</p>
</asp:Content>

