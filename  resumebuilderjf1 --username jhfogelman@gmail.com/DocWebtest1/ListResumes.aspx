<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListResumes.aspx.cs" Inherits="DocWebtest1.ListResumes" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h2>
                RESUMES</h2>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                    DataSourceID="SqlDataSourceResumes" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    style="margin-right: 168px" Width="356px" 
                    onrowcreated="GridView1_RowCreated" onrowdatabound="GridView1_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="Description" HeaderText="Resume Name" 
                            SortExpression="Description" />
                        <asp:HyperLinkField DataTextField="Description" 
                            NavigateUrl="~/CreateResume.aspx" SortExpression="Description" 
                            Text="Resume Name" />
                    </Columns>
                    <EmptyDataTemplate>
                        No current resumes exist - please create one!
                    </EmptyDataTemplate>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceResumes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
                    DeleteCommand="DELETE FROM [Resumes] WHERE [ID] = @ID" 
                    InsertCommand="INSERT INTO [Resumes] ([ObjectiveID], [UserID], [PhoneID], [EmailID], [AddressID], [SkillsID], [Description]) VALUES (@ObjectiveID, @UserID, @PhoneID, @EmailID, @AddressID, @SkillsID, @Description)" 
                    SelectCommand="SELECT * FROM [Resumes] WHERE ([UserID] = @UserID)" 
                    
                    UpdateCommand="UPDATE [Resumes] SET [ObjectiveID] = @ObjectiveID, [UserID] = @UserID, [PhoneID] = @PhoneID, [EmailID] = @EmailID, [AddressID] = @AddressID, [SkillsID] = @SkillsID, [Description] = @Description WHERE [ID] = @ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ObjectiveID" Type="Int32" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                        <asp:Parameter Name="PhoneID" Type="Int32" />
                        <asp:Parameter Name="EmailID" Type="Int32" />
                        <asp:Parameter Name="AddressID" Type="Int32" />
                        <asp:Parameter Name="SkillsID" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ObjectiveID" Type="Int32" />
                        <asp:Parameter Name="UserID" Type="Int32" />
                        <asp:Parameter Name="PhoneID" Type="Int32" />
                        <asp:Parameter Name="EmailID" Type="Int32" />
                        <asp:Parameter Name="AddressID" Type="Int32" />
                        <asp:Parameter Name="SkillsID" Type="Int32" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                <a href="CreateResume.aspx">Create New Resume</a></p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>
