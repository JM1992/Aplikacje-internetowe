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
    public partial class nauczyciel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["zalogowany"] != null)
            {
                if ((int)Session["zalogowany"] == 1)
                {
                    Server.Transfer("dyrektor.aspx");
                }

                if ((int)Session["zalogowany"] == 2)
                {
                    Server.Transfer("uczen.aspx");
                }

                if ((int)Session["zalogowany"] == 3)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                    {
                        string polecenie = "SELECT ID_Nauczyciel,Tytul,Imie,Nazwisko,Email FROM NAUCZYCIEL WHERE Login=@login AND Haslo=@haslo";
                        SqlCommand cmd = new SqlCommand(polecenie, con);
                        cmd.Parameters.AddWithValue("@login", Session["login"].ToString());
                        cmd.Parameters.AddWithValue("@haslo", Session["haslo"].ToString());
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                Session["id"] = rdr["ID_Nauczyciel"].ToString();
                                Session["tytul"] = rdr["Tytul"].ToString();
                                Session["imie"] = rdr["Imie"].ToString();
                                Session["nazwisko"] = rdr["Nazwisko"].ToString();
                                Session["email"] = rdr["Email"].ToString();
                            }
                        }
                        con.Close();
                    }
                    Label3.Text = Session["login"].ToString();
                    Label1.Text = Session["tytul"].ToString() + " " + Session["imie"].ToString() + " " + Session["nazwisko"].ToString();
                    Label2.Text = Session["email"].ToString();
                }
            }
            else
            {
                Server.Transfer("Glowna.aspx");
            }
        }

        protected void ButtonWyloguj_Click(object sender, EventArgs e)
        {
            Session["zalogowany"] = null;
            Server.Transfer("Glowna.aspx");
        }
    }
}