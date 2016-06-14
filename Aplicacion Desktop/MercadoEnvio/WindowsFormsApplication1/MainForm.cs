using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Model;
using WindowsFormsApplication1.Menu;

namespace WindowsFormsApplication1
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {

        }

        public void LogInCompleted() {
            //logInControl.Visible = false;

            if (/*preguntar si el usuario tiene mas de un rol*/true)
            {
                //pushear vista con eleccion de rol
            }
            else { 
                //pushear vista main
            }
            this.Hide();
            Menu.Menu menu = new Menu.Menu();
            menu.ShowDialog();
            this.Close();
        }

        private void logInControl_Load(object sender, EventArgs e)
        {

        }
    }
}
