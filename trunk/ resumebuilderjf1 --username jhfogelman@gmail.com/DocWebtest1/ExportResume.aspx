<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExportResume.aspx.cs" Inherits="DocWebtest1.ExportResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="93px" Visible = "false"
        Width="314px"></asp:TextBox>
    <h2>
        SELECT RESUME FOR EXPORT</h2>
    <p>
        <asp:ListBox ID="ListBoxResumes" runat="server" DataSourceID="SqlDataSourceResumes" 
            DataTextField="Description" DataValueField="ID" Width="322px"></asp:ListBox>
    </p>
<p>
        <asp:SqlDataSource ID="SqlDataSourceResumes" runat="server" 
            ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
            SelectCommand="SELECT * FROM [Resumes] WHERE ([UserID] = @UserID)">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <h2>
        SELECT TEMPLATE FOR RESUME</h2>
    <p>
        <asp:ListBox ID="ListBox2" runat="server" 
            DataSourceID="SqlDataSourceResumeTemplates" DataTextField="TemplateName" 
            DataValueField="ID" Width="318px"></asp:ListBox>
        <asp:SqlDataSource ID="SqlDataSourceResumeTemplates" runat="server" 
            ConnectionString="<%$ ConnectionStrings:usertest1Context %>" 
            SelectCommand="SELECT [TemplateName], [ID] FROM [ResumeTemplates]">
        </asp:SqlDataSource>
    </p>
    <h2>
        SELECT OUTPUT FORMAT</h2>
    <p>
        <asp:ListBox ID="ListBoxOutputFormat" runat="server" Width="308px">
            <asp:ListItem Value="DOCX">Microsoft Word 2010</asp:ListItem>
            <asp:ListItem Enabled="False" Value="DOC">Microsoft Word 2003</asp:ListItem>
            <asp:ListItem Enabled="False">RTF</asp:ListItem>
            <asp:ListItem Enabled="False">HTML</asp:ListItem>
            <asp:ListItem Enabled="False">PDF</asp:ListItem>
        </asp:ListBox>
    </p>
    <h2>
        <br />
    <asp:Button ID="Button2" runat="server" Text="Export Resume" 
        onclick="Button2_Click" />
    </h2>
</asp:Content>
