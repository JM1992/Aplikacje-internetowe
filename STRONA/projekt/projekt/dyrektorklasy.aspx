<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektorklasy.aspx.cs" Inherits="projekt.dyrektorklasy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#c0c0c0">
    <form id="form1" runat="server">
    <div>
        <div>
            INFORMACJE<br />
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
            Dyrektor<br />
            E-mail:
            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            <br />
            Login:
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/haslo.aspx">Zmień hasło</asp:HyperLink>
        </div>

        <br/>

        <div>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/dyrektor.aspx">Nauczyciele</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/dyrektoruczniowie.aspx">Uczniowie</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/dyrektorklasy.aspx">Klasy</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/dyrektorlekcje.aspx">Lekcje</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>

        <br />
        
        <div>

            Dodaj klasy<br />
            Nazwa:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Dodaj" />
            <br />
            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>

        </div>
    </div>
    </form>
</body>
</html>
