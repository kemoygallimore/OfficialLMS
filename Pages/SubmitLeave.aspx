<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitLeave.aspx.cs" Inherits="LMS48.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Employee ID"></asp:Label>
            <asp:TextBox ID="EmpIdTextbx" runat="server"></asp:TextBox>
            <asp:Button ID="CheckID" runat="server" Text="Verify ID" OnClick="CheckID_Click" />
        </div>
        <div>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Employee Name"></asp:Label>
                <asp:TextBox ID="EmpNameTxtBx" runat="server" ReadOnly="true"></asp:TextBox><asp:Label ID="EmpDatabaseId" runat="server" Text="Label" Visible="false"></asp:Label>
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Leave Type"></asp:Label>
                <asp:DropDownList ID="LeaveTypeDrowpdown" runat="server"></asp:DropDownList>
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Start Date"></asp:Label>
                <asp:TextBox ID="SdateTxtBx" runat="server"></asp:TextBox>  <asp:ImageButton ID="SimageButton" runat="server" OnClick="SimageButton_Click" />
                <asp:Panel ID="Spanel" runat="server" Visible="false" CssClass="CalenderPanels">
                    <asp:Calendar ID="SdateCalendar" runat="server" OnSelectionChanged="SdateCalendar_SelectionChanged" Visible="False"></asp:Calendar>
                </asp:Panel>
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label5" runat="server" Text="End Date"></asp:Label>
                <asp:TextBox ID="EdateTxtBx" runat="server"></asp:TextBox>  <asp:ImageButton ID="EimageButton" runat="server" OnClick="EimageButton_Click" />
                <asp:Panel ID="Epanel" runat="server" Visible="false" CssClass="CalenderPanels">
                    <asp:Calendar ID="EdateCalendar" runat="server" OnSelectionChanged="EdateCalendar_SelectionChanged"></asp:Calendar>
                </asp:Panel>
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label6" runat="server" Text="Number of Days: "></asp:Label>  <asp:Label ID="numdayslbl" runat="server" Text="Label" Visible="false"></asp:Label>
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label8" runat="server" Text="Attachments"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </p>
        </div>
        <div>
            <p>
                <asp:Label ID="Label9" runat="server" Text="Additional Comments"></asp:Label>
                <asp:TextBox ID="CommentstxtBx" runat="server"></asp:TextBox>
            </p>
        </div>
        <div>
            <p>
                <asp:Button ID="Submitbtn" runat="server" Text="Submit" OnClick="Submitbtn_Click"/><asp:Button ID="Clearbtn" runat="server" Text="Clear" OnClick="Clearbtn_Click"/>
            </p>
        </div>
    </div>
    
</asp:Content>
