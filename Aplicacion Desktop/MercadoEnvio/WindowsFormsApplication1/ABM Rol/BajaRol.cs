using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApplication1.ABM_Rol
{
    public partial class BajaRol : Form
    {
        private SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private string connectionString = @"Data Source=localhost\SQLSERVER2012;" +
                "Initial Catalog=GD1C2016;" +
                "User id=gd;" +
                "Password=gd2016;";
        private BindingSource bindingSource1 = new BindingSource();

        public BajaRol()
        {
            InitializeComponent();
        }

        private void GetData(string selectCommand)
        {
         try
            {
            dataGridView1.Columns.Clear();
            // Create a new data adapter based on the specified query.
            dataAdapter = new SqlDataAdapter(selectCommand, connectionString);

            // Create a command builder to generate SQL update, insert, and
            // delete commands based on selectCommand. These are used to
            // update the database.
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(dataAdapter);

            // Populate a new data table and bind it to the BindingSource.
            DataTable table = new DataTable();
            table.Locale = System.Globalization.CultureInfo.InvariantCulture;
            dataAdapter.Fill(table);        
            DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            dataGridView1.Columns.Add(btn);
            btn.HeaderText = "Seleccionar";
            btn.Text = "Dar de baja";
            btn.Name = "btnBaja";
            btn.UseColumnTextForButtonValue = true;
            bindingSource1.DataSource = table;
            // Resize the DataGridView columns to fit the newly loaded content.
            dataGridView1.AutoResizeColumns( 
                DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
            }
            catch (SqlException)
            {
                MessageBox.Show("Error de conexion.");
            }
    }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bindingSource1;
            ActualizarTabla();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                int indiceColumnaNombre = e.ColumnIndex + 2;
                int indiceFila = e.RowIndex;
                string rol = dataGridView1[indiceColumnaNombre, indiceFila].Value.ToString();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "MASTERFILE.darBajaRolPorNombre";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombreRol", rol);
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        reader.Close();
                        con.Close();
                    }
                    catch
                    {
                        throw;
                    }
                }
                MessageBox.Show("Se dio de baja el rol: " + rol);
            }
            ActualizarTabla();
        }

        private void ActualizarTabla()
        {
            string query = "SELECT * FROM MASTERFILE.Rol where Rol_Habilitado = 1";
            GetData(query);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = null;
            dataGridView1.Columns.Clear();
        }

    }
}

