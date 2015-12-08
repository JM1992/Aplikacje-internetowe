using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace projekt
{
    public partial class dyrektoruczniowie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Label7.Text = Session["login"].ToString();
                    Label5.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label8.Text = Session["email"].ToString();
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    Server.Transfer("uczen.aspx");
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    Server.Transfer("nauczyciel.aspx");
                }
            }
            else
            {
                Server.Transfer("Glowna.aspx");
            }
        }



        protected void Dodaj_Click(object sender, EventArgs e)
        {
            string imie, nazwisko, mail, login, haslo;
      
            imie = TextBoxImie.Text;
            nazwisko = TextBoxNazwisko.Text;
            mail = TextBoxEmail.Text;
            login = TextBoxLogin.Text;
            haslo = TextBoxHaslo.Text;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                string polecenie = "SELECT count(*) FROM DYREKTOR, NAUCZYCIEL, UCZEN WHERE DYREKTOR.Login=@login OR NAUCZYCIEL.Login=@login OR UCZEN.Login=@login";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@login", login);
                con.Open();
                int wynik = (int)cmd.ExecuteScalar();
                con.Close();
                if (wynik == 0)
                {
                    polecenie = "INSERT INTO UCZEN (Imie, Nazwisko, Email, Login, Haslo) VALUES (@imie, @nazwisko, @mail, @login, @haslo)";
                    cmd = new SqlCommand(polecenie, con);
                    cmd.Parameters.AddWithValue("@imie", imie);
                    cmd.Parameters.AddWithValue("@nazwisko", nazwisko);
                    cmd.Parameters.AddWithValue("@mail", mail);
                    cmd.Parameters.AddWithValue("@login", login);
                    cmd.Parameters.AddWithValue("@haslo", haslo);
                    con.Open();
                    wynik = cmd.ExecuteNonQuery();
                    con.Close();
                    if (wynik == 1)
                    {
                        Label4.Text = "Uczeń został dodany poprawnie";
                        Label4.Visible = true;
                        TextBoxImie.Text = "";
                        TextBoxNazwisko.Text = "";
                        TextBoxEmail.Text = "";
                        TextBoxLogin.Text = "";
                        GridView1.DataBind();
                    }
                    else
                    {
                        Label4.Text = "* Błąd";
                        Label4.Visible = true;
                    }
                }
                else
                {
                    Label4.Text = "* Użytkownik o podanym loginie już istnieje w bazie";
                    Label4.Visible = true;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}