using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1.ABM_Rol
{
    public partial class BotoneraFuncionalidadRol : Form
    {
        public BotoneraFuncionalidadRol()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Alta_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["AltaRol"] as AltaRol) == null)
            {
                var alta = new AltaRol();
                alta.Show();
            }
        }

        private void Baja_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["BajaRol"] as BajaRol) == null)
            {
                var baja = new BajaRol();
                baja.Show();
            }
        }

        private void modificarRol_Click(object sender, EventArgs e)
        {
            if ((Application.OpenForms["ModificarRol"] as ModificarRol) == null)
            {
                var modificar = new ModificarRol();
                modificar.Show();
            }
        }
    }
}
