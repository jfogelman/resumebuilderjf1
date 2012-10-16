<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddResumeInfo.aspx.cs" Inherits="DocWebtest1.AddResumeInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
        BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
        Height="215px" Width="251px" 
        onfinishbuttonclick="Wizard1_FinishButtonClick">
    <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
        BorderWidth="2px" Font-Bold="True" Font-Size="1.2em" ForeColor="White" 
        HorizontalAlign="Center" />
    <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
        ForeColor="#284E98" />
    <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
        ForeColor="White" />
    <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
    <StepStyle Font-Size="0.8em" ForeColor="#333333" />
    <WizardSteps>
        <asp:WizardStep ID="WizardStep1" runat="server" Title="Contact Information">
            <asp:Label ID="Label1" runat="server" Text="Label">sdasdasdasdasdasd   </asp:Label>
            d<br />
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

