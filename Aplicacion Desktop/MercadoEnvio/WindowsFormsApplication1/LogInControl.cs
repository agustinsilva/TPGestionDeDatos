﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Model;
using System.Data.SqlClient;

namespace WindowsFormsApplication1
{
    public partial class LogInControl : UserControl
    {
        private string connectionString = @"Data Source=localhost\SQLSERVER2012;" +
        "Initial Catalog=GD1C2016;" +
        "User id=gd;" +
        "Password=gd2016;";

        public LogInControl()
        {
            InitializeComponent();
        }

        private void LogInControl_Load(object sender, EventArgs e)
        {

        }

        private void button_logIn_Click(object sender, EventArgs e)
        {
            string usernameInput = textBox_username.Text;
            string passwordInput = textBox_password.Text;
            try
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "MASTERFILE.loginUsuario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("username", usernameInput);
                cmd.Parameters.AddWithValue("password", passwordInput);
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Read your reader data
                    }
                }
                con.Close();
                pushNextScreen();
            }
            catch
            {

            }
            //Usuario usuario = checkUser(usernameInput, passwordInput);
            //if (usuario != null)
            //{
            //    LogInManager.usuarioLogueado = usuario;
            //    pushNextScreen();
            //}
            //else
            //{
            //    failedTry(usernameInput);
            //    showError();
            //}
        }

        private Usuario checkUser(string username, string password)
        {
            //llamado al sp que valida log in
            return new Usuario();
        }

        private void pushNextScreen()
        {
            MainForm parent = (MainForm)this.ParentForm;
            parent.LogInCompleted();
        }

        private void showError()
        {
            textBox_username.Text = String.Empty;
            textBox_password.Text = String.Empty;
            label_logInError.Visible = true;
        }

        private void failedTry(string username)
        {
            //llamado al sp que agrega un intento fallido
        }
    }
}
