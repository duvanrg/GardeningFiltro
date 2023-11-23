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
    public class OrdersRepository : GenericRepository<Order>, IOrder
    {
        private readonly gardeningContext _context;

        public OrdersRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<object>> GetDelayedOrders()
        {
            return await (
                from order in _context.Orders
                join client in _context.Clients on order.ClientId equals client.Id
                where order.DeliveryDate > order.ExpectedDate
                select new
                {
                    orderId = order.Id,
                    clientId = client.Id,
                    ExpectedDate = order.ExpectedDate,
                    DeliveredDate = order.DeliveryDate,
                    Comments = order.Comments
                }
            ).ToListAsync();
        }

    }
}
