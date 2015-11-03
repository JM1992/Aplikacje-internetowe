<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uczen.aspx.cs" Inherits="projekt.uczen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Uczen</title>
</head>
<body bgcolor="#c0c0c0">
    <form id="form1" runat="server">
    <div>
        <div>
            INFORMACJE<br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            Uczeń<br />
            E-mail:
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            Login:
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/haslo.aspx">Zmień hasło</asp:HyperLink>
        </div>

        <br/>

        <div>

            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>

        </div>
    </div>
    </form>
</body>
</html>
