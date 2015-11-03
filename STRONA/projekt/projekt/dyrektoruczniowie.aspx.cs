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
    }
}