using MVP.Models.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;

namespace MVP.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<MVP.Models.EntityModel>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(MVP.Models.EntityModel context)
        {
            context.Settings.AddOrUpdate(new Settings()
            {
                Id = 0,
                BookTimeout = new TimeSpan (0, 10, 0),
                MemberGetMemberPrice = 3,
                VehicleCapacity = 7
            });

            LoopedRegion lis = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("F99985B9-58DE-4924-84A0-92D597B72F0D"),
                Name = "Lisboa",
                Active = true
            };
            LoopedRegion lei = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("969AF39F-D389-4ECD-8A07-F6894C71CBD7"),
                Name = "Leiria",
                Active = true
            };
            LoopedRegion coi = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("CEA8C612-6352-408C-924C-47AED2657520"),
                Name = "Coimbra",
                Active = true
            };
            LoopedRegion cas = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("4A07399F-E793-487C-98DE-C5561785A3A8"),
                Name = "Linha de Cascais",
                Active = true
            };

            context.LoopedRegion.AddOrUpdate(lis);
            context.LoopedRegion.AddOrUpdate(lei);
            context.LoopedRegion.AddOrUpdate(coi);
            context.LoopedRegion.AddOrUpdate(cas);

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("626AE3A9-7069-4080-BBD0-BF06EFA911E5"),
                Active = true,
                Name = "Rotunda de Entrecampos",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("0991CF9B-8628-4D51-9F7E-5DD62FDF40D5"),
                Active = true,
                Name = "São Sebastião - El Corte Inglês",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("C69A4ABB-3283-44F6-95AD-84B19AFA4293"),
                Active = true,
                Name = "Saldanha - Continente Bom dia Av. Defensores de Chaves",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("9835BEEC-B58B-4346-916C-AE066306DF30"),
                Active = true,
                Name = "Centro Comercial Amoreiras",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("EB786761-3F2F-4FEE-B8C5-8F4E6F61DC9A"),
                Active = true,
                Name = "Rotunda Marquês de Pombal",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("A4CADB88-5AAF-428B-BC06-47B9690E5A0B"),
                Active = true,
                Name = "Centro Comercial Colombo",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("81916645-F462-4EC4-9F1F-DB0307B2D102"),
                Active = true,
                Name = "Aeroporto de Lisboa",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("B4B303D3-CD3F-450B-B6C5-B65C147AC629"),
                Active = true,
                Name = "Gare do Oriente",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("FC64D8C1-8877-4436-93C1-A9B6194DBE08"),
                Active = true,
                Name = "Alameda Dom Afonso Henriques - Estação de Metro Alameda",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("1189D302-0913-48BB-AA29-F0DF63473CC1"),
                Active = true,
                Name = "Estação Fluvial de Belém - Museu dos Coches",
                Region = lis
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("21BB4238-89AA-4770-B11B-C48D3C3875F8"),
                Active = true,
                Name = "Continente Leiria",
                Region = lei
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("8944A198-3F5C-48E6-B69F-179669D75CDE"),
                Active = true,
                Name = "Politécnico de Leiria - ESECS",
                Region = lei
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("71216C3E-A3E1-4B27-8558-CD45479E299A"),
                Active = true,
                Name = "Pingo Doce - Estrada dos Marinheiros",
                Region = lei
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("6DEC016D-F827-4AA4-85D2-BF741FEBDBEB"),
                Active = true,
                Name = "Pingo Doce - Gândara",
                Region = lei
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("BD2DD86B-65DD-4754-9BF4-2EBD121E9FE8"),
                Active = true,
                Name = "Pingo Doce - Av. Heróis de Angola",
                Region = lei
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("6E6277BB-B589-44E7-88CC-AC5AF8FC77E5"),
                Active = true,
                Name = "Centro Paroquial Paulo VI",
                Region = coi
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("9EA59F4C-9278-4814-9C06-54ABEA92EE40"),
                Active = true,
                Name = "McDonalds - Birre",
                Region = cas
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("D58C109A-26A4-4578-8996-79859089A0AC"),
                Active = true,
                Name = "El-Leclerc de São Domingos de Rana",
                Region = cas });


            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("3D3D5026-D6CC-423B-A61C-999EF28B5DD9"),
                Active = true,
                StartRegion = lis,
                EndRegion = lei,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(1, 30, 0)
            });
            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("D25B4B83-1F6D-4314-B007-598866BD8215"),
                Active = true,
                StartRegion = lis,
                EndRegion = cas,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(0, 30, 0)
            });
            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("C88E07DD-49C4-4A14-9D9D-BFE0D39E4473"),
                Active = true,
                StartRegion = lis,
                EndRegion = coi,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(1, 30, 0)
            });
            
            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("55B5856C-89B3-4272-9CD5-2C54B6DB918B"),
                Active = true,
                StartRegion = lei,
                EndRegion = lis,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(1, 30, 0)
            });

            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("BF361E97-54DE-4ED3-949F-AF1FDB5E95C6"),
                Active = true,
                StartRegion = coi,
                EndRegion = lis,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(1, 30, 0)
            });

            context.Route.AddOrUpdate(new Route()
            {
                RouteId = Guid.Parse("9AE2CC7C-00C3-442F-98AC-74EAF5EBBDC6"),
                Active = true,
                StartRegion = cas,
                EndRegion = lis,
                Departures = new List<Route.Departure>
                {
                    new Route.Departure(DayOfWeek.Sunday, new TimeSpan(10, 0, 0))
                },
                Duration = new TimeSpan(0, 30, 0)
            });

            base.Seed(context);
        }
    }
}
