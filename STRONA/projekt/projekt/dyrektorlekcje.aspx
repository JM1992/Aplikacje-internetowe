<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektorlekcje.aspx.cs" Inherits="projekt.dyrektorlekcje" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title>Dyrektor</title>
    <link rel="stylesheet" href="Style.css" type="text/css"/>
</head>



<body>
    <form id="form1" runat="server">
    <div class="container">
        
        <div class="naglowek">               
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

        <div class="menu">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/dyrektor.aspx">Nauczyciele</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/dyrektoruczniowie.aspx">Uczniowie</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/dyrektorklasy.aspx">Klasy</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/dyrektorprzedmioty.aspx">Przedmioty</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/dyrektorlekcje.aspx">Lekcje</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Wyloguj.aspx">Wyloguj</asp:HyperLink>
        </div>

        
        <div class="ramka">
            Ustaw lekcje<br />
            Wybierz przedmiot: 
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Nazwa" 
                DataValueField="ID_Przedmiot">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                SelectCommand="SELECT * FROM [PRZEDMIOT]"></asp:SqlDataSource>
            <br />
            Wybierz nauczyciela:
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <br />
            Wybierz ucznia:
            <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Zapisz" />
            <br />
            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*"></asp:Label>
         </div>   


         <div class="ramka">
             <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                 AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                 BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Lekcja" 
                 DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
                 HorizontalAlign="Center">
                 <Columns>
                     <asp:CommandField ShowDeleteButton="True" />
                     <asp:BoundField DataField="ID_Lekcja" HeaderText="ID_Lekcja" 
                         InsertVisible="False" ReadOnly="True" SortExpression="ID_Lekcja" />
                     <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                     <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                         SortExpression="Nazwisko" />
                     <asp:BoundField DataField="Klasa" HeaderText="Klasa" SortExpression="Klasa" />
                     <asp:BoundField DataField="Przedmiot" HeaderText="Przedmiot" 
                         SortExpression="Przedmiot" />
                     <asp:BoundField DataField="Tytul" HeaderText="Tytul" SortExpression="Tytul" />
                     <asp:BoundField DataField="Imie1" HeaderText="Imie1" SortExpression="Imie1" />
                     <asp:BoundField DataField="Nazwisko1" HeaderText="Nazwisko1" 
                         SortExpression="Nazwisko1" />
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
                 
                 SelectCommand="SELECT LEKCJA.ID_Lekcja,UCZEN.Imie,UCZEN.Nazwisko,KLASA.Nazwa AS Klasa,PRZEDMIOT.Nazwa AS Przedmiot,NAUCZYCIEL.Tytul,NAUCZYCIEL.Imie,NAUCZYCIEL.Nazwisko FROM LEKCJA,UCZEN,KLASA,PRZEDMIOT,NAUCZYCIEL WHERE LEKCJA.ID_Uczen=UCZEN.ID_Uczen AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot AND LEKCJA.ID_Nauczyciel=NAUCZYCIEL.ID_Nauczyciel AND UCZEN.ID_Klasa=KLASA.ID_Klasa" 
                 DeleteCommand="DELETE FROM LEKCJA WHERE ID_Lekcja=@ID_Lekcja">
                 <DeleteParameters>
                     <asp:Parameter Name="ID_Lekcja" />
                 </DeleteParameters>
             </asp:SqlDataSource>
         </div>
    </div>
    </form>
</body>
</html>
