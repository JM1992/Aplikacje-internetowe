<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oceny.aspx.cs" Inherits="projekt.oceny" %>

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
            Wpisz oceny uczniom<br />
            Wybierz przedmiot:
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Nazwa" 
                DataValueField="ID_Przedmiot">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                SelectCommand="SELECT DISTINCT PRZEDMIOT.Nazwa,PRZEDMIOT.ID_Przedmiot FROM LEKCJA,PRZEDMIOT WHERE LEKCJA.ID_Nauczyciel=@idnauczyciel AND LEKCJA.ID_Przedmiot=PRZEDMIOT.ID_Przedmiot">
                <SelectParameters>
                    <asp:SessionParameter Name="idnauczyciel" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Wybierz klasę:
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Nazwa" DataValueField="ID_Klasa">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DBCS %>" 
                SelectCommand="SELECT * FROM [KLASA]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Wyświetl" />       
            <br />
            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
        </div>


        <div class="ramka">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="Ocena">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">brak</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Komentarz">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <PagerTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                </PagerTemplate>
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Wstaw oceny" 
                onclick="Button2_Click" />
            <br />
            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
