using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplikacijaZaAdministracijuIIzvjestavanje
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDalje_Click(object sender, EventArgs e)
        {
            string connect = @"data source=DESKTOP-OEF8VCC\SQLEXPRESS;initial catalog=PRABAZA;persist security info=True;Integrated Security=SSPI;";
            string query = "Select Count(*) From Djelatnik Where Email = @email And Zaporka = @pass";
            string upit = "SELECT Djelatnik.IDDjelatnik, Djelatnik.TimID, Tim.Naziv,Djelatnik.TipDjelatnikaID FROM Djelatnik INNER JOIN Tim ON Tim.IDTim=Djelatnik.TimID WHERE Email = @email AND Zaporka = @pass";
            int result = 0;
            int IDDjelatnik = 0;
            string ImeTima = "";
            int TipDjelatnikaID = 0;

            using (SqlConnection conn = new SqlConnection(connect))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("email", emaillog.Text);
                    cmd.Parameters.AddWithValue("pass", passlog.Text);
                    conn.Open();



                    result = (int)cmd.ExecuteScalar();
                }


                using (SqlCommand cmd = new SqlCommand(upit, conn))
                {
                    cmd.Parameters.AddWithValue("email", emaillog.Text);
                    cmd.Parameters.AddWithValue("pass", passlog.Text);

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        while (rdr.Read())
                        {
                            IDDjelatnik = rdr.GetByte(0);
                            ImeTima = rdr.GetString(2);
                            TipDjelatnikaID = rdr.GetByte(3);
                        }
                    }
                }


            }

            HttpCookie kuki = new HttpCookie("LoginInfo");
            kuki["email"] = emaillog.Text;
            kuki["pass"] = passlog.Text;
            kuki["IdDjelatnik"] = IDDjelatnik.ToString();
            kuki["ImeTima"] = ImeTima;

            kuki.Expires = DateTime.Now.AddMinutes(5);
            Response.Cookies.Add(kuki);
            if (result > 0 && (TipDjelatnikaID == 1 || TipDjelatnikaID == 2))
            {

                Response.Redirect("Djelatnici.aspx");
            }
            else
            {
                validationlog.Text = "Pogresno uneseni podaci! ";
                validationlog.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}