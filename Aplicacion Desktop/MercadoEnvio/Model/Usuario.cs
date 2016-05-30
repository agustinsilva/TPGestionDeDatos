using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Usuario
    {
        public int Cod { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public bool Habilitado { get; set; }

        public int IntentosFallidos { get; set; }

        public string TipoPersona { get; set; }

        public bool Activo { get; set; }
    }
}
