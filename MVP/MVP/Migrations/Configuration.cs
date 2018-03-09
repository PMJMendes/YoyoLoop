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
                SettingsId = Guid.Parse("0771CC70-AF4A-452B-AE8F-F96314C31C55"),
                BookTimeout = new TimeSpan (0, 10, 0),
                VehicleCapacity = 7,
                LastMinuteThreshold = 2,
                MinTimeBookLastMinute = new TimeSpan (0, 30, 0)
            });

            LoopedRegion lis = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("F99985B9-58DE-4924-84A0-92D597B72F0D"),
                Name = "Lisboa",
                Active = true
            };
            context.LoopedRegion.AddOrUpdate(lis);
            LoopedRegion lei = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("969AF39F-D389-4ECD-8A07-F6894C71CBD7"),
                Name = "Leiria",
                Active = true,
            };
            context.LoopedRegion.AddOrUpdate(lei);
            LoopedRegion coi = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("CEA8C612-6352-408C-924C-47AED2657520"),
                Name = "Coimbra",
                Active = true,
            };
            context.LoopedRegion.AddOrUpdate(coi);
            LoopedRegion cas = new LoopedRegion()
            {
                LoopedRegionId = Guid.Parse("4A07399F-E793-487C-98DE-C5561785A3A8"),
                Name = "Linha de Cascais",
                Active = true,
            };
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
                Region = lis,
                Default = true
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
                Region = lei,
                Default = true
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
                Region = coi,
                Default = true
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
                Region = cas,
                Default = true
            });

            Route lis_lei = new Route()
            {
                RouteId = Guid.Parse("3D3D5026-D6CC-423B-A61C-999EF28B5DD9"),
                Active = true,
                StartRegion = lis,
                EndRegion = lei,
                Duration = new TimeSpan(1, 30, 0),
            };
            context.Route.AddOrUpdate(lis_lei);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("8E0E9BE3-CDF5-4670-A99C-1C0EFB39980A"),
                Route = lis_lei,
                Type = Fare.FareType.STANDARD,
                Price = 10
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("92875EFD-837A-4504-842A-7FE385F16467"),
                Route = lis_lei,
                Type = Fare.FareType.LASTMINUTE,
                Price = 12
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("11D00BF6-C0CA-498D-AC94-14869EA30177"),
                Route = lis_lei,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("83E1808F-D27A-400F-91E1-29DFAEE24752"),
                Route = lis_lei,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 8
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C239AFC3-3854-4373-B037-53B65ED38F85"),
                Route = lis_lei,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan (10,0,0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1D674DC2-4907-4249-937A-5A3979C6118C"),
                Route = lis_lei,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C1C75C5B-8510-4EF8-8B17-862384029BE6"),
                Route = lis_lei,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("A19FFEC7-B3A9-455A-B1A8-EE87D8A9581A"),
                Route = lis_lei,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("397D9687-F64D-4637-855E-492951F82EF1"),
                Route = lis_lei,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C1C9095B-6FE6-4B83-8B50-1C58F652CDA2"),
                Route = lis_lei,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("E2F63ECE-9BB7-431D-965D-B0B3D8BFA21A"),
                Route = lis_lei,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            Route lis_cas = new Route()
            {
                RouteId = Guid.Parse("D25B4B83-1F6D-4314-B007-598866BD8215"),
                Active = true,
                StartRegion = lis,
                EndRegion = cas,
                Duration = new TimeSpan(0, 30, 0),
            };
            context.Route.AddOrUpdate(lis_cas);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("4313F641-9C93-4523-B896-D1050D902636"),
                Route = lis_cas,
                Type = Fare.FareType.STANDARD,
                Price = 5
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("5A3F5D88-CC6F-44B7-ABA0-D61596288206"),
                Route = lis_cas,
                Type = Fare.FareType.LASTMINUTE,
                Price = 7
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("BA500341-C9F0-4A36-8748-4B3A3C33089E"),
                Route = lis_cas,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("A77FBB98-62D0-450B-BDF4-96E85B6CB816"),
                Route = lis_cas,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 4
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("218F0008-C0D6-4FBF-990E-BF3AA66FAA82"),
                Route = lis_cas,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("483A2B51-A1A5-4D3A-B1CC-1EE2D1411A4B"),
                Route = lis_cas,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7D1E0FFF-A70A-4ABB-9B12-7D8DAB1976CD"),
                Route = lis_cas,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7053C002-90E6-4FEF-9A8F-EECA6ADC6EC0"),
                Route = lis_cas,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("CE5D2039-BEC7-4CD9-859B-A54C3EF176D9"),
                Route = lis_cas,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C0FAAD96-7651-4094-8093-D0F74D68FC25"),
                Route = lis_cas,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7A691E52-64C3-4497-B437-D22EDA31F87F"),
                Route = lis_cas,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            Route lis_coi = new Route()
            {
                RouteId = Guid.Parse("C88E07DD-49C4-4A14-9D9D-BFE0D39E4473"),
                Active = true,
                StartRegion = lis,
                EndRegion = coi,
                Duration = new TimeSpan(1, 30, 0),
            };
            context.Route.AddOrUpdate(lis_coi);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("FFB0B53A-FE2A-41EB-AE71-E520C7C900C3"),
                Route = lis_coi,
                Type = Fare.FareType.STANDARD,
                Price = 12
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("451D51C8-7F4A-410C-A385-FAEC1B865937"),
                Route = lis_coi,
                Type = Fare.FareType.LASTMINUTE,
                Price = 15
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("0D69BC8B-381A-4D92-8008-8B90DC4E922D"),
                Route = lis_coi,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("6693A59A-9CF1-4219-AED5-4F6AA1E9D5F6"),
                Route = lis_coi,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 9
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B20B7C94-C784-450E-B6C2-251B8BD2EAC1"),
                Route = lis_coi,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("6E653093-1261-4CE8-8911-C4B3933DFADA"),
                Route = lis_coi,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("23CB9AA1-9286-4580-9843-6B8ED4675CF7"),
                Route = lis_coi,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("378EA9E6-7F55-46CA-BAA9-A224C3A671DC"),
                Route = lis_coi,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F56BA714-394D-42A4-9046-797360FAE28D"),
                Route = lis_coi,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("FB1E0E52-019C-48BB-9BD9-6A066BA83A29"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("DBD69A11-E57D-414E-9F2B-6685522FAD92"),
                Route = lis_coi,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            Route lei_lis = new Route()
            {
                RouteId = Guid.Parse("55B5856C-89B3-4272-9CD5-2C54B6DB918B"),
                Active = true,
                StartRegion = lei,
                EndRegion = lis,
                Duration = new TimeSpan(1, 30, 0),
            };
            context.Route.AddOrUpdate(lei_lis);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("F8D86668-774D-432A-A2C4-18AC83BAACB4"),
                Route = lei_lis,
                Type = Fare.FareType.STANDARD,
                Price = 10
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("7C5F7EDA-7A82-4ADB-952D-C0827198AB10"),
                Route = lei_lis,
                Type = Fare.FareType.LASTMINUTE,
                Price = 12
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("C15FDC88-58B4-47EB-BDB6-5321B61DF510"),
                Route = lei_lis,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("44D16C71-6077-4145-9605-7C732F2D7246"),
                Route = lei_lis,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 8
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("DF0EF468-BB50-49CE-946C-3CC8CC5B1A8B"),
                Route = lei_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("93E50282-4509-4A5D-B7E0-FFB96E2A8501"),
                Route = lei_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7E2A874A-276D-4742-AB66-676EB86BF027"),
                Route = lei_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("AF0FA82C-C67A-4BD5-B315-16C1793FE80F"),
                Route = lei_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1B7D2284-8EEF-4C0E-8EEF-F42D2D7F4F00"),
                Route = lei_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4AB95A73-2CD4-48A3-BBE2-24CDB40A2E97"),
                Route = lei_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("FF87760E-42D8-446A-AFE3-F3246B873FA4"),
                Route = lei_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            Route coi_lis = new Route()
            {
                RouteId = Guid.Parse("BF361E97-54DE-4ED3-949F-AF1FDB5E95C6"),
                Active = true,
                StartRegion = coi,
                EndRegion = lis,
                Duration = new TimeSpan(1, 30, 0),
            };
            context.Route.AddOrUpdate(coi_lis);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("E6D943B2-D8F4-461F-B394-7EF0C72838B0"),
                Route = coi_lis,
                Type = Fare.FareType.STANDARD,
                Price = 12
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("D0DD4700-BB26-4F3E-8170-A475E78D1ABA"),
                Route = coi_lis,
                Type = Fare.FareType.LASTMINUTE,
                Price = 15
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("DB90C275-FB19-48EE-85C3-885AB2E9DC0D"),
                Route = coi_lis,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("E112F2AF-3E7E-4F10-BB72-235377926B57"),
                Route = coi_lis,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 9
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("37ABE582-7061-4C75-A9D5-40A621810EF3"),
                Route = coi_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4C20A9C3-EACB-40FA-A5E9-67D88F1DBFF2"),
                Route = coi_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("8D36E85F-0475-46B7-8201-B504EB156E90"),
                Route = coi_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("23CC650A-CD4D-4DB1-8B49-B02F9239B2FF"),
                Route = coi_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1CB2BDB3-E32C-495E-9EC5-EE83AFA3D417"),
                Route = coi_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("2B388801-3BCD-4829-AFF7-189E09B2E658"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("991F915B-1C4F-451E-840F-4359269FA068"),
                Route = coi_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            Route cas_lis = new Route()
            {
                RouteId = Guid.Parse("9AE2CC7C-00C3-442F-98AC-74EAF5EBBDC6"),
                Active = true,
                StartRegion = cas,
                EndRegion = lis,
                Duration = new TimeSpan(0, 30, 0),
            };
            context.Route.AddOrUpdate(cas_lis);
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("2BC8BE70-3FD9-46CA-B26D-A69452BD3CB5"),
                Route = cas_lis,
                Type = Fare.FareType.STANDARD,
                Price = 5
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("6D5D7C3D-32A6-4FA7-AB1C-4322E92F1356"),
                Route = cas_lis,
                Type = Fare.FareType.LASTMINUTE,
                Price = 7
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("47C7EEE6-BEE4-4B4D-89C7-D17D1FDF74D8"),
                Route = cas_lis,
                Type = Fare.FareType.MEMBERGETMEMBER,
                Price = 3
            });
            context.Fare.AddOrUpdate(new Fare()
            {
                FareId = Guid.Parse("6E332D73-2BCE-4C85-8F8D-8BC773AC11DF"),
                Route = cas_lis,
                Type = Fare.FareType.PROMOTIONAL,
                Price = 4
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("9A916926-CB02-4225-8AC3-920F378D4403"),
                Route = cas_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("18DC1646-C35D-4466-B26A-F794D5EA3CA4"),
                Route = cas_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("A01BAD88-A95D-470D-93CA-8BD0BAFEFC51"),
                Route = cas_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("EBA95F31-7B7C-4D51-B29D-A0F7B6E7328D"),
                Route = cas_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("216EEDC4-67B4-4482-92E4-E38C4AE6E02B"),
                Route = cas_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("0470E81E-ADA7-4623-AFE8-D2AC34A8BB65"),
                Route = cas_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("05634868-06E6-4DE2-85CD-8959A4FEA1B6"),
                Route = cas_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(16, 0, 0)
            });

            base.Seed(context);
        }
    }
}
