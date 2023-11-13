using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Parcial2
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb_mensaje_index.Text = this.Session["user"] != null ? $"¡Hola {this.Session["user"].ToString()}! Ya puedes comenzar a cargar tus archivos en el sitio." : "Debes registrarte para cargar archivos en el sitio.";
        }
    }
}