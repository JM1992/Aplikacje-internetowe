<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dyrektoruczniowie.aspx.cs" Inherits="projekt.dyrektoruczniowie" %>

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
            Dodaj nowego ucznia<br />
            Imię:
              <asp:TextBox ID="TextBoxImie" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxImie" ErrorMessage="* Wymagane pole" 
                ForeColor="Red" EnableTheming="True" SetFocusOnError="True" 
                ValidationGroup="grupa"></asp:RequiredFieldValidator>
            <br />
            Nazwisko:
            <asp:TextBox ID="TextBoxNazwisko" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxNazwisko" ErrorMessage="* Wymagane pole" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="grupa"></asp:RequiredFieldValidator>
            <br />
          E-mail:
            <asp:TextBox ID="TextBoxEmail" runat="server" TextMode="Email"></asp:TextBox>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBoxEmail" ErrorMessage="* Błędny adres e-mail" 
            ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                SetFocusOnError="True" ValidationGroup="grupa"></asp:RegularExpressionValidator>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBoxEmail" ErrorMessage="* Wymagane pole" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="grupa"></asp:RequiredFieldValidator>
            <br />
            Login:
              <asp:TextBox ID="TextBoxLogin" runat="server"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBoxLogin" ErrorMessage="* Wymagane pole" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="grupa"></asp:RequiredFieldValidator>
            <br />
            Hasło:
            <asp:TextBox ID="TextBoxHaslo" runat="server" style="margin-bottom: 0px" 
            TextMode="Password"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBoxHaslo" ErrorMessage="* Wymagane pole" 
                ForeColor="Red" SetFocusOnError="True" ValidationGroup="grupa"></asp:RequiredFieldValidator>
            <br />
          Powtórz hasło:
            <asp:TextBox ID="TextBoxRHaslo" runat="server" TextMode="Password"></asp:TextBox>
            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBoxRHaslo" ControlToValidate="TextBoxHaslo" 
            ErrorMessage="* Hasła muszą być identyczne" ForeColor="Red" 
                SetFocusOnError="True" ValidationGroup="grupa"></asp:CompareValidator>
            <br />
            <asp:Button ID="Dodaj" runat="server" Text="Dodaj" onclick="Dodaj_Click" 
                ValidationGroup="grupa" />
            <br />
            <asp:Label ID="Label4" runat="server" ForeColor="Red" 
            Text="*" 
            Visible="False"></asp:Label>

        </div>


        <div class="ramka">        
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID_Uczen" 
                DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID_Uczen" HeaderText="ID_Uczen" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID_Uczen" />
                    <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                    <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                        SortExpression="Nazwisko" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
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
                DeleteCommand="DELETE FROM [UCZEN] WHERE [ID_Uczen] = @ID_Uczen" 
                InsertCommand="INSERT INTO [UCZEN] ([Imie], [Nazwisko], [Email], [Login]) VALUES (@Imie, @Nazwisko, @Email, @Login)" 
                SelectCommand="SELECT [ID_Uczen], [Imie], [Nazwisko], [Email], [Login] FROM [UCZEN]" 
                
                UpdateCommand="UPDATE [UCZEN] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [Email] = @Email, [Login] = @Login WHERE [ID_Uczen] = @ID_Uczen" 
                onselecting="SqlDataSource1_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Uczen" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Login" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Imie" Type="String" />
                    <asp:Parameter Name="Nazwisko" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Login" Type="String" />
                    <asp:Parameter Name="ID_Uczen" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>        
        </div>
    </div>
    </form>
</body>
</html>
