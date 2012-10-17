<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddResumeInfo.aspx.cs" Inherits="DocWebtest1.AddResumeInfo" %>

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
                Add CONtact info</h2>
    <p>
        <strong>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                SelectCommand="SELECT * FROM [Emails] WHERE ([UserID] = @UserID)" 
                DeleteCommand="DELETE FROM [Emails] WHERE [ID] = @ID" 
                InsertCommand="INSERT INTO [Emails] ([EmailText], [EmailDesc], [UserID]) VALUES (@EmailText, @EmailDesc, @UserID)" 
                UpdateCommand="UPDATE [Emails] SET [EmailText] = @EmailText, [EmailDesc] = @EmailDesc, [UserID] = @UserID WHERE [ID] = @ID">
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
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
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
                            <asp:DynamicControl runat="server" DataField="EmailText" Mode="ReadOnly" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailDesc" Mode="ReadOnly" />
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
                            <asp:DynamicControl runat="server" DataField="EmailText" Mode="Edit" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailDesc" Mode="Edit" />
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
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" 
                                ValidationGroup="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailText" Mode="Insert" 
                                ValidationGroup="Insert" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailDesc" Mode="Insert" 
                                ValidationGroup="Insert" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="UserID" Mode="Insert" 
                                ValidationGroup="Insert" />
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
                            <asp:DynamicControl runat="server" DataField="EmailText" Mode="ReadOnly" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailDesc" Mode="ReadOnly" />
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
                                            Email Address</th>
                                        <th runat="server">
                                            Label (Optional)</th>
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
                            <asp:DynamicControl runat="server" DataField="EmailText" Mode="ReadOnly" />
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="EmailDesc" Mode="ReadOnly" />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <br />
            <br />
            <br />
            <asp:Button ID="bUpdate" runat="server" CommandName="Update" onclick="bUpdate_Click" OnCommand="bUpdate_Command" Text="Update Profile" Width="131px" />
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

