<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaveAllotments.aspx.cs" Inherits="LMS48.LeaveAllotments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display:grid; grid-template-columns: min-content auto">
        <div>
            <div class="LeaveButtons">
                 <div>
                    <asp:Button ID="Vacationbtn" runat="server" Text="Sick Leave" CssClass="leavebtn"/></div>
                <div>
                    <asp:Button ID="Departmentbtn" runat="server" Text="Vacation Leave" CssClass="leavebtn"/>
                </div>
                <div>
                    <asp:Button ID="Sickbtn" runat="server" Text="Department Leave" CssClass="leavebtn"/>
                </div>
                <div>
                    <asp:Button ID="Personalbtn" runat="server" Text="Personal Leave" CssClass="leavebtn"/>
                </div>
            </div>            
        </div>
        <div style="background:red">
            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="Column1" />
                    <asp:BoundField HeaderText="Column2" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
