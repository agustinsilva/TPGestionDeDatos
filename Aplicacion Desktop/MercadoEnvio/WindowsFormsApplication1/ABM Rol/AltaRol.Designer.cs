namespace WindowsFormsApplication1.ABM_Rol
{
    partial class AltaRol
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.nombreRol = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.Funcionalidad = new System.Windows.Forms.CheckedListBox();
            this.SuspendLayout();
            // 
            // nombreRol
            // 
            this.nombreRol.Location = new System.Drawing.Point(62, 34);
            this.nombreRol.Name = "nombreRol";
            this.nombreRol.Size = new System.Drawing.Size(100, 20);
            this.nombreRol.TabIndex = 0;
            this.nombreRol.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(246, 330);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 1;
            this.button1.Text = "Guardar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 37);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Nombre";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 67);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Funcionalidades del rol";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // Funcionalidad
            // 
            this.Funcionalidad.FormattingEnabled = true;
            this.Funcionalidad.Location = new System.Drawing.Point(15, 90);
            this.Funcionalidad.Name = "Funcionalidad";
            this.Funcionalidad.Size = new System.Drawing.Size(281, 139);
            this.Funcionalidad.TabIndex = 5;
            this.Funcionalidad.SelectedIndexChanged += new System.EventHandler(this.Funcionalidad_SelectedIndexChanged);
            // 
            // AltaRol
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(351, 387);
            this.Controls.Add(this.Funcionalidad);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.nombreRol);
            this.Name = "AltaRol";
            this.Text = "Alta de rol";
            this.Load += new System.EventHandler(this.AltaRol_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox nombreRol;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckedListBox Funcionalidad;
    }
}