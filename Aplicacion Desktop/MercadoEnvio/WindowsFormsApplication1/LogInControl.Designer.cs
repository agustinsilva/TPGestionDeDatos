namespace WindowsFormsApplication1
{
    partial class LogInControl
    {
        /// <summary> 
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de componentes

        /// <summary> 
        /// Método necesario para admitir el Diseñador. No se puede modificar 
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.label_logInError = new System.Windows.Forms.Label();
            this.button_logIn = new System.Windows.Forms.Button();
            this.label_password = new System.Windows.Forms.Label();
            this.label_username = new System.Windows.Forms.Label();
            this.textBox_password = new System.Windows.Forms.TextBox();
            this.textBox_username = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label_logInError
            // 
            this.label_logInError.AutoSize = true;
            this.label_logInError.ForeColor = System.Drawing.Color.Red;
            this.label_logInError.Location = new System.Drawing.Point(17, 200);
            this.label_logInError.Name = "label_logInError";
            this.label_logInError.Size = new System.Drawing.Size(163, 13);
            this.label_logInError.TabIndex = 11;
            this.label_logInError.Text = "Usuario o contraseña incorrectos";
            this.label_logInError.Visible = false;
            // 
            // button_logIn
            // 
            this.button_logIn.Location = new System.Drawing.Point(58, 145);
            this.button_logIn.Name = "button_logIn";
            this.button_logIn.Size = new System.Drawing.Size(75, 23);
            this.button_logIn.TabIndex = 10;
            this.button_logIn.Text = "Log In";
            this.button_logIn.UseVisualStyleBackColor = true;
            this.button_logIn.Click += new System.EventHandler(this.button_logIn_Click);
            // 
            // label_password
            // 
            this.label_password.AutoSize = true;
            this.label_password.Location = new System.Drawing.Point(44, 80);
            this.label_password.Name = "label_password";
            this.label_password.Size = new System.Drawing.Size(53, 13);
            this.label_password.TabIndex = 9;
            this.label_password.Text = "Password";
            // 
            // label_username
            // 
            this.label_username.AutoSize = true;
            this.label_username.Location = new System.Drawing.Point(44, 13);
            this.label_username.Name = "label_username";
            this.label_username.Size = new System.Drawing.Size(55, 13);
            this.label_username.TabIndex = 8;
            this.label_username.Text = "Username";
            // 
            // textBox_password
            // 
            this.textBox_password.Location = new System.Drawing.Point(47, 96);
            this.textBox_password.Name = "textBox_password";
            this.textBox_password.Size = new System.Drawing.Size(100, 20);
            this.textBox_password.TabIndex = 7;
            // 
            // textBox_username
            // 
            this.textBox_username.Location = new System.Drawing.Point(47, 29);
            this.textBox_username.Name = "textBox_username";
            this.textBox_username.Size = new System.Drawing.Size(100, 20);
            this.textBox_username.TabIndex = 6;
            // 
            // LogInControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label_logInError);
            this.Controls.Add(this.button_logIn);
            this.Controls.Add(this.label_password);
            this.Controls.Add(this.label_username);
            this.Controls.Add(this.textBox_password);
            this.Controls.Add(this.textBox_username);
            this.Name = "LogInControl";
            this.Size = new System.Drawing.Size(199, 223);
            this.Load += new System.EventHandler(this.LogInControl_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label_logInError;
        private System.Windows.Forms.Button button_logIn;
        private System.Windows.Forms.Label label_password;
        private System.Windows.Forms.Label label_username;
        private System.Windows.Forms.TextBox textBox_password;
        private System.Windows.Forms.TextBox textBox_username;
    }
}
