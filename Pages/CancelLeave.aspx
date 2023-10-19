<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelLeave.aspx.cs" Inherits="LMS48.CancelLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cancel Leave</h1>
    <div>
        <div style="display:grid;grid-template-columns: 1fr 2fr">
            <div>
                <p>
                    <asp:Label ID="Label2" runat="server" Text="Leave Type"></asp:Label>
                    <asp:DropDownList ID="LeaveTyppeDropdown" runat="server"></asp:DropDownList>
                </p>
                <p>
                    <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                    <asp:TextBox ID="Sdatetxtbx" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="sbutton" runat="server" OnClick="sbutton_Click" />
                    <asp:Calendar ID="sdatecal" runat="server" OnSelectionChanged="sdatecal_SelectionChanged" Visible="false"></asp:Calendar>
                </p>
                <p>
                    <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
                    <asp:TextBox ID="Edattxtbx" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ebutton" runat="server" OnClick="ebutton_Click" />
                    <asp:Calendar ID="edatecal" runat="server" OnSelectionChanged="edatecal_SelectionChanged" Visible="false"></asp:Calendar>
                </p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Attachments"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </p>
                <p>
                    <asp:Label ID="Label5" runat="server" Text="Additional Comments"></asp:Label>
                    <span style="display:block"><asp:TextBox ID="Commentstxtbx" runat="server" Columns="30" Rows="5" TextMode="MultiLine"></asp:TextBox></span>
                </p>
            </div>
            <div>
                <p>
                    <asp:Label ID="Label6" runat="server" Text="Cancellation Reason"></asp:Label><asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                </p>
                <p>
                    <asp:GridView ID="AllRequestsGridview" runat="server" AutoGenerateColumns="False" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="#" />
                            <asp:BoundField DataField="EmployeeID" HeaderText="ID#" />
                            <asp:BoundField DataField="Full Name" HeaderText="Name" />
                            <asp:BoundField DataField="type" HeaderText="Type" />
                            <asp:BoundField DataField="status" HeaderText="Status" />

                            <asp:CommandField ShowSelectButton="True" />

                        </Columns>
                    </asp:GridView>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
