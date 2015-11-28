<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Glowna.aspx.cs" Inherits="projekt.Glowna" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loguj</title>
    <link rel="stylesheet" href="glowna.css" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="content">
           
            <div id="zaloguj">
                Zaloguj się
            </div>


            <div id="login">
                Login:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxLogin" runat="server" 
                    Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxLogin" ErrorMessage="* Wymagane pole" 
                    ForeColor="Red" Font-Size="14px"></asp:RequiredFieldValidator>
            </div>


            <div id="haslo">
                Hasło:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxHaslo" 
                    runat="server" TextMode="Password" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBoxHaslo" ErrorMessage="* Wymagane pole" 
                    ForeColor="Red" Font-Size="14px"></asp:RequiredFieldValidator>
            </div>


            <div id="przycisk">
                <asp:Button ID="ButtonZaloguj" runat="server" onclick="ButtonZaloguj_Click" 
                    Text="Zaloguj" Height="30px" style="margin-left: 0px" Width="127px" />
            </div>


            <div id="error">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                    Text="* Logowanie nieudane. Spróbuj jeszcze raz." Visible="False"></asp:Label>
            </div>
        </div>   
    </div>
    </form>
</body>
</html>
