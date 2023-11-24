<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="LMS48.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Styles/sweetalert.css" rel="stylesheet" />
<script src="Scripts/sweetalert.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="Loginbg">
            <div>
                <div class="loginbox">
                    <h2>LEAVE MANAGEMENT SYSTEM</h2>
                    <div class="entryfields">
                        <div class="LoginFields">
                            <asp:TextBox ID="Usernametxtbx" runat="server" placeholder="Username" CausesValidation="False" ValidationGroup="vg"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username field cannot be empty" ControlToValidate="Usernametxtbx" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="LoginFields">
                            <asp:TextBox ID="Passwordtxtbx" runat="server" Placeholder="Password" ControlToValidate="Passwordtxtbx" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password field cannot be empty" ControlToValidate="Passwordtxtbx" ForeColor="Red">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </div>
                    <div>
                        <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="loginbtn_Click" />
                    </div>
                    <!--<div><a>Forgot Password</a></div>-->
                </div>
            </div>
        </div>
    </form>
</body>
</html>
