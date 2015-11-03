<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Glowna.aspx.cs" Inherits="projekt.Glowna" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loguj</title>
    <link rel="stylesheet" href="StyleSheet1.css" type="text/css"/>
</head>
<body bgcolor="Silver" style="text-align: left">
    <form id="form1" runat="server">
    <div id="content">   
        Zaloguj się<br />
        Login:<asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBoxLogin" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Hasło:<asp:TextBox ID="TextBoxHaslo" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBoxHaslo" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="ButtonZaloguj" runat="server" onclick="ButtonZaloguj_Click" 
            Text="Zaloguj" />
    
        <br />
        <asp:Label ID="Label1" runat="server" ForeColor="Red" 
            Text="* Logowanie nieudane. Spróbuj jeszcze raz." Visible="False"></asp:Label>
    
    </div>
    </form>
</body>
</html>
