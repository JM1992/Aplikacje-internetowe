<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nauczycielsprawdzoceny.aspx.cs" Inherits="projekt.nauczycielsprawdzoceny" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Ocena" 
                DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Ocena" HeaderText="ID_Ocena" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID_Ocena" />
                    <asp:TemplateField HeaderText="Ocena" SortExpression="Ocena">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ocena") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("Ocena") %>' runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Komentarz" HeaderText="Komentarz" 
                        SortExpression="Komentarz" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" ReadOnly="True" SortExpression="Imie" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" ReadOnly="True" SortExpression="Nazwisko" />
                    <asp:BoundField DataField="Klasa" HeaderText="Klasa" ReadOnly="True" SortExpression="Klasa" />
                    <asp:BoundField DataField="Przedmiot" HeaderText="Przedmiot" ReadOnly="True" SortExpression="Przedmiot" />
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
                DeleteCommand="DELETE FROM OCENA WHERE ID_Ocena=@ID_Ocena" 
                SelectCommand="SELECT OCENA.ID_Ocena,OCENA.Ocena,OCENA.Komentarz,UCZEN.Imie,UCZEN.Nazwisko,KLASA.Nazwa AS Klasa,PRZEDMIOT.Nazwa AS Przedmiot FROM OCENA,LEKCJA,UCZEN,KLASA,PRZEDMIOT WHERE OCENA.ID_Lekcja=LEKCJA.ID_Lekcja AND LEKCJA.ID_Nauczyciel=@idnauczyciel AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot AND LEKCJA.ID_Uczen=UCZEN.ID_Uczen AND UCZEN.ID_Klasa=KLASA.ID_Klasa" 
                UpdateCommand="UPDATE OCENA SET Ocena=@Ocena,Komentarz=@Komentarz WHERE ID_Ocena=@ID_Ocena">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Ocena" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="idnauczyciel" SessionField="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Ocena" />
                    <asp:Parameter Name="Komentarz" />
                    <asp:Parameter Name="ID_Ocena" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </form>
</body>
</html>
