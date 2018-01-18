using MVP.Models;
using MVP.TripExplorer;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class ExploreService
    {
        public ExploreDTO GetInitialData()
        {
            var result = new ExploreDTO();

            using (var model = new EntityModel())
            {
                result.Routes = model.Route.Include(r => r.StartRegion).Include(r => r.EndRegion).ToList();
            }

            return result;
        }

        public void GetMoreData(ExploreDTO state)
        {
        }
    }
}
