using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace WindowsFormsApplication1.ABM_Rol
{
    public partial class AltaRol : Form
    {

        private string connectionString = @"Data Source=localhost\SQLSERVER2012;" +
                "Initial Catalog=GD1C2016;" +
                "User id=gd;" +
                "Password=gd2016;";

        public AltaRol()
        {
            InitializeComponent();

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "Select Funcionalidad_Rol_Desc from MASTERFILE.Funcionalidad_Rol";
            con.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Funcionalidad.Items.Add(reader[0].ToString());
                    // Read your reader data
                }
            }
            con.Close();

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string nombre = nombreRol.Text;
            
            
            if (String.IsNullOrWhiteSpace(nombre)) //Si el campo esta vacio, no inserta los datos
            {
                MessageBox.Show("Completar el campo nombre para poder guardar.");
            }
            else
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "MASTERFILE.darAltaRol";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombreRol", nombre);
                    SqlCommand cmd2 = con.CreateCommand();
                    cmd2.CommandText = "MASTERFILE.agregarFuncionalidadRol";
                    cmd2.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Close();
                            foreach (Object item in Funcionalidad.CheckedItems)
                            {
                                cmd2.Parameters.AddWithValue("nombreRol", nombre);
                                cmd2.Parameters.AddWithValue("nombreFuncionalidad", item.ToString());
                                reader = cmd2.ExecuteReader();
                                reader.Close();
                                cmd2.Parameters.Clear();
                            }
                            con.Close();
                    }
                    catch
                    {
                        throw;
                    }
                }
                MessageBox.Show("Se han guardado los datos de manera correcta.");
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void AltaRol_Load(object sender, EventArgs e)
        {

        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Funcionalidad_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void cancelarAlta_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
