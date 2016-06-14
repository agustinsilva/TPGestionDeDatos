namespace WindowsFormsApplication1.Menu
{
    partial class Menu
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
            this.ABMRol = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ABMRol
            // 
            this.ABMRol.Location = new System.Drawing.Point(23, 21);
            this.ABMRol.Name = "ABMRol";
            this.ABMRol.Size = new System.Drawing.Size(75, 23);
            this.ABMRol.TabIndex = 0;
            this.ABMRol.Text = "ABMRol";
            this.ABMRol.UseVisualStyleBackColor = true;
            this.ABMRol.Click += new System.EventHandler(this.ABMRol_Click);
            // 
            // Menu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.ABMRol);
            this.Name = "Menu";
            this.Text = "Menu";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ABMRol;
    }
}