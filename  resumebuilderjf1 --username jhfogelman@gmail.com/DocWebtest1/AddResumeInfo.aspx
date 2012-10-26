<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AddResumeInfo.aspx.cs" Inherits="DocWebtest1.AddResumeInfo" %>

<%@ Register Assembly="DocWebtest1" Namespace="DocWebtest1" TagPrefix="cc1" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="cke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    &nbsp;&nbsp;&nbsp;
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="2" BackColor="#EFF3FB" BorderColor="#B5C7DE"
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
                        #region EmailListView
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
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditEmailValidationGroup" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailTextTextBox" runat="server" Text='<%# Bind("EmailText") %>'
                                            CausesValidation="True" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="EmailTextTextBox"
                                            CssClass="failureEmailNotification" runat="server" ValidationGroup="EditEmailValidationGroup"
                                            ErrorMessage="Email Address is required." ToolTip="Email Address is required."
                                            ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="EmailTextTextBox" ErrorMessage="Invalid Email Format" ToolTip="Invalid Email Format"
                                            ForeColor="Red" ValidationGroup="EditEmailValidationGroup" CssClass="failureEmailNotification">*</asp:RegularExpressionValidator>
                                        <%--<asp:RegularExpressionValidator ID="test1rebv" runat="server" ControlToValidate="EmailTextTextBox"
                                         ValidationExpression="wot" ErrorMessage="wot!" CssClass="failureEmailNotification"  ValidationGroup="EditEmailValidationGroup" >*</asp:RegularExpressionValidator>--%>
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
                                <asp:PlaceHolder runat="server" ID="InsertItemEmailTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertEmailValidationGroup" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="EmailTextTextBox" runat="server" Text='<%# Bind("EmailText") %>'
                                            CausesValidation="True" />
                                        <asp:RequiredFieldValidator ControlToValidate="EmailTextTextBox" CssClass="failureEmailNotification"
                                            runat="server" ValidationGroup="InsertEmailValidationGroup" ErrorMessage="Email Address is required."
                                            ToolTip="Email Address is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="EmailTextTextBox" ErrorMessage="Invalid Email Format" ToolTip="Invalid Email Format"
                                            CssClass="failureEmailNotification" ValidationGroup="InsertEmailValidationGroup"
                                            ForeColor="Red">*</asp:RegularExpressionValidator>
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
                                <span class="failureEmailNotification">
                                    <asp:Literal ID="InsertEmailFailureText" runat="server"></asp:Literal>
                                    <asp:Literal ID="EditEmailFailureText" runat="server"></asp:Literal>
                                </span>
                                <asp:ValidationSummary ID="InsertEmailValidationSummary" runat="server" CssClass="failureEmailNotification"
                                    ValidationGroup="InsertEmailValidationGroup" />
                                <asp:ValidationSummary ID="EditEmailValidationSummary" runat="server" CssClass="failureEmailNotification"
                                    ValidationGroup="EditEmailValidationGroup" />
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
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditPhoneValidationGroup" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999"
                                            ID="phnmask1" />
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>'
                                            CausesValidation="true" />
                                        <asp:RequiredFieldValidator ControlToValidate="PhoneNumberTextBox" CssClass="failurePhoneNotification"
                                            runat="server" ValidationGroup="EditPhoneValidationGroup" ErrorMessage="Phone Number is required."
                                            ToolTip="Phone Number is required." ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertPhoneValidationGroup" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="PhnDescTextBox" runat="server" Text='<%# Bind("PhnDesc") %>' />
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="PhoneNumberTextBox" Mask="(999)999-9999"
                                            ID="phnmask2" />
                                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>'
                                            CausesValidation="true" />
                                        <asp:RequiredFieldValidator ControlToValidate="PhoneNumberTextBox" CssClass="failurePhoneNotification"
                                            runat="server" ValidationGroup="InsertPhoneValidationGroup" ErrorMessage="Phone Number is required."
                                            ToolTip="Phone Number is required." ForeColor="Red">*</asp:RequiredFieldValidator>
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
                                <span class="failurePhoneNotification">
                                    <asp:Literal ID="InsertPhoneFailureText" runat="server"></asp:Literal>
                                    <asp:Literal ID="EditPhoneFailureText" runat="server"></asp:Literal>
                                </span>
                                <asp:ValidationSummary ID="InsertPhoneValidationSummary" runat="server" CssClass="failurePhoneNotification"
                                    ValidationGroup="InsertPhoneValidationGroup" />
                                <asp:ValidationSummary ID="EditPhoneValidationSummary" runat="server" CssClass="failurePhoneNotification"
                                    ValidationGroup="EditPhoneValidationGroup" />
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
                                        --%>
                                        <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
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
                        <h3>
                            ADDRESSES</h3>
                        <asp:ListView ID="ListView4" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAddr"
                            InsertItemPosition="LastItem" OnDataBound="ListView4_DataBound" OnItemDataBound="ListView4_ItemDataBound"
                            OnItemEditing="ListView4_ItemEditing" OnItemUpdating="ListView4_ItemUpdating">
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
                                        <br />
                                        <asp:Label ID="Street2Label" runat="server" Text='<%# Eval("Street2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' Width="30px" />
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
                                        <asp:TextBox ID="AddrDescTextBox" runat="server" Text='<%# Bind("AddrDesc") %>' Width="100px" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                                        <br />
                                        <asp:TextBox ID="Street2TextBox" runat="server" Text='<%# Bind("Street2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                    </td>
                                    <td>
                                        <cc1:StateDropDownList ID="DropDownListAddrStateEditing" runat="server" OnSelectedIndexChanged="DropDownListAddrStateEditing_SelectedIndexChanged">
                                        </cc1:StateDropDownList>
                                        <%--<asp:DropDownList ID="DropDownListAddrStateEditing" runat="server" OnSelectedIndexChanged="DropDownListAddrStateEditing_SelectedIndexChanged">
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
                                        </asp:DropDownList>--%>
                                        <%-- <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' Visible="false"/>--%>
                                    </td>
                                    <td>
                                        <%--<asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />--%>
                                        <cc1:CountryDropDownList ID="DropDownListAddrCountryEditing" runat="server" OnSelectedIndexChanged="DropDownListAddrCountryEditing_SelectedIndexChanged">
                                        </cc1:CountryDropDownList>
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="ZipcodeTextBox" Mask="99999"
                                            ID="zipmask1" />
                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' Width="50px" />
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
                                        <asp:TextBox ID="AddrDescTextBox" runat="server" Text='<%# Bind("AddrDesc") %>' Width="100px" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                                        <br />
                                        <asp:TextBox ID="Street2TextBox" runat="server" Text='<%# Bind("Street2") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                                    </td>
                                    <td>
                                        <cc1:StateDropDownList ID="DropDownListAddrStateInserting" runat="server" SelectedValue='<%# Bind("State") %>'
                                            OnDataBound="DropDownListAddrState_DataBound">
                                        </cc1:StateDropDownList>
                                        <%--<asp:DropDownList ID="DropDownListAddrStateInserting" runat="server" SelectedValue='<%# Bind("State") %>'
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
                                        </asp:DropDownList>--%>
                                        <%--<asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />--%>
                                    </td>
                                    <td>
                                        <%-- <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />--%>
                                        <cc1:CountryDropDownList ID="DropDownListAddrCountryInserting" runat="server" SelectedValue='<%# Bind("Country") %>'>
                                        </cc1:CountryDropDownList>
                                    </td>
                                    <td>
                                        <ajax:MaskedEditExtender runat="server" TargetControlID="ZipcodeTextBox" Mask="99999"
                                            ID="zipmask2" />
                                        <asp:TextBox ID="ZipcodeTextBox" runat="server" Text='<%# Bind("Zipcode") %>' Width="50px" />
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
                                        <br />
                                        <asp:Label ID="Street2Label" runat="server" Text='<%# Eval("Street2") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' Width="30px" />
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
                                                        Street
                                                    </th>
                                                    <th runat="server">
                                                        City
                                                    </th>
                                                    <th runat="server" width="30px" align="center">
                                                        State
                                                    </th>
                                                    <th runat="server">
                                                        Country
                                                    </th>
                                                    <th runat="server" width="30px" align="center">
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
                                        <br />
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
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:ListView ID="ListView6" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceExperiences"
                            InsertItemPosition="LastItem" OnItemDataBound="ListView6_ItemDataBound" OnItemInserting="ListView6_ItemInserting"
                            OnItemUpdating="ListView6_ItemUpdating" Style="padding-right: 0px">
                            <AlternatingItemTemplate>
                                <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <li style="background-color: #FFF8DC;">Job Title:
                                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                                    &nbsp;Company:
                                    <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                                    <br />
                                    State:
                                    <asp:Label ID="CompanyStateLabel" runat="server" Text='<%# Eval("CompanyState") %>' />
                                    &nbsp;City:
                                    <asp:Label ID="CompanyCityLabel" runat="server" Text='<%# Eval("CompanyCity") %>' />
                                    <br />
                                    Start Date:
                                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                                    &nbsp;End Date:
                                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                        Enabled="False" Text="Current?" />
                                    <br />
                                    <asp:ListView ID="ListView7a" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAch2"
                                        OnItemDataBound="ListView7a_ItemDataBound">
                                        <AlternatingItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #FFFFFF; color: #284775;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                            </li>
                                        </AlternatingItemTemplate>
                                        <EmptyDataTemplate>
                                            No data was returned.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                            <br />
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #E0FFFF; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <%--<div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                                                <asp:DataPager ID="DataPager2" runat="server">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>--%>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSourceAch2" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                                        SelectCommand="SELECT * FROM [Achievements] WHERE ([ExperienceID] = @ExperienceID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ExpIDHidden" Name="ExperienceID" PropertyName="Value"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:HiddenField ID="ExpIDHidden" runat="server" Value='<%# Eval("ID", "{0}") %>'
                                        Visible="False" />
                                </li>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <li style="background-color: #008A8C; color: #FFFFFF;">Job Title:
                                    <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                                    Company:
                                    <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                                    <br />
                                    State:
                                    <cc1:StateDropDownList ID="DropDownListCompanyStateEditing" runat="server" OnSelectedIndexChanged="DropDownListCompanyStateEditing_SelectedIndexChanged">
                                    </cc1:StateDropDownList>
                                    <%--<asp:DropDownList ID="DropDownListCompanyStateEditing" runat="server" OnSelectedIndexChanged="DropDownListCompanyStateEditing_SelectedIndexChanged">
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
                                    </asp:DropDownList>--%>
                                    &nbsp;<asp:TextBox ID="CompanyCityTextBox" runat="server" Text='<%# Bind("CompanyCity") %>' />
                                    <br />
                                    Start Date:
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                                    <%--<ajax:MaskedEditExtender runat="server" TargetControlID="StartDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk1" />
                                    <ajax:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="StartDateTextBox" Format="MM/yyyy">
                                    </ajax:CalendarExtender>--%>
                                    &nbsp;<asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                                    <br />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                        Text="Current?" />
                                    <br />
                                    <asp:ListView ID="ListView7" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAch1"
                                        InsertItemPosition="LastItem" OnItemCommand="ListView7_ItemCommand" OnItemDataBound="ListView7_ItemDataBound"
                                        OnItemEditing="ListView7_ItemEditing" OnItemInserting="ListView7_ItemInserting">
                                        <AlternatingItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #FFFFFF; color: #284775;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="EditItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #999999;">
                                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                                <br />
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            </li>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            No data was returned.
                                        </EmptyDataTemplate>
                                        <InsertItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style=""
                                                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            </li>
                                        </InsertItemTemplate>
                                        <ItemSeparatorTemplate>
                                            <br />
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #E0FFFF; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <div style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif;
                                                color: #FFFFFF;">
                                                <asp:DataPager ID="DataPager2" runat="server">
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
                                            <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSourceAch1" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                                        DeleteCommand="DELETE FROM [Achievements] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Achievements] ([Description], [ExperienceID]) VALUES (@Description, @ExperienceID)"
                                        SelectCommand="SELECT * FROM [Achievements] WHERE ([ExperienceID] = @ExperienceID)"
                                        UpdateCommand="UPDATE [Achievements] SET [Description] = @Description WHERE [ID] = @ID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="ExperienceID" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ExpIDHidden" Name="ExperienceID" PropertyName="Value"
                                                Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Description" Type="String" />
                                            <asp:Parameter Name="ID" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    <asp:HiddenField ID="ExpIDHidden" runat="server" Value='<%# Eval("ID", "{0}") %>'
                                        Visible="False" />
                                </li>
                                <br />
                                </li>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                No data was returned.
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <li style="">Job Title:
                                    <asp:TextBox ID="JobTitleTextBox" runat="server" Text='<%# Bind("JobTitle") %>' />
                                    Company:
                                    <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                                    <br />
                                    State:
                                    <cc1:StateDropDownList ID="DropDownListCompanyStateInserting" runat="server" SelectedValue='<%# Bind("SchoolState") %>'>
                                    </cc1:StateDropDownList>
                                    <%--<asp:DropDownList ID="DropDownListCompanyStateInserting" runat="server" SelectedValue='<%# Bind("SchoolState") %>'>
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
                                    </asp:DropDownList>--%>
                                    &nbsp;City:
                                    <asp:TextBox ID="CompanyCityTextBox" runat="server" Text='<%# Bind("CompanyCity") %>' />
                                    <br />
                                    Start Date:
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                                    <ajax:MaskedEditExtender runat="server" TargetControlID="StartDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk1" />
                                    <ajax:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="StartDateTextBox" Format="MM/yyyy">
                                    </ajax:CalendarExtender>
                                    End Date:
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                                    <ajax:MaskedEditExtender runat="server" TargetControlID="EndDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk2" />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                        Text="Current?" />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    <asp:HiddenField ID="ExpIDHidden" runat="server" Value='<%# Eval("ID", "{0}") %>'
                                        Visible="False" />
                                </li>
                            </InsertItemTemplate>
                            <ItemSeparatorTemplate>
                                <br />
                            </ItemSeparatorTemplate>
                            <ItemTemplate>
                                <asp:PlaceHolder runat="server" ID="ItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <li style="background-color: #DCDCDC; color: #000000;">Job Title:
                                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                                    &nbsp;Company:
                                    <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                                    <br />
                                    State:
                                    <asp:Label ID="CompanyStateLabel" runat="server" Text='<%# Eval("CompanyState") %>' />
                                    &nbsp;City:
                                    <asp:Label ID="CompanyCityLabel" runat="server" Text='<%# Eval("CompanyCity") %>' />
                                    <br />
                                    Start Date:
                                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                                    &nbsp;End Date:
                                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                        Enabled="False" Text="Current?" />
                                    <br />
                                    <asp:ListView ID="ListView7a" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAch2"
                                        OnItemDataBound="ListView7a_ItemDataBound">
                                        <AlternatingItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #FFFFFF; color: #284775;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                            </li>
                                        </AlternatingItemTemplate>
                                        <EmptyDataTemplate>
                                            No data was returned.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                            <br />
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #E0FFFF; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                           <%--<div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                                                <asp:DataPager ID="DataPager2" runat="server">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>--%>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSourceAch2" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                                        SelectCommand="SELECT * FROM [Achievements] WHERE ([ExperienceID] = @ExperienceID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ExpIDHidden" Name="ExperienceID" PropertyName="Value"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <asp:HiddenField ID="ExpIDHidden" runat="server" Value='<%# Eval("ID", "{0}") %>'
                                        Visible="False" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <br />
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <span class="failureExpNotification">
                                    <asp:Literal ID="InsertExpFailureText" runat="server"></asp:Literal>
                                    <asp:Literal ID="EditExpFailureText" runat="server"></asp:Literal>
                                </span>
                                <asp:ValidationSummary ID="InsertExpValidationSummary" runat="server" CssClass="failureExpNotification"
                                    ValidationGroup="InsertExpValidationGroup" />
                                <asp:ValidationSummary ID="EditExpValidationSummary" runat="server" CssClass="failureExpNotification"
                                    ValidationGroup="EditExpValidationGroup" />
                                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                                <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;
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
                                </div>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">Job Title:
                                    <asp:Label ID="JobTitleLabel" runat="server" Text='<%# Eval("JobTitle") %>' />
                                    &nbsp;Company:
                                    <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                                    <br />
                                    State:
                                    <asp:Label ID="CompanyStateLabel" runat="server" Text='<%# Eval("CompanyState") %>' />
                                    &nbsp;City:
                                    <asp:Label ID="CompanyCityLabel" runat="server" Text='<%# Eval("CompanyCity") %>' />
                                    <br />
                                    Start Date:
                                    <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
                                    &nbsp;End Date:
                                    <asp:Label ID="EndDateLabel" runat="server" Text='<%# Eval("EndDate") %>' />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Eval("IsCurrent") %>'
                                        Enabled="False" Text="Current" />
                                    <br />
                                    <br />
                                    <asp:ListView ID="ListView7a" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceAch2"
                                        OnItemDataBound="ListView7a_ItemDataBound">
                                        <AlternatingItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="AlternatingItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #E0FFFF; color: #284775;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                <br />
                                            </li>
                                        </AlternatingItemTemplate>
                                        <EmptyDataTemplate>
                                            No data was returned.
                                        </EmptyDataTemplate>
                                        <ItemSeparatorTemplate>
                                            <br />
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #E0FFFF; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <%--<div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                                                <asp:DataPager ID="DataPager2" runat="server">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        <asp:NumericPagerField />
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>--%>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <asp:PlaceHolder runat="server" ID="SelectedItemTemplateDummyPlaceholder1"></asp:PlaceHolder>
                                            <li style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                                                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                            </li>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSourceAch2" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                                        SelectCommand="SELECT * FROM [Achievements] WHERE ([ExperienceID] = @ExperienceID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ExpIDHidden" Name="ExperienceID" PropertyName="Value"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:HiddenField ID="ExpIDHidden" runat="server" Value='<%# Eval("ID", "{0}") %>'
                                        Visible="False" />
                                </li>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSourceExperiences" runat="server" ConnectionString="<%$ ConnectionStrings:usertest1Context %>"
                            DeleteCommand="DELETE FROM [Experiences] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Experiences] ([IsCurrent], [StartDate], [EndDate], [CompanyName], [CompanyState], [CompanyCity], [CompanyCountry], [JobTitle], [UserID]) VALUES (@IsCurrent, @StartDate, @EndDate, @CompanyName, @CompanyState, @CompanyCity, @CompanyCountry, @JobTitle, @UserID)"
                            SelectCommand="SELECT * FROM [Experiences] WHERE ([UserID] = @UserID) ORDER BY [EndDate]"
                            UpdateCommand="UPDATE [Experiences] SET [IsCurrent] = @IsCurrent, [StartDate] = @StartDate, [EndDate] = @EndDate, [CompanyName] = @CompanyName, [CompanyState] = @CompanyState, [CompanyCity] = @CompanyCity, [CompanyCountry] = @CompanyCountry, , [JobTitle] = @JobTitle WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="IsCurrent" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="StartDate" />
                                <asp:Parameter DbType="Date" Name="EndDate" />
                                <asp:Parameter Name="CompanyName" Type="String" />
                                <asp:Parameter Name="CompanyState" Type="String" />
                                <asp:Parameter Name="CompanyCity" Type="String" />
                                <asp:Parameter Name="CompanyCountry" />
                                <asp:Parameter Name="JobTitle" Type="String" />
                                <asp:Parameter Name="UserID" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="IsCurrent" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="StartDate" />
                                <asp:Parameter DbType="Date" Name="EndDate" />
                                <asp:Parameter Name="CompanyName" Type="String" />
                                <asp:Parameter Name="CompanyState" Type="String" />
                                <asp:Parameter Name="CompanyCity" Type="String" />
                                <asp:Parameter Name="CompanyCountry" />
                                <asp:Parameter Name="JobTitle" Type="String" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Education">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        test<br />
                        <asp:ListView ID="ListView5" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSourceEducation"
                            InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView5_SelectedIndexChanged"
                            OnItemDataBound="ListView5_ItemDataBound" OnItemUpdating="ListView5_ItemUpdating"
                            OnItemInserting="ListView5_ItemInserting">
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
                                    <asp:TextBox ID="SchoolNameTextBox" runat="server" Text='<%# Bind("SchoolName") %>'
                                        CausesValidation="true" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="SchoolNameTextBox"
                                        CssClass="failureEducNotification" runat="server" ValidationGroup="EditEducValidationGroup"
                                        ErrorMessage="School Name is required." ToolTip="School Name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <br />
                                    City:
                                    <asp:TextBox ID="SchoolCityTextBox" runat="server" Text='<%# Bind("SchoolCity") %>' />
                                    State:
                                    <cc1:StateDropDownList ID="DropDownListSchoolStateEditing" runat="server" OnSelectedIndexChanged="DropDownListSchoolStateEditing_SelectedIndexChanged">
                                    </cc1:StateDropDownList>
                                    <%--<asp:DropDownList ID="DropDownListSchoolStateEditing" runat="server" OnSelectedIndexChanged="DropDownListSchoolStateEditing_SelectedIndexChanged">
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
                                    </asp:DropDownList>--%>
                                    <%--<asp:TextBox ID="SchoolStateTextBox" runat="server" Text='<%# Bind("SchoolState") %>' />--%>
                                    Country:
                                    <asp:TextBox ID="SchoolCountryTextBox" runat="server" Text='<%# Bind("SchoolCountry") %>' />
                                    <br />
                                    Start Date:
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                                    <%--<ajax:MaskedEditExtender runat="server" TargetControlID="StartDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" ClearTextOnInvalid="false"
                                        ID="sdatemsk1" />--%>
                                    <%--<ajax:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="StartDateTextBox" Format="MM/yyyy">
                                    </ajax:CalendarExtender>--%>
                                    End Date:
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                                    <%--<ajax:MaskedEditExtender runat="server" TargetControlID="EndDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk2" />--%>
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                        Text="Currently Enrolled" />
                                    <br />
                                    Degree Name:
                                    <asp:TextBox ID="DegreeNameTextBox" runat="server" Text='<%# Bind("DegreeName") %>' />
                                    Degree Title:
                                    <asp:TextBox ID="DegreeTitleTextBox" runat="server" Text='<%# Bind("DegreeTitle") %>' />
                                    <br />
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="EditEducValidationGroup" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </span>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <span>No data was returned.</span>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <asp:PlaceHolder runat="server" ID="InsertItemTemplateDummyPlaceholder"></asp:PlaceHolder>
                                <span style="">School Name:
                                    <asp:TextBox ID="SchoolNameTextBox" runat="server" Text='<%# Bind("SchoolName") %>'
                                        CausesValidation="True" />
                                    <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="SchoolNameTextBox"
                                            CssClass="failureEducNotification" runat="server" ValidationGroup="InsertEducValidationGroup"
                                            ErrorMessage="School Name is required." ToolTip="School Name is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                                    </span>
                                    <br />
                                    City:
                                    <asp:TextBox ID="SchoolCityTextBox" runat="server" Text='<%# Bind("SchoolCity") %>' />
                                    State:
                                    <cc1:StateDropDownList ID="DropDownListSchoolStateInserting" runat="server" SelectedValue='<%# Bind("SchoolState") %>'>
                                    </cc1:StateDropDownList>
                                    <%--<asp:DropDownList ID="DropDownListSchoolStateInserting" runat="server" SelectedValue='<%# Bind("SchoolState") %>'>
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
                                    </asp:DropDownList>--%>
                                    <%-- <asp:TextBox ID="SchoolStateTextBox" runat="server" Text='<%# Bind("SchoolState") %>'
                                Width="30px" />--%>
                                    Country:
                                    <asp:TextBox ID="SchoolCountryTextBox" runat="server" Text='<%# Bind("SchoolCountry") %>' />
                                    <br />
                                    Start Date:
                                    <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
                                    <ajax:MaskedEditExtender runat="server" TargetControlID="StartDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk1" />
                                    <ajax:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="StartDateTextBox" Format="MM/yyyy">
                                    </ajax:CalendarExtender>
                                    End Date:
                                    <asp:TextBox ID="EndDateTextBox" runat="server" Text='<%# Bind("EndDate") %>' />
                                    <ajax:MaskedEditExtender runat="server" TargetControlID="EndDateTextBox" Mask="99/9999"
                                        Century="2000" MaskType="Date" ClearMaskOnLostFocus="false" AutoComplete="true"
                                        ID="sdatemsk2" />
                                    <asp:CheckBox ID="IsCurrentCheckBox" runat="server" Checked='<%# Bind("IsCurrent") %>'
                                        Text="Currently Enrolled" />
                                    <br />
                                    Degree Name:
                                    <asp:TextBox ID="DegreeNameTextBox" runat="server" Text='<%# Bind("DegreeName") %>' />
                                    Degree Title:
                                    <asp:TextBox ID="DegreeTitleTextBox" runat="server" Text='<%# Bind("DegreeTitle") %>' />
                                    <br />
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertEducValidationGroup"
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
                                <span class="failureEducNotification">
                                    <asp:Literal ID="InsertEducFailureText" runat="server"></asp:Literal>
                                    <asp:Literal ID="EditEducFailureText" runat="server"></asp:Literal>
                                </span>
                                <asp:ValidationSummary ID="InsertEducValidationSummary" runat="server" CssClass="failureEducNotification"
                                    ValidationGroup="InsertEducValidationGroup" />
                                <asp:ValidationSummary ID="EditEducValidationSummary" runat="server" CssClass="failureEducNotification"
                                    ValidationGroup="EditEducValidationGroup" />
                                <div style="font-family: Verdana, Arial, Helvetica, sans-serif; width: 551px;" id="itemPlaceholderContainer"
                                    runat="server">
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
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
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
        
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
