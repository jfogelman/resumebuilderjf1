<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExportResume.aspx.cs" Inherits="DocWebtest1.ExportResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="93px" 
        Width="314px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    <asp:Button ID="Button2" runat="server" Text="WordOut" 
        onclick="Button2_Click" />
</asp:Content>
