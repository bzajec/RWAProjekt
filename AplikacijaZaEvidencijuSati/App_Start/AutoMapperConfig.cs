using AplikacijaZaEvidencijuSati.Models.vm;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AplikacijaZaEvidencijuSati.App_Start
{
    public static class AutoMapperConfig
    {
        public static IMapper Mapper { get; set; }

        public static void Init()
        {
            var config = new MapperConfiguration(c =>
            {
                c.CreateMap<Projekt, ProjektVM>();
                c.CreateMap<ProjektVM, Projekt>();
            });

            Mapper = config.CreateMapper();
        }
    }
}