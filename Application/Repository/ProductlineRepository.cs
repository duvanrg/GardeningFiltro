using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;
using Domain.Interfaces;
using Persistence;
using Persistence.Data;

namespace Application.Repository
{
    public class ProductlineRepository : GenericRepository<Productline>, IProductline
    {
        private readonly gardeningContext _context;

        public ProductlineRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
