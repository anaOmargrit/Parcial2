using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial2
{
    public partial class GestionArchivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verifico si ya se encuentra registrado en sesión el usuario para cargar archivos
            lb_mensaje.Text = this.Session["user"] != null ? $"¡Hola {this.Session["user"].ToString()}! Selecciona el archivo que quieres cargar." : "Debes registrarte para cargar archivos en el sitio.";
            lb_grilla.Text = string.Empty;
            lb_resultado.Text = string.Empty;
            if (this.Session["user"] != null)
            {
                cargar_Archivos();
            }
        }

        public void cargar_Archivos()
        {
            string usuario = this.Session["user"] != null ? this.Session["user"].ToString() : null;           
            if (usuario != null)
            {           
                string path = $"{Server.MapPath(".")}/{usuario}";
                if (Directory.Exists(path))
                {
                    string[] files = Directory.GetFiles(path);
                    List<Archivo> fileList = new List<Archivo>();
                    foreach (string file in files)
                    {
                        var fileNew = new Archivo(Path.GetFileName(file), file);
                        fileList.Add(fileNew);
                    }
                    gv_archivos.DataSource = fileList;
                    gv_archivos.DataBind();
                    lb_grilla.Text = "Archivos cargados:";
                }
            }
        }

        protected void bt_cargar_Click(object sender, EventArgs e)
        {
            lb_resultado.Text = string.Empty;
            string usuario = this.Session["user"] != null ? this.Session["user"].ToString() : null;

            if (usuario != null)
            {
                string path = $"{Server.MapPath(".")}/{usuario}";
                string result = string.Empty;

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                if (File.Exists($"{path}/{fu_archivo.FileName}"))
                {
                    result = $"El archivo {fu_archivo.FileName} ya existe.";
                }
                else
                {
                    fu_archivo.SaveAs($"{path}/{fu_archivo.FileName}");
                    result = "El archivo se guardó correctamente.";
                    cargar_Archivos();
                }
                lb_resultado.Text = result;
            }
            else
            {
                lb_mensaje.Text = "No puedes subir archivos todavía. Debes registrarte para cargar archivos en el sitio.";
            }
        }

        protected void gv_archivos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = gv_archivos.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}