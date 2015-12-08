<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nauczyciel.aspx.cs" Inherits="projekt.nauczyciel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title>Nauczyciel</title>
    <link rel="stylesheet" href="Style.css" type="text/css"/>
</head>



<body>
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="naglowek">        
            INFORMACJE<br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            Nauczyciel<br />
            E-mail:
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            Login:
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/haslo.aspx">Zmień hasło</asp:HyperLink>        
        </div>


        <div class="menu">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/nauczyciel.aspx">Zajęcia</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/oceny.aspx">Oceny</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/nauczycielsprawdzoceny.aspx">Sprawdź oceny</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>


        <div class="ramka">
        
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" 
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Przedmiot" HeaderText="Przedmiot" 
                        SortExpression="Przedmiot" />
                    <asp:BoundField DataField="Klasa" HeaderText="Klasa" 
                        SortExpression="Klasa" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                
                SelectCommand="SELECT DISTINCT PRZEDMIOT.Nazwa AS Przedmiot,KLASA.Nazwa AS Klasa FROM LEKCJA,PRZEDMIOT,UCZEN,KLASA WHERE LEKCJA.ID_Nauczyciel=@idnauczyciel AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot AND LEKCJA.ID_Uczen=UCZEN.ID_Uczen AND UCZEN.ID_Klasa=KLASA.ID_Klasa">
                <SelectParameters>
                    <asp:SessionParameter Name="idnauczyciel" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        </div>
    </div>
    </form>
</body>
</html>
