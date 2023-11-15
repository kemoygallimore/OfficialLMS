<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="LookupLeave.aspx.cs" Inherits="LMS48.LookupLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Leave Lookup</h1>
    <div style="display:grid;grid-template-columns:auto auto auto">
        <div class="ting"> 
            <asp:Label ID="Label1" runat="server" Text="Leave Type"></asp:Label>
            <asp:DropDownList ID="LeaveTypeDropdown" runat="server" OnSelectedIndexChanged="LeaveTypeDropdown_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
            <span>
                <asp:TextBox ID="Sdatetxtbx" runat="server" CssClass="textcal" OnTextChanged="Sdatetxtbx_TextChanged"></asp:TextBox>
                <asp:ImageButton ID="sbutton" runat="server" OnClick="sbutton_Click" ImageUrl="~/Assets/img/calendar.png" Height="22px" Width="22px" />
            </span>            
            <asp:Panel ID="SPanel" runat="server" Visible="false" CssClass="CalenderPanels">
                <asp:Calendar ID="sdatecal" runat="server" OnSelectionChanged="sdatecal_SelectionChanged" ></asp:Calendar>
            </asp:Panel>
        </div>
        <div class="ting">
            <asp:Label ID="Label2" runat="server" Text="Leave Status"></asp:Label>
            <asp:DropDownList ID="LeaveStatusDropdown" runat="server" OnSelectedIndexChanged="LeaveStatusDropdown_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
            <span>
                <asp:TextBox ID="Edatetxtbx" runat="server" CssClass="textcal" OnTextChanged="Edatetxtbx_TextChanged"></asp:TextBox>
                <asp:ImageButton ID="ebutton" runat="server" OnClick="ebutton_Click" ImageUrl="~/Assets/img/calendar.png" Height="22px" Width="22px" />
            </span>
            <asp:Panel ID="EPanel" runat="server" Visible="false" CssClass="CalenderPanels">
                <asp:Calendar ID="edatecal" runat="server" OnSelectionChanged="edatecal_SelectionChanged"></asp:Calendar>
            </asp:Panel>
        </div>

        <div>
            <p>
                <asp:Button ID="Submitbtn" runat="server" Text="Submit" OnClick="Submitbtn_Click"/>
            </p>
            <p>
                <asp:Button ID="Clearbtn" runat="server" Text="Clear" OnClick="Clearbtn_Click" />
            </p>
        </div>
    </div>
    <div>
        <asp:GridView ID="leaveRequestGV" runat="server" Width="95%" AutoGenerateColumns="false" BorderStyle="None">
            <AlternatingRowStyle BackColor="#016595" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="#" />
                <asp:BoundField DataField="EmployeeID" HeaderText="ID" />
                <asp:BoundField DataField="Full Name" HeaderText="Name" />
                <asp:BoundField DataField="type" HeaderText="Type" />
                <asp:BoundField DataField="SubmissionDate" HeaderText="Date Submitted" DataFormatString="{0:MMM/dd/yyyy}" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MMM/dd/yyyy}"/>
                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MMM/dd/yyyy}"/>
                <asp:BoundField DataField="TotalDays" HeaderText="Days" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                
            </Columns>

<HeaderStyle CssClass="gridheader"></HeaderStyle>
        </asp:GridView>
    </div>
</asp:Content>