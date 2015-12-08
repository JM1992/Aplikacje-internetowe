<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="haslo.aspx.cs" Inherits="projekt.haslo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title>Hasło</title>
    <link rel="stylesheet" href="Style.css" type="text/css"/>
</head>



<body>
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="naglowek">
            INFORMACJE<br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            E-mail:
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            Login:
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server">Wróć</asp:HyperLink>
        </div>


        <div class="ramka">
            Zmiana hasła<br />
            Aktualne hasło:
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Nowe hasło:
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="* Wymagane pole" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Powtórz hasło:
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox3" ControlToValidate="TextBox2" 
                ErrorMessage="* Hasła muszą być identyczne" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Zmień" />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
