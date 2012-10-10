<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicProfile.aspx.cs" Inherits="DocWebtest1.BasicProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        EDIT YOUR PROFILE</h2>
    <p>
        <strong>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                <strong>First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                <br />
                Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                </strong>
            </p>
            <p>
                <strong>Preferred Display Name:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="tbDisplayName" runat="server" Width="124px"></asp:TextBox>
                </strong>
            </p>
            <asp:Button ID="bUpdate" runat="server" CommandName="Update" onclick="bUpdate_Click" OnCommand="bUpdate_Command" Text="Update Profile" Width="131px" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            d</strong>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <br />
        <br />
        &nbsp;&nbsp;
        </strong>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
