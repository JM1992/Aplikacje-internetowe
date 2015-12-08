<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektorklasy.aspx.cs" Inherits="projekt.dyrektorklasy" %>

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
            Dodaj 
            nową klasę<br />
            Nazwa:
            <asp:TextBox ID="TextBoxNazwa" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxNazwa" ErrorMessage="* Wymagane pole" ForeColor="Red" 
                ValidationGroup="grupa" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Dodaj" onclick="Button1_Click" 
                ValidationGroup="grupa" />
            <br />
            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*" Visible="False"></asp:Label>

        </div>


        <div class="ramka">    
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Klasa" 
                DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Klasa" HeaderText="ID_Klasa" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID_Klasa" />
                    <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
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
                DeleteCommand="DELETE FROM [KLASA] WHERE [ID_Klasa] = @ID_Klasa" 
                InsertCommand="INSERT INTO [KLASA] ([Nazwa]) VALUES (@Nazwa)" 
                SelectCommand="SELECT [ID_Klasa], [Nazwa] FROM [KLASA]" 
                UpdateCommand="UPDATE [KLASA] SET [Nazwa] = @Nazwa WHERE [ID_Klasa] = @ID_Klasa">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Klasa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nazwa" Type="String" />
                    <asp:Parameter Name="ID_Klasa" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>            
        </div>


        <div class="ramka">
            Przypisz uczniów do klas<br />
            Wyświetl uczniów:
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                Text="Wyświetl" />
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="3">
            </asp:CheckBoxList>
            <br />
            Wybierz klasę:
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Nazwa" 
                DataValueField="ID_Klasa">
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Dodaj" 
                onclick="Button2_Click" />
            <br />
            <asp:Label ID="Label10" runat="server" ForeColor="Red" Text="*"></asp:Label>
            <br />

        </div>


        <div class="ramka">
            Wyświetl uczniów z danej klasy<br />
            Wybierz klasę:
            <asp:DropDownList ID="DropDownList2" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="Nazwa" 
                DataValueField="ID_Klasa">
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button3" runat="server" Text="Wyświetl" 
                onclick="Button3_Click" />
            <br />
            <asp:GridView ID="GridView2" runat="server" BackColor="White" 
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
