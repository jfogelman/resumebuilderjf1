<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="DocWebtest1._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        &nbsp;</h2>
    <p>
        Step 1:</p>
    <p>
        <asp:HyperLink ID="hlStep1" runat="server" NavigateUrl="~/BasicProfile.aspx">Enter Basic Profile Information</asp:HyperLink>
    </p>
    <p>
        Step 2:</p>
    <p>
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddResumeInfo.aspx">Add Resume Information</asp:HyperLink>
        </p>
    <p>
        Step 3:</p>
<p>
        <a href="ListResumes.aspx">Build Resume</a></p>
<p>
        Step 4:</p>
    <p>
        Choose Resume Template</p>
    <p>
        Step 5:</p>
    <p>
        Export Resume</p>
</asp:Content>
