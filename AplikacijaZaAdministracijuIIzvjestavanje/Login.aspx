<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AplikacijaZaAdministracijuIIzvjestavanje.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Login</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Custom.css" rel="stylesheet" />
</head>
<body style="background-color: gray;">

        <div class="container" style="width:40%">
            <div class="jumbotron" style="margin-top:20%; background-color:yellow">
                 <form runat="server" style="color: black; background-color: black; margin-top: 2rem;">
                     <h2 style="color:white; text-align:center ">Login</h2>
                                 <div class="form-group text-center" style="color: black;"/>
                <asp:RequiredFieldValidator ErrorMessage="Krivi E-mail" ControlToValidate="emaillog" runat="server" ForeColor="Red" />
                <asp:TextBox runat="server" ID="emaillog" class="form-control" type="email" name="email" placeholder="Email" Style="background-color: white;" />
                                     <div class="form-group"/>
                    <asp:RequiredFieldValidator ErrorMessage="Kriva zaporka" ControlToValidate="passlog" runat="server" ForeColor="Red" />
                    <asp:TextBox runat="server" ID="passlog" class="form-control" type="password" name="password" placeholder="Password" Style="background-color: white; color: rgb(3,3,3); margin-bottom: 1rem" />
                                         <div class="form-group"/>
                        <asp:ValidationSummary runat="server" ForeColor="Red" />
                        <asp:Button ID="dalje" Text="Log in" runat="server" OnClick="btnDalje_Click" class="btn btn-danger btn-block" type="submit" Style="background-color: red; color: black" />
                        <asp:Label Text="" ID="validationlog" runat="server" Style="margin-top: 2rem; margin-left: 2rem" />
                 </form>
            </div>
        </div>
</body>
</html>
