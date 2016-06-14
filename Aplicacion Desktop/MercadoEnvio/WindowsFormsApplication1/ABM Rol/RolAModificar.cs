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
    public partial class RolAModificar : Form
    {
        private SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private string connectionString = @"Data Source=localhost\SQLSERVER2012;" +
                "Initial Catalog=GD1C2016;" +
                "User id=gd;" +
                "Password=gd2016;";
        private string nombreViejo;

        private BindingSource bindingSource1 = new BindingSource();

        public RolAModificar()
        {
            InitializeComponent();
        }

        public RolAModificar(int codigo, string nombre)
        {
            InitializeComponent();
            nombreRol.Text = nombre;
            nombreViejo = nombre;
            bool checkeado = false;
            string valor;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = "MASTERFILE.funcionalidadesAsociadas";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("codigoRol", codigo);
            con.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    valor = reader[1].ToString();
                    if ( valor == "1")
                    {
                        checkeado = true;
                    }
                    else
                    {
                        checkeado = false;
                    }
                    funcionalidades.Items.Add(reader[0].ToString(), checkeado);

                    // Read your reader data
                }
            }
            con.Close();

        }

        private void RolAModificar_Load(object sender, EventArgs e)
        {

        }

        private void funcionalidades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void guardar_Click(object sender, EventArgs e)
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
                    cmd.CommandText = "MASTERFILE.modificarRol";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombreRol", nombreViejo);
                    cmd.Parameters.AddWithValue("nombreNuevo", nombre);
                    SqlCommand cmd2 = con.CreateCommand();
                    cmd2.CommandText = "MASTERFILE.modificarFuncionalidadRol";
                    cmd2.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Close();
                        foreach (Object item in funcionalidades.CheckedItems)
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
    }
}
