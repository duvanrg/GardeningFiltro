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
    public class OfficeRepository : GenericRepositoryS<Office>, IOffice
    {
        private readonly gardeningContext _context;

        public OfficeRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }
    }
}
