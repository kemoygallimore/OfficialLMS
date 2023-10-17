<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CancelLeave.aspx.cs" Inherits="LMS48.CancelLeave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Cancel Leave</h1>
    <div>
        <div style="display:grid;grid-template-columns: 1fr 3fr">
            <div>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <span>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" />
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </span>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <span>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" />
                    <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
                </span>            
            </div>
            <div>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
            <div>
                <div><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></div>
                <div>
                    <asp:TextBox ID="TextBox4" runat="server" Columns="30" Rows="5" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
        <div>
            <div>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label><asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
