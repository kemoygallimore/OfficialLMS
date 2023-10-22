<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveRequests.aspx.cs" Inherits="LMS48.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="UpdateSection">
            
                <p>
                    LeaveID: <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                </p>
                <div>
                    <span>Name</span>
                    <asp:TextBox ID="NameTxtBx" runat="server"></asp:TextBox>
                </div>
                <div>
                    <span>Status</span>
                    <asp:DropDownList ID="LeaveStatusDropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="LeaveStatusDropdown_SelectedIndexChanged"></asp:DropDownList>
                </div>
                
                <div class="submit_clear_btn">
                    <asp:Button ID="Updatebtn" runat="server" Text="Update" OnClick="Updatebtn_Click" />
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" />
                </div>
           
        </div>
        <div>
            <asp:GridView ID="LeaveRequestsGV" runat="server" AutoGenerateColumns="False" Width="95%" OnSelectedIndexChanged="LeaveRequestsGV_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="#" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="ID" />
                    <asp:BoundField DataField="Full Name" HeaderText="Name" />
                    <asp:BoundField DataField="type" HeaderText="leave Type" DataFormatString="{0:MMM/dd/yyyy}"/>
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MMM/dd/yyyy}"/>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MMM/dd/yyyy}" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div>
        <p>
            
        </p>
    </div>

</asp:Content>
