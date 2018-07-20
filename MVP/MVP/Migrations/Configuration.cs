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
            context.UpdateService.AddOrUpdate(new Models.Entities.UpdateService()
            {
                UpdateServiceId = Guid.Parse("DBD2C631-05E6-43EC-B86C-34B03A283906"),
                LastRun = DateTime.Now,
                LastDaily = DateTime.Today,
                WarningThreshold = new TimeSpan(0, 30, 0)
            });

            context.Settings.AddOrUpdate(new Settings()
            {
                SettingsId = Guid.Parse("0771CC70-AF4A-452B-AE8F-F96314C31C55"),
                BookTimeout = new TimeSpan (0, 10, 0),
                VehicleCapacity = 7,
                LastMinuteThreshold = 2,
                MinTimeBookLastMinute = new TimeSpan (0, 15, 0)
            });

            context.Promocode.AddOrUpdate(new Promocode()
            {
                PromocodeId = Guid.Parse("9E77E2F3-1B9C-4E65-9BB0-3AB9448378B6"),
                Active = true,
                Code = "YOYOLOOP",
                StartDate = new DateTime(2018, 1, 1),
                EndDate = new DateTime(2050, 12, 31)
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
                AccessPointId = Guid.Parse("0991CF9B-8628-4D51-9F7E-5DD62FDF40D5"),
                Active = true,
                Name = "Saldanha",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3112.2048154685012!2d-9.145343684245876!3d38.73606197959589!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1933a055573db3%3A0xa8537ae3be555261!2sEstacionamento+Arco+do+Cego!5e0!3m2!1sen!2spt!4v1520944686536",
                Region = lis,
                Default = true
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("C69A4ABB-3283-44F6-95AD-84B19AFA4293"),
                Active = true,
                Name = "Marquês de Pombal",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3112.6877276049668!2d-9.153011484246155!3d38.72497787959761!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1933772ddf7079%3A0xbd88fe8d5ed78a8f!2sMarqu%C3%AAs+de+Pombal!5e0!3m2!1sen!2spt!4v1520944882384",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("9835BEEC-B58B-4346-916C-AE066306DF30"),
                Active = true,
                Name = "Amoreiras",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3112.7653897715336!2d-9.164212184246127!3d38.72319507959786!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd19336f4880d94b%3A0xfa49cdd80dee6e0f!2sAmoreiras+Shopping+Center!5e0!3m2!1sen!2spt!4v1520944957439",
                Region = lis
            });
            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("EB786761-3F2F-4FEE-B8C5-8F4E6F61DC9A"),
                Active = true,
                Name = "Oriente",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3110.8195655014065!2d-9.10153358424507!3d38.76784227959075!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd193187d114c809%3A0xbe2b7b794170743e!2zRXN0YcOnw6NvIGRvIE9yaWVudGU!5e0!3m2!1sen!2spt!4v1520945058596",
                Region = lis
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("21BB4238-89AA-4770-B11B-C48D3C3875F8"),
                Active = true,
                Name = "Largo da República",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3067.939306646181!2d-8.812437284221797!3d39.74101417944929!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd227368de1d62c1%3A0x2db0b26cb97cb3e2!2sLargo+da+Rep%C3%BAblica%2C+2400-137+Leiria!5e0!3m2!1sen!2spt!4v1520945189527",
                Region = lei,
                Default = true
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("6E6277BB-B589-44E7-88CC-AC5AF8FC77E5"),
                Active = true,
                Name = "McDonald's Fernão Magalhães",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3046.6394507403716!2d-8.439764484210219!3d40.21708247938885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd22f91ce79f4b93%3A0x9336a37fbc5659a5!2sMcDonald&#39;s+Coimbra+Fern%C3%A3o+Magalh%C3%A3es!5e0!3m2!1sen!2spt!4v1520945436513",
                Region = coi,
                Default = true
            });

            context.AccessPoint.AddOrUpdate(new AccessPoint()
            {
                AccessPointId = Guid.Parse("D58C109A-26A4-4578-8996-79859089A0AC"),
                Active = true,
                Name = "E.Leclerc SD Rana",
                GoogleLocation = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3113.3628319905233!2d-9.332556684246455!3d38.70947797959993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd1ecf25912024f1%3A0xd5643e4a38faa7de!2sE.Leclerc+Caisdis%2C+Sociedade+de+Distribui%C3%A7%C3%A3o+S.A!5e0!3m2!1sen!2spt!4v1520945557352",
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
                DepartureId = Guid.Parse("13ED2320-CA13-4864-A30A-B18FE94D562F"),
                Route = lis_lei,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("CA3A9F8A-37CE-4E58-B602-CAD736B28C10"),
                Route = lis_lei,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("317FB75A-F4CD-4759-87DA-1059BB910537"),
                Route = lis_lei,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("EEF65D19-37D1-46C0-AFC8-890F6C6A5889"),
                Route = lis_lei,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F803951C-7AF2-4553-8C6E-D7B602D5B20C"),
                Route = lis_lei,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D7B75163-EEE8-4038-9258-F6ECED21454A"),
                Route = lis_lei,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("9278024C-8657-4C41-87DE-573FBF67157F"),
                Route = lis_lei,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D3DB6ED0-E29B-4D7B-9EAF-21C2A074E9E6"),
                Route = lis_lei,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7283E3AC-F860-4A70-BC25-F09AABB61ABC"),
                Route = lis_lei,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("8EC44D09-F97D-49AD-B470-BC897B17305A"),
                Route = lis_lei,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("22C72D39-6174-4245-A2C9-76390BB9D6C9"),
                Route = lis_lei,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("21669C6D-29A4-4B72-9413-4233730AC235"),
                Route = lis_lei,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(19, 0, 0)
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
                DayType = DayType.MONDAY,
                Time = new TimeSpan(8, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("56C94087-E775-489A-A865-CF632B62B509"),
                Route = lis_cas,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(17, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("96579292-35B0-4D54-8372-AAEE19A82DF1"),
                Route = lis_cas,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(19, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F03ECD3F-818E-4430-B0DD-994ADFC73005"),
                Route = lis_cas,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(21, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4E3AB471-01DD-48B3-ADF8-6DE5724CB931"),
                Route = lis_cas,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(8, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("E0D5AB65-4427-4935-B5DB-9760878BCA22"),
                Route = lis_cas,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(17, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("35CB5B01-CFE3-4ED7-BE2E-15DFEAB47A5B"),
                Route = lis_cas,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(19, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B6FE8CCE-532A-4FEA-9CCC-760A5D6AF3C8"),
                Route = lis_cas,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(21, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("2B90FD7D-B4F2-4D8A-B77C-F001EADB0657"),
                Route = lis_cas,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(8, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("E32A23BA-DB24-4CC8-8E7F-7E9089A17684"),
                Route = lis_cas,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(17, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F2EB4CD3-A4E9-482E-A429-D221DF357D88"),
                Route = lis_cas,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(19, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("3EB0632F-CDA6-4C82-966F-9D6225ACE907"),
                Route = lis_cas,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(21, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("5AC6FABC-8DC0-4CDC-A4DC-4DAD955F93CC"),
                Route = lis_cas,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(8, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D037C5D3-0EFD-452D-90B6-EC19D0EFDCDC"),
                Route = lis_cas,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(17, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("6348AE74-6778-4232-AC08-8772F066BC47"),
                Route = lis_cas,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(19, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("FCBED9B4-5694-4249-AA9C-BAD789A31A0E"),
                Route = lis_cas,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(21, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("59F6FE4B-1F1F-4AA0-BD11-6A008C4A3FDD"),
                Route = lis_cas,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(8, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("93CC7F2E-1194-4D2D-837E-76DFA9B72A03"),
                Route = lis_cas,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(17, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("DBFAAF9D-E72E-411A-ADE0-9098A29A7434"),
                Route = lis_cas,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(19, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("37B55232-2B8B-4B32-8D75-8890D1EF6282"),
                Route = lis_cas,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(21, 30, 0)
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
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("23CB9AA1-9286-4580-9843-6B8ED4675CF7"),
                Route = lis_coi,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(7, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("378EA9E6-7F55-46CA-BAA9-A224C3A671DC"),
                Route = lis_coi,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F56BA714-394D-42A4-9046-797360FAE28D"),
                Route = lis_coi,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("217AB38F-AE85-4AEE-8ABE-0ECD74DB7F5A"),
                Route = lis_coi,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(7, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("46537013-2B3D-40A5-9F1F-BE409170F126"),
                Route = lis_coi,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1BD9FB24-3197-421D-92F7-3DBFF78EE802"),
                Route = lis_coi,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("896F4BAB-8280-4588-AFDD-8ABF28B90179"),
                Route = lis_coi,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(7, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("44C6BED1-2AA8-499A-A2FC-DCF19AE259BF"),
                Route = lis_coi,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("5EBCA1DA-6627-473D-8528-4DAC225A85CC"),
                Route = lis_coi,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("29FE4C49-6921-4AD2-9A9C-5EDCFAC0BF4B"),
                Route = lis_coi,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(7, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B0EE3816-4EAF-4AA7-84ED-191EC8D11F0A"),
                Route = lis_coi,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("59E3EA41-FAC2-41D4-AA9F-0C83039040E5"),
                Route = lis_coi,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D2EC84AD-5302-48BE-A34C-42B2A39E98FF"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(7, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("28C2C726-C091-469C-BD86-2048D4A56460"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("6A6DBDCB-F480-4006-9E85-ED4E35A0D1AB"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("378EC022-605C-4271-B043-29094630393A"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(8, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("3774BA3C-B097-4EBA-96F5-2DF1866CA3F4"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(14, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("BE0DF58D-2A69-468D-9FC3-41396B80593C"),
                Route = lis_coi,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(20, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("FB1E0E52-019C-48BB-9BD9-6A066BA83A29"),
                Route = lis_coi,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(10, 0, 0)
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
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("93E50282-4509-4A5D-B7E0-FFB96E2A8501"),
                Route = lei_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(17, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("7E2A874A-276D-4742-AB66-676EB86BF027"),
                Route = lei_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(21, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("AF0FA82C-C67A-4BD5-B315-16C1793FE80F"),
                Route = lei_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1B7D2284-8EEF-4C0E-8EEF-F42D2D7F4F00"),
                Route = lei_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4AB95A73-2CD4-48A3-BBE2-24CDB40A2E97"),
                Route = lei_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("FF87760E-42D8-446A-AFE3-F3246B873FA4"),
                Route = lei_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("2C753493-ECF5-42A7-8981-D2F1E007EA14"),
                Route = lei_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(15, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("594BE6F6-FE22-454F-9634-84C2A169A2A7"),
                Route = lei_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(17, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("942482F4-9592-4044-9F1A-B8ABBDD6F6B8"),
                Route = lei_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(21, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("3C2E3627-25D6-4929-B78E-0D75694800EA"),
                Route = lei_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(12, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D0535CC9-DD27-4ACE-BD0B-45BA7A6E88FD"),
                Route = lei_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(17, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("2387B344-D36F-4C7F-BC88-185F2B64F525"),
                Route = lei_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(21, 0, 0)
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
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4C20A9C3-EACB-40FA-A5E9-67D88F1DBFF2"),
                Route = coi_lis,
                DayType = DayType.SUNDAY,
                Time = new TimeSpan(19, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("8D36E85F-0475-46B7-8201-B504EB156E90"),
                Route = coi_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("23CC650A-CD4D-4DB1-8B49-B02F9239B2FF"),
                Route = coi_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1CB2BDB3-E32C-495E-9EC5-EE83AFA3D417"),
                Route = coi_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(22, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("3887410A-AC71-4BAC-82A9-8C143F743FA9"),
                Route = coi_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C544183E-751E-405A-A699-D19A0DACBC12"),
                Route = coi_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("62BFE003-D0B6-4783-812F-FADB207271B2"),
                Route = coi_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(22, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("991A2B37-A04F-4C64-BDC9-E51DD812391A"),
                Route = coi_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D6E002F0-60B9-449C-9C21-99CBED4566B7"),
                Route = coi_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("DF879FA1-C215-4AB4-B72A-C2EA3B18693B"),
                Route = coi_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(22, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("4B7D1FC0-D2AA-4587-9C88-13579F757960"),
                Route = coi_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("EA04ACDC-A163-43DC-A7AF-D0FCB6E291AF"),
                Route = coi_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("8AAEDCAF-3417-49C7-8C1F-FF5D75B855FF"),
                Route = coi_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(22, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1A619424-0E56-4E2A-ACE0-7DA57CC32559"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(10, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("D3D77526-F886-4B84-AB17-CDF1BFB8C6D2"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(16, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("BA5347B2-12E7-4B47-9E49-47178ADFB8F2"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(22, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("0700DD65-6563-4CE4-B4D6-E82EDE23052A"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(11, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B2552BA4-2B3B-4BA5-8E67-782ADF217D5A"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(17, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("6E494523-0EFD-41B1-A76E-B10238D45C0D"),
                Route = coi_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(23, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("2B388801-3BCD-4829-AFF7-189E09B2E658"),
                Route = coi_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(13, 0, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("991F915B-1C4F-451E-840F-4359269FA068"),
                Route = coi_lis,
                DayType = DayType.SATURDAY,
                Time = new TimeSpan(19, 0, 0)
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
                DayType = DayType.MONDAY,
                Time = new TimeSpan(7, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("18DC1646-C35D-4466-B26A-F794D5EA3CA4"),
                Route = cas_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(9, 15, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("A01BAD88-A95D-470D-93CA-8BD0BAFEFC51"),
                Route = cas_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(18, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("EBA95F31-7B7C-4D51-B29D-A0F7B6E7328D"),
                Route = cas_lis,
                DayType = DayType.MONDAY,
                Time = new TimeSpan(20, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("1D115F0E-89DE-4347-8D3F-2A330F4D5E1E"),
                Route = cas_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(7, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B4EB282B-708B-4989-828B-E6A205056ADF"),
                Route = cas_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(9, 15, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("6226473A-BE9D-4B47-9E95-7FCD4C242BE5"),
                Route = cas_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(18, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("726EC86D-2D53-428E-AAEA-C8BBBEDDBAEF"),
                Route = cas_lis,
                DayType = DayType.TUESDAY,
                Time = new TimeSpan(20, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("F04F87FA-183B-452D-88F4-D4AC01CBB343"),
                Route = cas_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(7, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("035349FA-BB0F-4E39-B695-ADDF5290B0B5"),
                Route = cas_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(9, 15, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("07FED86F-4317-4DF8-9DE7-F8CD04979C0B"),
                Route = cas_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(18, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("67927B0C-0D1C-4EE7-A76D-9C7B83C54398"),
                Route = cas_lis,
                DayType = DayType.WEDNESDAY,
                Time = new TimeSpan(20, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("43301E72-0E14-4154-B045-E6DBEF3BA544"),
                Route = cas_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(7, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("8EA5A9E7-A0DC-48F8-913D-8641BDC54ADB"),
                Route = cas_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(9, 15, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("64C13A01-C4CD-4BA5-9F24-472D17E0BFC1"),
                Route = cas_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(18, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("813E3D37-6383-4EA9-B1B1-006043CB414E"),
                Route = cas_lis,
                DayType = DayType.THURSDAY,
                Time = new TimeSpan(20, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("037D2A78-01AE-40F1-935F-40F7EA1588DC"),
                Route = cas_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(7, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("C56CFF6E-7CBF-430F-BA19-77751A6DA3D6"),
                Route = cas_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(9, 15, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("B2CFC733-67E7-4781-B441-5CE185A3ED48"),
                Route = cas_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(18, 30, 0)
            });
            context.Departure.AddOrUpdate(new Departure()
            {
                DepartureId = Guid.Parse("34EA9E27-5A58-4165-9487-B01A39E28135"),
                Route = cas_lis,
                DayType = DayType.FRIDAY,
                Time = new TimeSpan(20, 30, 0)
            });

            base.Seed(context);
        }
    }
}
