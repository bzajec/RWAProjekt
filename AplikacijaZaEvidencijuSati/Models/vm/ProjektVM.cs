using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AplikacijaZaEvidencijuSati.Models.vm
{
    public class ProjektVM
    {
        public short IDProjekt { get; set; }
        public string Naziv { get; set; }
        public byte KlijentID { get; set; }
        public System.DateTime DatumOtvaranja { get; set; }
        public byte VoditeljProjektaID { get; set; }
        public virtual Klijent Klijent { get; set; }
        public virtual ICollection<ProjektDjelatnik> ProjektDjelatniks { get; set; }
    }
}