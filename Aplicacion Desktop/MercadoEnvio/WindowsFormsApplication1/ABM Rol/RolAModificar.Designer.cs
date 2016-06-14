namespace WindowsFormsApplication1.ABM_Rol
{
    partial class RolAModificar
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
            this.label1 = new System.Windows.Forms.Label();
            this.nombreRol = new System.Windows.Forms.TextBox();
            this.guardar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.funcionalidades = new System.Windows.Forms.CheckedListBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(44, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nombre";
            // 
            // nombreRol
            // 
            this.nombreRol.Location = new System.Drawing.Point(62, 30);
            this.nombreRol.Name = "nombreRol";
            this.nombreRol.Size = new System.Drawing.Size(100, 20);
            this.nombreRol.TabIndex = 1;
            // 
            // guardar
            // 
            this.guardar.Location = new System.Drawing.Point(197, 226);
            this.guardar.Name = "guardar";
            this.guardar.Size = new System.Drawing.Size(75, 23);
            this.guardar.TabIndex = 3;
            this.guardar.Text = "Guardar";
            this.guardar.UseVisualStyleBackColor = true;
            this.guardar.Click += new System.EventHandler(this.guardar_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 59);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Funcionalidades del rol";
            // 
            // funcionalidades
            // 
            this.funcionalidades.FormattingEnabled = true;
            this.funcionalidades.Location = new System.Drawing.Point(12, 85);
            this.funcionalidades.Name = "funcionalidades";
            this.funcionalidades.Size = new System.Drawing.Size(232, 124);
            this.funcionalidades.TabIndex = 6;
            this.funcionalidades.SelectedIndexChanged += new System.EventHandler(this.checkedListBox1_SelectedIndexChanged);
            // 
            // RolAModificar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.funcionalidades);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.guardar);
            this.Controls.Add(this.nombreRol);
            this.Controls.Add(this.label1);
            this.Name = "RolAModificar";
            this.Text = "RolAModificar";
            this.Load += new System.EventHandler(this.RolAModificar_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox nombreRol;
        private System.Windows.Forms.Button guardar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckedListBox funcionalidades;
    }
}