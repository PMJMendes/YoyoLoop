using MVP.Models;
using MVP.Models.Entities;
using MVP.Checkout;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace MVP.Services
{
    public class CheckoutService
    {
        public CheckoutDTO GetInitialData()
        {
            var result = new CheckoutDTO();

            return result;
        }
    }
}
