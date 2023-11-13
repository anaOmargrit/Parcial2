using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verifico si ya se encuentra registrado en sesión el usuario para modificar el mensaje
            HttpCookie cookie = Request.Cookies["user"];
            string valorLabel = cookie != null ? cookie.Value : "¡Registrate en nuestro sitio!";
            lb_mensaje.Text = valorLabel;
            if (this.Session["user"] != null)
            {
                lb_mensaje.Text = $"¡Bienvenida/o a bordo {Session["user"].ToString()}!";
            }
        }

        protected void bt_guardar_Click(object sender, EventArgs e)
        {
            if (this.Session["user"] != null)
            {
                lb_mensaje.Text = $"Ya tienes un usuario creado: {Session["user"].ToString()}.";
                tb_user.Text = string.Empty;
                tb_mail.Text = string.Empty;
                tb_edad.Text = string.Empty;
            }
            else
            {
                //creación de cookie
                if (tb_pass1.Text != string.Empty)
                {
                    HttpCookie cookie_pass = new HttpCookie("pass", tb_pass1.Text);
                    Response.Cookies.Add(cookie_pass);
                }

                //creación de variable session
                this.Session["user"] = tb_user.Text;
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}