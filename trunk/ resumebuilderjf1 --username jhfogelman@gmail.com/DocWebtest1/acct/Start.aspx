<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="DocWebtest1.acct.Start" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">


    <div>
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/mainbanner.png" 
            AlternateText="Build Your Resume Today!" 
            ToolTip="Build Your Resume Today!" style="text-align: center" />
        
        
        </div>
        <div>
            <asp:Table ID="Table1" runat="server" style="height: 25px; text-align: center;" BorderStyle="Dotted" 
                Width="75%">
                <asp:TableRow runat="server" BorderStyle="Groove" BorderColor="Black">
                    <asp:TableCell runat="server" HorizontalAlign="Left" Width="30%" BorderStyle="Solid" BorderWidth="1" BorderColor="Black">
                    <div>Log In<br /><br /></div>
                    </asp:TableCell>
                    <asp:TableCell runat="server" HorizontalAlign="Right" Width="30%" BorderStyle="Solid" BorderWidth="1" BorderColor="Black">Register</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    <p style="text-align: center">
        <strong>Username&nbsp;
        <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
        </strong>
        <br />
        <strong>Password&nbsp;&nbsp;
        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="LoginCheck" />
        <br />
        <asp:Label ID="lblValidated" runat="server"></asp:Label>
        </strong>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

