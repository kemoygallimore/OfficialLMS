<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelLeave.aspx.cs" Inherits="LMS48.CancelLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div style="display:grid;grid-template-columns: min-content auto">
        <div>
            
            <div class="upperFormEntries">
                <div>
                    <asp:Label ID="Label8" runat="server" Text="Leave ID"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Label" Visible="false"></asp:Label>
                </div>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="Leave Type"></asp:Label>
                </div>
                <div>
                    <asp:DropDownList ID="LeaveTypeDropdown" runat="server"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="Sdatetxtbx" runat="server" CssClass="textcal"></asp:TextBox>
                    <asp:ImageButton ID="sbutton" runat="server" OnClick="sbutton_Click" ImageUrl="~/Assets/img/calendar.png" />
                    <asp:Panel ID="SPanel" runat="server" Visible="false" CssClass="CalenderPanels">
                        <asp:Calendar ID="sdatecal" runat="server" OnSelectionChanged="sdatecal_SelectionChanged" ></asp:Calendar>
                    </asp:Panel>
                </div>
                <div>
                    <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="Edatetxtbx" runat="server" CssClass="textcal"></asp:TextBox>
                    <asp:ImageButton ID="ebutton" runat="server" OnClick="ebutton_Click" ImageUrl="~/Assets/img/calendar.png" />
                    <asp:Panel ID="EPanel" runat="server" Visible="false" CssClass="CalenderPanels">
                        <asp:Calendar ID="edatecal" runat="server" OnSelectionChanged="edatecal_SelectionChanged"></asp:Calendar>
                    </asp:Panel>
                </div>
            </div>
            <div>
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Attachments"></asp:Label>
                </div>
                <div>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
            
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Additional Comments"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="Commentstxtbx" runat="server" Columns="30" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="submit_clear_btn">
                    <asp:Button ID="Updatebtn" runat="server" Text="Update" OnClick="Updatebtn_Click" />
                    <asp:Button ID="CancelBtn" runat="server" Text="Cancel" OnClick="CancelBtn_Click" />
                </div>
                    
            </div>
        </div>
        <div>
            <p>
                <asp:Label ID="Label6" runat="server" Text="Cancellation Reason"></asp:Label><asp:DropDownList ID="CancelReasonDropdown" runat="server"></asp:DropDownList>
            </p>
            <p>
                <asp:GridView ID="AllRequestsGridview" runat="server" AutoGenerateColumns="False" Width="100%" BorderStyle="None" OnSelectedIndexChanged="AllRequestsGridview_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#016595" />                    
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="#" />
                        <asp:BoundField DataField="SubmissionDate" HeaderText="Date Submitted" DataFormatString="{0:MMM/dd/yyyy}" />
                        <asp:BoundField DataField="EmployeeID" HeaderText="ID#" />
                        <asp:BoundField DataField="Full Name" HeaderText="Name" />
                        <asp:BoundField DataField="type" HeaderText="Type" />
                        <asp:BoundField DataField="status" HeaderText="Status" />

                        <asp:CommandField ShowSelectButton="True" />

                    </Columns>
                    <HeaderStyle CssClass="gridheader"></HeaderStyle>
                </asp:GridView>
            </p>
        </div>
    </div>
    
</asp:Content>
