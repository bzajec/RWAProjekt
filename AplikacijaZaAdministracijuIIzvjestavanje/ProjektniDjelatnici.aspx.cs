using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AplikacijaZaAdministracijuIIzvjestavanje
{
    public partial class ProjektniDjelatnici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters[0].DefaultValue = Request.QueryString["ID"];
            GridView1.DataBind();
        }
    }
}