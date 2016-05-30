namespace WindowsFormsApplication1
{
    partial class MainForm
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

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBox_username = new System.Windows.Forms.TextBox();
            this.textBox_password = new System.Windows.Forms.TextBox();
            this.label_username = new System.Windows.Forms.Label();
            this.label_password = new System.Windows.Forms.Label();
            this.button_logIn = new System.Windows.Forms.Button();
            this.label_logInError = new System.Windows.Forms.Label();
            this.logInControl = new WindowsFormsApplication1.LogInControl();
            this.SuspendLayout();
            // 
            // textBox_username
            // 
            this.textBox_username.Location = new System.Drawing.Point(0, 0);
            this.textBox_username.Name = "textBox_username";
            this.textBox_username.Size = new System.Drawing.Size(100, 20);
            this.textBox_username.TabIndex = 5;
            // 
            // textBox_password
            // 
            this.textBox_password.Location = new System.Drawing.Point(0, 0);
            this.textBox_password.Name = "textBox_password";
            this.textBox_password.Size = new System.Drawing.Size(100, 20);
            this.textBox_password.TabIndex = 4;
            // 
            // label_username
            // 
            this.label_username.Location = new System.Drawing.Point(0, 0);
            this.label_username.Name = "label_username";
            this.label_username.Size = new System.Drawing.Size(100, 23);
            this.label_username.TabIndex = 3;
            // 
            // label_password
            // 
            this.label_password.Location = new System.Drawing.Point(0, 0);
            this.label_password.Name = "label_password";
            this.label_password.Size = new System.Drawing.Size(100, 23);
            this.label_password.TabIndex = 2;
            // 
            // button_logIn
            // 
            this.button_logIn.Location = new System.Drawing.Point(0, 0);
            this.button_logIn.Name = "button_logIn";
            this.button_logIn.Size = new System.Drawing.Size(75, 23);
            this.button_logIn.TabIndex = 1;
            // 
            // label_logInError
            // 
            this.label_logInError.Location = new System.Drawing.Point(0, 0);
            this.label_logInError.Name = "label_logInError";
            this.label_logInError.Size = new System.Drawing.Size(100, 23);
            this.label_logInError.TabIndex = 0;
            // 
            // logInControl
            // 
            this.logInControl.Location = new System.Drawing.Point(152, 50);
            this.logInControl.Name = "logInControl";
            this.logInControl.Size = new System.Drawing.Size(199, 223);
            this.logInControl.TabIndex = 6;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(504, 312);
            this.Controls.Add(this.logInControl);
            this.Controls.Add(this.label_logInError);
            this.Controls.Add(this.button_logIn);
            this.Controls.Add(this.label_password);
            this.Controls.Add(this.label_username);
            this.Controls.Add(this.textBox_password);
            this.Controls.Add(this.textBox_username);
            this.Name = "MainForm";
            this.Text = "MercadoEnvioDesktop";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBox_username;
        private System.Windows.Forms.TextBox textBox_password;
        private System.Windows.Forms.Label label_username;
        private System.Windows.Forms.Label label_password;
        private System.Windows.Forms.Button button_logIn;
        private System.Windows.Forms.Label label_logInError;
        private LogInControl logInControl;
    }
}

