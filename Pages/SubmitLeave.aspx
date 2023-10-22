<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmitLeave.aspx.cs" Inherits="LMS48.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="upperFormEntries">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Employee ID"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="EmpIdTextbx" runat="server"></asp:TextBox>
            <asp:Button ID="CheckID" runat="server" Text="Verify ID" OnClick="CheckID_Click" />
        </div>
        <div>
             <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="EmpNameTxtBx" runat="server" ReadOnly="true"></asp:TextBox>
            <asp:Label ID="EmpDatabaseId" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Leave Type"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="LeaveTypeDrowpdown" runat="server"></asp:DropDownList>
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Start Date"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="SdateTxtBx" runat="server" CssClass="textcal"></asp:TextBox>
            <asp:ImageButton ID="SimageButton" runat="server" OnClick="SimageButton_Click" ImageUrl="~/Assets/img/calendar.png" />
            <asp:Panel ID="Spanel" runat="server" Visible="false" CssClass="CalenderPanels">
                <asp:Calendar ID="SdateCalendar" runat="server" OnSelectionChanged="SdateCalendar_SelectionChanged"></asp:Calendar>
            </asp:Panel>
        </div>
        <div>
            <asp:Label ID="Label5" runat="server" Text="End Date"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="EdateTxtBx" runat="server" CssClass="textcal"></asp:TextBox> 
            <asp:ImageButton ID="EimageButton" runat="server" OnClick="EimageButton_Click" ImageUrl="~/Assets/img/calendar.png" />
            <asp:Panel ID="Epanel" runat="server" Visible="false" CssClass="CalenderPanels">
                <asp:Calendar ID="EdateCalendar" runat="server" OnSelectionChanged="EdateCalendar_SelectionChanged"></asp:Calendar>
            </asp:Panel>
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="# of Days: "></asp:Label>  
        </div>
        <div>
            <asp:Label ID="numdayslbl" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label8" runat="server" Text="Attachments"></asp:Label>
        </div>
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </div>
    </div>
    <div style="padding-top:15px">

    </div>
    <div class="lowerFormEntries">
        <div>
            <asp:Label ID="Label9" runat="server" Text="Additional Comments"></asp:Label>
        </div>
        <div>
            <asp:TextBox ID="CommentstxtBx" runat="server"></asp:TextBox>
        </div>
        <div>
    
        </div>
        <div class="submit_clear_btn">
            <asp:Button ID="Submitbtn" runat="server" Text="Submit" OnClick="Submitbtn_Click"/><asp:Button ID="Clearbtn" runat="server" Text="Clear" OnClick="Clearbtn_Click"/>
        </div>
    </div>
    <div>
        <div>
            <p>
                
            </p>
        </div>
    </div>
    
</asp:Content>
