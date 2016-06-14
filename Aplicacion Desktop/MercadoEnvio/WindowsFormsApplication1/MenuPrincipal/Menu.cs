using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WindowsFormsApplication1.ABM_Rol;

namespace WindowsFormsApplication1.Menu
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void ABMRol_Click(object sender, EventArgs e)
        {
            //Solo abre una vez el form
            if ((Application.OpenForms["BotoneraFuncionalidadRol"] as BotoneraFuncionalidadRol) == null)
            {
                var alta = new BotoneraFuncionalidadRol();
                alta.Show();
            }
        }
    }
}
