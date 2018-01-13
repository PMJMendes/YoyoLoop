using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVP.Startup))]
namespace MVP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
