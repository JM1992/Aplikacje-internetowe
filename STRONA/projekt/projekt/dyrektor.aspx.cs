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
    public partial class dyrektor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label4.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "SELECT ID_Dyrektor,Tytul,Imie,Nazwisko,Email FROM DYREKTOR WHERE Login=@login AND Haslo=@haslo";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@login", Session["login"].ToString());
                        cmd.Parameters.AddWithValue("@haslo", Session["haslo"].ToString());
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                Session["id"] = rdr["ID_Dyrektor"].ToString();
                                Session["tytul"] = rdr["Tytul"].ToString();
                                Session["imie"] = rdr["Imie"].ToString();
                                Session["nazwisko"] = rdr["Nazwisko"].ToString();
                                Session["email"] = rdr["Email"].ToString();
                            }
                        }
                        con.Close();
                    }
                    Label7.Text = Session["login"].ToString();
                    Label5.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString()+" "+Session["nazwisko"].ToString();
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
                string tytul, imie, nazwisko, mail, login, haslo;
                if (DropDownListTytul.SelectedValue == "0") { tytul = ""; }
                else tytul = DropDownListTytul.SelectedItem.ToString();
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
                        polecenie = "INSERT INTO NAUCZYCIEL (Tytul, Imie, Nazwisko, Email, Login, Haslo) VALUES (@tytul, @imie, @nazwisko, @mail, @login, @haslo)";
                        cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@tytul", tytul);
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
                            Label4.Text = "Nauczyciel został dodany poprawnie";
                            Label4.Visible = true;
                            DropDownListTytul.SelectedValue = "0";
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

        protected void DropDownListTytul_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}