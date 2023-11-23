using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;
using Domain.Interfaces;
using Microsoft.EntityFrameworkCore;
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
        public async Task<IEnumerable<Office>> GetOfficeNoSellFruits()
        {
            return await (from office in _context.Offices
                        join employee in _context.Employees on office.Id equals employee.OfficeId into employeeGroup
                        from Subemployee in employeeGroup.DefaultIfEmpty()
                        join client in _context.Clients on Subemployee.Id equals client.EmployeeId into clientGroup
                        from Subclient in clientGroup.DefaultIfEmpty()
                        join order in _context.Orders on Subclient.Id equals order.ClientId into orderGroup
                        from Suborder in orderGroup.DefaultIfEmpty()
                        join orderDetail in _context.Orderdetails on Suborder.Id equals orderDetail.OrderId into orderDetailGroup
                        from SuborderDetail in orderDetailGroup.DefaultIfEmpty()
                        join product in _context.Products on SuborderDetail.ProductId equals product.Id into productGroup
                        from Subproduct in productGroup.DefaultIfEmpty()
                        join productLine in _context.Productlines on Subproduct.ProductLineId equals productLine.Id into productLineGroup
                        from SubproductLine in productLineGroup.DefaultIfEmpty()
                        where SubproductLine.ProductLine1 != "Frutales"
                        select office).Distinct()
                        .ToListAsync();
        }
    }
}
