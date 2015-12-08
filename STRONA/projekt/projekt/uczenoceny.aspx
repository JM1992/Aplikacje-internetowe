<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uczenoceny.aspx.cs" Inherits="projekt.uczenoceny" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
    <title>Uczeń</title>
    <link rel="stylesheet" href="Style.css" type="text/css"/>
</head>



<body>
    <form id="form1" runat="server">
    <div class="container">      
        <div class="naglowek">
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
            Klasa:
            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/haslo.aspx">Zmień hasło</asp:HyperLink>
        </div>


        <div class="menu">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/uczen.aspx">Przedmioty</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/uczenoceny.aspx">Oceny</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>


        <div class="ramka">           
            Wybierz przedmiot:
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Nazwa" 
                DataValueField="ID_Przedmiot">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                SelectCommand="SELECT PRZEDMIOT.Nazwa,PRZEDMIOT.ID_Przedmiot FROM LEKCJA,PRZEDMIOT WHERE LEKCJA.ID_Uczen=@iduczen AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot">
                <SelectParameters>
                    <asp:SessionParameter Name="iduczen" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Wybierz" 
                onclick="Button1_Click" />           
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
        </div>


        <div class="ramka">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
