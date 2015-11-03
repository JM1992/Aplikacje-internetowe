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
    public partial class haslo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label5.Visible = false;

            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    HyperLink1.NavigateUrl = "dyrektor.aspx";

                    Label1.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = "Dyrektor";
                    Label3.Text = Session["email"].ToString();
                    Label4.Text = Session["login"].ToString();
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    HyperLink1.NavigateUrl = "uczen.aspx";

                    Label1.Text = Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = "Uczeń";
                    Label3.Text = Session["email"].ToString();
                    Label4.Text = Session["login"].ToString();
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    HyperLink1.NavigateUrl = "nauczyciel.aspx";

                    Label1.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = "Nauczyciel";
                    Label3.Text = Session["email"].ToString();
                    Label4.Text = Session["login"].ToString();
                }
            }
            else
            {
                Server.Transfer("Glowna.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != Session["haslo"].ToString())
            {
                Label5.Text = "* Aktualne hasło jest błędne";
                Label5.Visible = true;
            }
            else
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "UPDATE DYREKTOR SET Haslo=@haslo WHERE ID_Dyrektor=@id";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@haslo", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        con.Open();
                        int wynik = (int)cmd.ExecuteNonQuery();
                        con.Close();
                        if (wynik != 0)
                        {
                            Label5.Text = "* Hasło zostało zmienione";
                            Label5.Visible = true;
                        }
                        else
                        {
                            Label5.Text = "* Wystąpił błąd podczas zmiany hasła. Spróbuj jeszcze raz.";
                            Label5.Visible = true;
                        }
                    }
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "UPDATE UCZEN SET Haslo=@haslo WHERE ID_Uczen=@id";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@haslo", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        con.Open();
                        int wynik = (int)cmd.ExecuteNonQuery();
                        con.Close();
                        if (wynik != 0)
                        {
                            Label5.Text = "* Hasło zostało zmienione";
                            Label5.Visible = true;
                        }
                        else
                        {
                            Label5.Text = "* Wystąpił błąd podczas zmiany hasła. Spróbuj jeszcze raz.";
                            Label5.Visible = true;
                        }
                    }
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "UPDATE NAUCZYCIEL SET Haslo=@haslo WHERE ID_Nauczyciel=@id";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@haslo", TextBox2.Text);
                        cmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        con.Open();
                        int wynik = (int)cmd.ExecuteNonQuery();
                        con.Close();
                        if (wynik != 0)
                        {
                            Label5.Text = "* Hasło zostało zmienione";
                            Label5.Visible = true;
                        }
                        else
                        {
                            Label5.Text = "* Wystąpił błąd podczas zmiany hasła. Spróbuj jeszcze raz.";
                            Label5.Visible = true;
                        }
                    }
                }
            }
        }
    }
}