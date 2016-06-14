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
    public partial class ModificarRol : Form
    {
        private SqlDataAdapter dataAdapter = new SqlDataAdapter();
        private string connectionString = @"Data Source=localhost\SQLSERVER2012;" +
                "Initial Catalog=GD1C2016;" +
                "User id=gd;" +
                "Password=gd2016;";

        private BindingSource bindingSourceRolM = new BindingSource();
        public ModificarRol()
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
                btn.Text = "Modificar";
                btn.Name = "btnModificarRol";
                btn.UseColumnTextForButtonValue = true;
                bindingSourceRolM.DataSource = table;

                // Resize the DataGridView columns to fit the newly loaded content.
                dataGridView1.AutoResizeColumns(DataGridViewAutoSizeColumnsMode.AllCellsExceptHeader);
            }
            catch (SqlException)
            {
                MessageBox.Show("Error de conexion.");
            }
        }

        private void ActualizarTabla()
        {
            string query = "SELECT * FROM MASTERFILE.Rol";
            GetData(query);
        }

        private void buscar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = bindingSourceRolM;
            ActualizarTabla();
        }

        private void limpiar_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = null;
            dataGridView1.Columns.Clear();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int indiceColumna = e.ColumnIndex;
            if (indiceColumna == 0)
            {
                int indiceColumnaCodigo = indiceColumna + 1;
                int indiceColumnaNombre = indiceColumna + 2;
                int indiceFila = e.RowIndex;
                int codigoRol = Convert.ToInt32(dataGridView1[indiceColumnaCodigo, indiceFila].Value.ToString());
                string nombreRol = dataGridView1[indiceColumnaNombre, indiceFila].Value.ToString();
                if ((Application.OpenForms["RolAModificar"] as RolAModificar) == null)
                {
                    var modif = new RolAModificar(codigoRol,nombreRol);
                    modif.Show();
                }
            }

            
            //ActualizarTabla();
        }
    }
}
