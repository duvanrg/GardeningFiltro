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
    public class CityRepository : GenericRepository<City>, ICity
    {
        private readonly gardeningContext _context;

        public CityRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
