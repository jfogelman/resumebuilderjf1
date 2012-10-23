<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddResumeInfo.aspx.cs" Inherits="DocWebtest1.AddResumeInfo" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="cke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;&nbsp;&nbsp;
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="3" BackColor="#EFF3FB" BorderColor="#B5C7DE"
        BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" Height="215px" Width="753px"
        OnFinishButtonClick="Wizard1_FinishButtonClick">
        <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px"
            Font-Bold="True" Font-Size="1.2em" ForeColor="White" HorizontalAlign="Center" />
        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
        <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
        <SideBarStyle BackColor="#507CD1" Font-Size="0.8em" VerticalAlign="Top" />
        <StepStyle Font-Size="0.8em" ForeColor="#333333" Width="500px" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Contact Information">
                <h2>
                    Add Contact info</h2>
                <p>
                    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
                    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
                </p>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                            SelectCommand="SELECT * FROM [Emails] WHERE ([UserID] = @UserID)" DeleteCommand="DELETE FROM [Emails] WHERE [ID] = @ID"
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
                        <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1"
                            InsertItemPosition="LastItem">
                            <AlternatingItemTemplate>
                                <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #FFF8DC;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailTextTextBox" runat="server" Text='<%# Bind("EmailText") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailDescTextBox" runat="server" Text='<%# Bind("EmailDesc") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                                    border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>
                                            No data was returned.
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailTextTextBox" runat="server" Text='<%# Bind("EmailText") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailDescTextBox" runat="server" Text='<%# Bind("EmailDesc") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:PlaceHolder runat="server" ID="ItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #DCDCDC; color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                                                border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                                                font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                                    <th runat="server">
                                                    </th>
                                                    <th runat="server">
                                                        Email Address
                                                    </th>
                                                    <th runat="server">
                                                        Label (Optional)
                                                    </th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                                            color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailTextLabel" runat="server" Text='<%# Eval("EmailText") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="EmailDescLabel" runat="server" Text='<%# Eval("EmailDesc") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <br />
                        <h3>
                            PHONE NUMBERS</h3>
                        <asp:ListView ID="ListView3" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourcePhone"
                            InsertItemPosition="LastItem" OnDataBound="ListView3_DataBound" OnItemDataBound="ListView3_ItemDataBound">
                            <AlternatingItemTemplate>
                                <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #FFF8DC;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                                    </td>
                                    <td>
                                      <%--<asp:Label ID="PhnNumLabel" runat="server"
                                        Text='<%# String.Format("{0:(###) ###-####}", Eval("PhoneNumber"))%>'>
                                        </asp:Label>--%>
                                        
                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999"
                                            ID="phnmask1" />
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                                    border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>
                                            No data was returned.
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999"
                                            ID="phnmask2" />
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:PlaceHolder runat="server" ID="ItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #DCDCDC; color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                                    </td>
                                    <td>
                                    <%--<asp:Label ID="PhnNumLabel" runat="server"
                                        Text='<%# String.Format("{0:(###) ###-####}", Eval("PhoneNumber"))%>'>
                                        </asp:Label>--%>
                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                                                border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                                                font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                                    <th runat="server">
                                                    </th>
                                                    <th runat="server">
                                                        Label
                                                    </th>
                                                    <th runat="server">
                                                        Number
                                                    </th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                                            color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                                                        ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                                        ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="PhnDescLabel" runat="server" Text='<%# Eval("PhnDesc") %>' />
                                    </td>
                                    <td>
<%--                                    <asp:Label ID="PhnNumLabel" runat="server"
                                        Text='<%# String.Format("{0:(###) ###-####}", Eval("PhoneNumber"))%>'>
                                        </asp:Label>
--%>                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSourcePhone" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                            DeleteCommand="DELETE FROM [Phones] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Phones] ([PhnDesc], [PhoneNumber], [UserID]) VALUES (@PhnDesc, @PhoneNumber, @UserID)"
                            SelectCommand="SELECT * FROM [Phones] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Phones] SET [PhnDesc] = @PhnDesc, [PhoneNumber] = @PhoneNumber WHERE [ID] = @ID">
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
                        <asp:ListView ID="ListView4" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAddr"
                            InsertItemPosition="LastItem" OnDataBound="ListView4_DataBound" OnItemDataBound="ListView4_ItemDataBound"
                            OnItemEditing="ListView4_ItemEditing" 
                            onitemupdating="ListView4_ItemUpdating">
                            <AlternatingItemTemplate>
                                <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #FFF8DC;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AddrDescTextBox" runat="server" Text='<%# Bind("AddrDesc") %>' />
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
                                        <asp:DropDownList ID="DropDownListAddrStateEditing" runat="server" onselectedindexchanged="DropDownListAddrStateEditing_SelectedIndexChanged" >
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                                       <%-- <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' Visible="false"/>--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="ZipcodeTextBox" Mask="99999"
                                            ID="zipmask1" />
                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                                    border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>
                                            No data was returned.
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AddrDescTextBox" runat="server" Text='<%# Bind("AddrDesc") %>' />
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
                                        <asp:DropDownList ID="DropDownListAddrStateInserting" runat="server" SelectedValue='<%# Bind("State") %>'
                                            OnDataBound="DropDownListAddrState_DataBound">
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                                        <%--<asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />--%>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="ZipcodeTextBox" Mask="99999"
                                            ID="zipmask2" />
                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:PlaceHolder runat="server" ID="ItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #DCDCDC; color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                                                border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                                                font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                                    <th runat="server">
                                                    </th>
                                                    <th runat="server">
                                                        Label
                                                    </th>
                                                    <th runat="server">
                                                        Street1
                                                    </th>
                                                    <th runat="server">
                                                        Street2
                                                    </th>
                                                    <th runat="server">
                                                        City
                                                    </th>
                                                    <th runat="server">
                                                        State
                                                    </th>
                                                    <th runat="server">
                                                        Country
                                                    </th>
                                                    <th runat="server">
                                                        Zipcode
                                                    </th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
                                            color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                                                        ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                                        ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
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
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSourceAddr" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                            DeleteCommand="DELETE FROM [Addresses] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Addresses] ([AddrDesc], [Street1], [Street2], [City], [State], [Country], [Zipcode], [UserID]) VALUES (@AddrDesc, @Street1, @Street2, @City, @State, @Country, @Zipcode, @UserID)"
                            SelectCommand="SELECT * FROM [Addresses] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Addresses] SET [AddrDesc] = @AddrDesc, [Street1] = @Street1, [Street2] = @Street2, [City] = @City, [State] = @State, [Country] = @Country, [Zipcode] = @Zipcode WHERE [ID] = @ID">
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
                        <%--<asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceAddrState" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                            SelectCommand="SELECT [State], [UserID] FROM [Addresses] WHERE ([State] = @State)">
                            <SelectParameters>
                                <asp:SessionParameter Name="State" SessionField="UserID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListAddrState0" runat="server" 
                            onselectedindexchanged="DropDownListAddrState0_SelectedIndexChanged">
                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                            <asp:ListItem Value="CA">California</asp:ListItem>
                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                            <asp:ListItem Value="NY">New York</asp:ListItem>
                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        <br />--%>
                        </strong>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Objective">
                <h2>
                    Objective<br />
                </h2>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <p>
                            <strong>&nbsp;<asp:TextBox ID="tbOjbective" runat="server" Height="80px" Rows="3"
                                TextMode="MultiLine" Width="512px"></asp:TextBox>
                            </strong>
                        </p>
                        &nbsp;
                        <asp:Button ID="bUpdateObjective" runat="server" CommandName="Update" Text="Update Objective    "
                            Width="131px" OnClick="bUpdateObjective_Click" OnCommand="bUpdateObjective_Command" />
                        <br />
                        <asp:Label ID="lblObjectiveValidation" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        </strong>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Work Experience">
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Education">
                <asp:ListView ID="ListView5" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceEducation"
                    InsertItemPosition="LastItem" 
                    OnSelectedIndexChanged="ListView5_SelectedIndexChanged" 
                    OnItemDataBound="ListView5_ItemDataBound" 
                    OnItemUpdating="ListView5_ItemUpdating">
                    <AlternatingItemTemplate>
                        <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                        <span style="background-color: #FAFAD2; color: #284775;">School Name:
                            <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Eval("SchoolName") %>' />
                            <br />
                            City:
                            <asp:Label ID="SchoolCityLabel" runat="server" Text='<%# Eval("SchoolCity") %>' />
                            State:
                            <asp:Label ID="SchoolStateLabel" runat="server" Text='<%# Eval("SchoolState") %>' />
                            Country:
                            <asp:Label ID="SchoolCountryLabel" runat="server" Text='<%# Eval("SchoolCountry") %>' />
                            <br />
                            Start Date:
                            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                            End Date:
                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                            <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                Enabled="False" Text="Currently Enrolled" />
                            <br />
                            Degree Name:
                            <asp:Label ID="DegreeNameLabel" runat="server" Text='<%# Eval("DegreeName") %>' />
                            Degree Title:
                            <asp:Label ID="DegreeTitleLabel" runat="server" Text='<%# Eval("DegreeTitle") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <br />
                        </span>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                        <span style="background-color: #FFCC66; color: #000080;">ID: School Name:
                            <asp:TextBox ID="SchoolNameTextBox" runat="server" Text='<%# Bind("SchoolName") %>' />
                            <br />
                            City:
                            <asp:TextBox ID="SchoolCityTextBox" runat="server" Text='<%# Bind("SchoolCity") %>' />
                            State:
                            <asp:DropDownList ID="DropDownListSchoolStateEditing" runat="server" 
                            onselectedindexchanged="DropDownListSchoolStateEditing_SelectedIndexChanged" >
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                            <%--<asp:TextBox ID="SchoolStateTextBox" runat="server" Text='<%# Bind("SchoolState") %>' />--%>
                            Country:
                            <asp:TextBox ID="SchoolCountryTextBox" runat="server" Text='<%# Bind("SchoolCountry") %>' />
                            <br />
                            Start Date:
                            <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                            End Date:
                            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                            <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                Text="IsCurrent" />
                            <br />
                            Degree Name:
                            <asp:TextBox ID="DegreeNameTextBox" runat="server" Text='<%# Bind("DegreeName") %>' />
                            Degree Title:
                            <asp:TextBox ID="DegreeTitleTextBox" runat="server" Text='<%# Bind("DegreeTitle") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </span>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                        <span class="failureNotification">
                            <asp:Literal ID="InsertEducationFailureText" runat="server"></asp:Literal>
                        </span>
                        <asp:ValidationSummary ID="InsertEducationValidationSummary" runat="server" CssClass="failureNotification"
                            ValidationGroup="InsertEducationValidationGroup" />
                        <span style="">School Name:
                            <asp:TextBox ID="SchoolNameTextBox" runat="server" Text='<%# Bind("SchoolName") %>'
                                CausesValidation="True" />
                            <span>
                                <asp:RequiredFieldValidator ID="SchoolNameRequired" runat="server" ControlToValidate="SchoolNameTextBox"
                                    CssClass="failureNotification" ErrorMessage="School Name is required." ToolTip="School Name is required."
                                    ValidationGroup="InsertEducationValidationGroup">*</asp:RequiredFieldValidator>
                            </span>
                            <br />
                            City:
                            <asp:TextBox ID="SchoolCityTextBox" runat="server" Text='<%# Bind("SchoolCity") %>' />
                            State:
                            <asp:DropDownList ID="DropDownListSchoolStateInserting" runat="server" SelectedValue='<%# Bind("SchoolState") %>'>
                                            <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                            <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                            <asp:ListItem Value="CA">California</asp:ListItem>
                                            <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                            <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                            <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                            <asp:ListItem Value="FL">Florida</asp:ListItem>
                                            <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                            <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                            <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                            <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                            <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                            <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                            <asp:ListItem Value="ME">Maine</asp:ListItem>
                                            <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                            <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                            <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                            <asp:ListItem Value="MT">Montana</asp:ListItem>
                                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                            <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                            <asp:ListItem Value="NY">New York</asp:ListItem>
                                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                            <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                            <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                            <asp:ListItem Value="TX">Texas</asp:ListItem>
                                            <asp:ListItem Value="UT">Utah</asp:ListItem>
                                            <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                            <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                            <asp:ListItem Value="WA">Washington</asp:ListItem>
                                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                        </asp:DropDownList>
                           <%-- <asp:TextBox ID="SchoolStateTextBox" runat="server" Text='<%# Bind("SchoolState") %>'
                                Width="30px" />--%>
                            Country:
                            <asp:TextBox ID="SchoolCountryTextBox" runat="server" Text='<%# Bind("SchoolCountry") %>' />
                            <br />
                            Start Date:
                            <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                            <ajax:MaskedEditExtender runat="server" TargetControlID="StartDateTextBox" Mask="99/9999" Century="2000"
                             MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true" ID="sdatemsk1" />
                             <ajax:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="StartDateTextBox" Format="MM/yyyy"></ajax:CalendarExtender>
                            End Date:
                            <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                            <ajax:MaskedEditExtender runat="server" TargetControlID="EndDateTextBox" Mask="99/9999"
                             Century="2000"
                             MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                            ID="sdatemsk2" />
                            <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                Text="Currently Enrolled" />
                            <br />
                            Degree Name:
                            <asp:TextBox ID="DegreeNameTextBox" runat="server" Text='<%# Bind("DegreeName") %>' />
                            Degree Title:
                            <asp:TextBox ID="DegreeTitleTextBox" runat="server" Text='<%# Bind("DegreeTitle") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="EducationValidationGroup"
                                CausesValidation="true" OnClick="InsertButton_Click" OnCommand="InsertButton_Command" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </span>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:PlaceHolder runat="server" ID="ItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                        <span style="background-color: #FAFAD2; color: #284775;">School Name:
                            <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Eval("SchoolName") %>' />
                            <br />
                            City:
                            <asp:Label ID="SchoolCityLabel" runat="server" Text='<%# Eval("SchoolCity") %>' />
                            State:
                            <asp:Label ID="SchoolStateLabel" runat="server" Text='<%# Eval("SchoolState") %>'
                                Width="30px" />
                            Country:
                            <asp:Label ID="SchoolCountryLabel" runat="server" Text='<%# Eval("SchoolCountry") %>' />
                            <br />
                            Start Date:
                            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate", "{0:d}") %>' />
                            End Date:
                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate", "{0:d}") %>' />
                            <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                Enabled="False" Text="Currently Enrolled" />
                            <br />
                            Degree Name:
                            <asp:Label ID="DegreeNameLabel" runat="server" Text='<%# Eval("DegreeName") %>' />
                            Degree Title:
                            <asp:Label ID="DegreeTitleLabel" runat="server" Text='<%# Eval("DegreeTitle") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <br />
                        </span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div style="font-family: Verdana, Arial, Helvetica, sans-serif; height: 272px; width: 544px;"
                            id="itemPlaceholderContainer" runat="server">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;
                            color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False"
                                        ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False"
                                        ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                        <span style="background-color: #FFCC66; font-weight: bold; color: #000080;">ID:
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            <br />
                            EduDesc:
                            <asp:Label ID="EduDescLabel" runat="server" Text='<%# Eval("EduDesc") %>' />
                            <br />
                            StartDate:
                            <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                            <br />
                            EndDate:
                            <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                            <br />
                            <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                Enabled="false" Text="IsCurrent" />
                            <br />
                            SchoolName:
                            <asp:Label ID="SchoolNameLabel" runat="server" Text='<%# Eval("SchoolName") %>' />
                            <br />
                            SchoolCity:
                            <asp:Label ID="SchoolCityLabel" runat="server" Text='<%# Eval("SchoolCity") %>' />
                            <br />
                            SchoolState:
                            <asp:Label ID="SchoolStateLabel" runat="server" Text='<%# Eval("SchoolState") %>' />
                            <br />
                            SchoolCountry:
                            <asp:Label ID="SchoolCountryLabel" runat="server" Text='<%# Eval("SchoolCountry") %>' />
                            <br />
                            DegreeName:
                            <asp:Label ID="DegreeNameLabel" runat="server" Text='<%# Eval("DegreeName") %>' />
                            <br />
                            DegreeTitle:
                            <asp:Label ID="DegreeTitleLabel" runat="server" Text='<%# Eval("DegreeTitle") %>' />
                            <br />
                            DegreeDesc:
                            <asp:Label ID="DegreeDescLabel" runat="server" Text='<%# Eval("DegreeDesc") %>' />
                            <br />
                            UserID:
                            <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            <br />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <br />
                            <br />
                        </span>
                    </SelectedItemTemplate>
                </asp:ListView>
                <br />
                <asp:SqlDataSource ID="SqlDataSourceEducation" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                    DeleteCommand="DELETE FROM [Educations] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Educations] ([EduDesc], [StartDate], [EndDate], [IsCurrent], [SchoolName], [SchoolCity], [SchoolState], [SchoolCountry], [DegreeName], [DegreeTitle], [DegreeDesc], [UserID]) VALUES (@EduDesc, @StartDate, @EndDate, @IsCurrent, @SchoolName, @SchoolCity, @SchoolState, @SchoolCountry, @DegreeName, @DegreeTitle, @DegreeDesc, @UserID)"
                    SelectCommand="SELECT * FROM [Educations] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [Educations] SET [EduDesc] = @EduDesc, [StartDate] = @StartDate, [EndDate] = @EndDate, [IsCurrent] = @IsCurrent, [SchoolName] = @SchoolName, [SchoolCity] = @SchoolCity, [SchoolState] = @SchoolState, [SchoolCountry] = @SchoolCountry, [DegreeName] = @DegreeName, [DegreeTitle] = @DegreeTitle, [DegreeDesc] = @DegreeDesc WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EduDesc" Type="String" />
                        <asp:Parameter DbType="Date" Name="StartDate" />
                        <asp:Parameter DbType="Date" Name="EndDate" />
                        <asp:Parameter Name="IsCurrent" Type="Boolean" />
                        <asp:Parameter Name="SchoolName" Type="String" />
                        <asp:Parameter Name="SchoolCity" Type="String" />
                        <asp:Parameter Name="SchoolState" Type="String" />
                        <asp:Parameter Name="SchoolCountry" Type="String" />
                        <asp:Parameter Name="DegreeName" Type="String" />
                        <asp:Parameter Name="DegreeTitle" Type="String" />
                        <asp:Parameter Name="DegreeDesc" Type="String" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EduDesc" Type="String" />
                        <asp:Parameter DbType="Date" Name="StartDate" />
                        <asp:Parameter DbType="Date" Name="EndDate" />
                        <asp:Parameter Name="IsCurrent" Type="Boolean" />
                        <asp:Parameter Name="SchoolName" Type="String" />
                        <asp:Parameter Name="SchoolCity" Type="String" />
                        <asp:Parameter Name="SchoolState" Type="String" />
                        <asp:Parameter Name="SchoolCountry" Type="String" />
                        <asp:Parameter Name="DegreeName" Type="String" />
                        <asp:Parameter Name="DegreeTitle" Type="String" />
                        <asp:Parameter Name="DegreeDesc" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Skills">
                <cke:CKEditorControl ID="ckeditor1" BasePath="/ckeditor1" runat="server" Toolbar="Basic"></cke:CKEditorControl>
                <asp:Button ID="bUpdateSkills" runat="server" CommandName="Update" Text="Update Skills"
                    Width="131px" OnClick="bUpdateSkills_Click" OnCommand="bUpdateSkills_Command" />
                <br />
                <asp:Label ID="lblSkills" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
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
        &nbsp;</p>
</asp:Content>
