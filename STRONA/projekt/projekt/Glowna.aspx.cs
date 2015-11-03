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
    public partial class Glowna : System.Web.UI.Page
    {
        string polecenie;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1) { Server.Transfer("dyrektor.aspx"); }
                if ((int)Session["zalogowany"] == 2) { Server.Transfer("uczen.aspx"); }
                if ((int)Session["zalogowany"] == 3) { Server.Transfer("nauczyciel.aspx"); }
            }
        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
            {
                polecenie = "SELECT count(*) FROM DYREKTOR WHERE Login=@login AND Haslo=@haslo";
                SqlCommand cmd = new SqlCommand(polecenie, con);
                cmd.Parameters.AddWithValue("@login", TextBoxLogin.Text);
                cmd.Parameters.AddWithValue("@haslo", TextBoxHaslo.Text);

                con.Open();
                int wynik = (int)cmd.ExecuteScalar();
                con.Close();

                if (wynik != 0)
                {
                    Session["zalogowany"] = 1;
                    Session["login"] = TextBoxLogin.Text;
                    Session["haslo"] = TextBoxHaslo.Text;
                    Server.Transfer("dyrektor.aspx");
                }
                else
                {
                    polecenie = "SELECT count(*) FROM UCZEN WHERE Login=@login AND Haslo=@haslo";
                    cmd = new SqlCommand(polecenie, con);
                    cmd.Parameters.AddWithValue("@login", TextBoxLogin.Text);
                    cmd.Parameters.AddWithValue("@haslo", TextBoxHaslo.Text);

                    con.Open();
                    wynik = (int)cmd.ExecuteScalar();
                    con.Close();

                    if (wynik != 0)
                    {
                        Session["zalogowany"] = 2;
                        Session["login"] = TextBoxLogin.Text;
                        Session["haslo"] = TextBoxHaslo.Text;
                        Server.Transfer("uczen.aspx");
                    }
                    else
                    {
                        polecenie = "SELECT count(*) FROM NAUCZYCIEL WHERE Login=@login AND Haslo=@haslo";
                        cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@login", TextBoxLogin.Text);
                        cmd.Parameters.AddWithValue("@haslo", TextBoxHaslo.Text);

                        con.Open();
                        wynik = (int)cmd.ExecuteScalar();
                        con.Close();

                        if (wynik != 0)
                        {
                            Session["zalogowany"] = 3;
                            Session["login"] = TextBoxLogin.Text;
                            Session["haslo"] = TextBoxHaslo.Text;
                            Server.Transfer("nauczyciel.aspx");
                        }
                        else
                        {
                            Label1.Visible = true;
                        }
                    }
                }
            }
        }
    }
}