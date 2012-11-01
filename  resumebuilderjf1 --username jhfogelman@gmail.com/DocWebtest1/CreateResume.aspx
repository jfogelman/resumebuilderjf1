<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateResume.aspx.cs" Inherits="DocWebtest1.CreateResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label ID="LabelPageHeader" runat="server" Text="Create New Resume"></asp:Label>
        <br />
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    </h2>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <strong>
                </strong>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="ValidationGroupResumeName" />
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <p>
                <asp:Label ID="Label1" runat="server" Text="Resume Name: "></asp:Label>
                </strong>&nbsp;<strong><asp:TextBox ID="tbResumeName" runat="server" CausesValidation="true"></asp:TextBox>
                </strong>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorResumeName" runat="server" 
                    ErrorMessage="Resume Name is Required" ControlToValidate="tbResumeName" Display="Dynamic"
                    ValidationGroup="ValidationGroupResumeName" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="UniqueResumeName" runat="server"
                 ErrorMessage="Resume name is already in use" ControlToValidate="tbResumeName"
                    ValidationGroup="ValidationGroupResumeName" ForeColor="Red" 
                    onservervalidate="UniqueResumeName_ServerValidate">*</asp:CustomValidator>
            </p>
            <p>
                &nbsp;Add Phone Numbers</p>
            <p>
                <asp:GridView ID="GridViewPhones" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSourcePhones" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="290px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="PhnDesc" HeaderText="Label" 
                            SortExpression="PhnDesc" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Number" 
                            SortExpression="PhoneNumber" />
                        <asp:TemplateField HeaderText="Selected">
                            <ItemStyle Font-Bold="True" ForeColor="#00CC00"  HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourcePhones" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    SelectCommand="SELECT * FROM [Phones] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                Email Addresses</p>
            <p>
                <asp:GridView ID="GridViewEmails" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSourceEmails" 
                    onselectedindexchanged="GridViewEmails_SelectedIndexChanged" Width="349px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="EmailDesc" HeaderText="Label" 
                            SortExpression="EmailDesc" />
                        <asp:BoundField DataField="EmailText" HeaderText="Email" 
                            SortExpression="EmailText" />
                        <asp:TemplateField HeaderText="Selected">
                            <ItemStyle Font-Bold="True" ForeColor="#00CC00" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceEmails" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    SelectCommand="SELECT * FROM [Emails] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                Addresses</p>
            <p>
                <asp:GridView ID="GridViewAddresses" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="SqlDataSourceAddresses" Width="456px" 
                    onselectedindexchanged="GridViewAddresses_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="AddrDesc" HeaderText="Label" 
                            SortExpression="AddrDesc" />
                        <asp:BoundField DataField="Street1" HeaderText="Street" 
                            SortExpression="Street1" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:TemplateField HeaderText="Selected">
                            <ItemStyle Font-Bold="True" ForeColor="#00CC00" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceAddresses" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    SelectCommand="SELECT * FROM [Addresses] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                Work History</p>
            <p>
                <asp:GridView ID="GridViewExperiences" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="SqlDataSourceExperiences" 
                    onselectedindexchanged="GridViewExperiences_SelectedIndexChanged" Width="515px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="StartDate" DataFormatString="{0:MM/yyyy}" 
                            HeaderText="Start Date" SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" DataFormatString="{0:MM/yyyy}" 
                            HeaderText="End Date" SortExpression="EndDate" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company" 
                            SortExpression="CompanyName" />
                        <asp:BoundField DataField="JobTitle" HeaderText="Job Title" 
                            SortExpression="JobTitle" />
                        <asp:TemplateField HeaderText="Selected">
                        <ItemStyle Font-Bold="True" ForeColor="#00CC00"  HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceExperiences" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    SelectCommand="SELECT * FROM [Experiences] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                Education<asp:GridView ID="GridViewEducations" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="SqlDataSourceEducations" 
                    onselectedindexchanged="GridViewEducations_SelectedIndexChanged" Width="446px">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="SchoolName" HeaderText="School" 
                            SortExpression="SchoolName" />
                        <asp:BoundField DataField="DegreeName" HeaderText="Degree Name" 
                            SortExpression="DegreeName" />
                        <asp:BoundField DataField="DegreeTitle" HeaderText="Degree Title" 
                            SortExpression="DegreeTitle" />
                        <asp:TemplateField HeaderText="Selected">
                        <ItemStyle Font-Bold="True" ForeColor="#00CC00"  HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceEducations" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    SelectCommand="SELECT * FROM [Educations] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                <asp:Button ID="bCreateNewResume" runat="server"  CausesValidation="true" ValidationGroup="ValidationGroupResumeName" 
                    onclick="bCreateNewResume_Click" Text="Create New Resume" />
                <asp:Button ID="bUpdateResume" runat="server"
                    Text="Update Resume"  Visible ="false" 
                    Width="161px" onclick="bUpdateResume_Click"/>

            </p>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
