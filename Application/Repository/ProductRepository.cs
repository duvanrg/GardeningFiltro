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
    public class ProductRepository : GenericRepositoryS<Product>, IProduct
    {
        private readonly gardeningContext _context;

        public ProductRepository(gardeningContext context) : base(context)
        {
            _context = context;
        }

        public async Task<IEnumerable<object>> more3000Euros()
        {
            return await (from product in _context.Products
                            from orderDetail in product.Orderdetails
                            where (orderDetail.Order.StatusId == 1 || orderDetail.Order.StatusId == 3) &&
                                orderDetail.UnitPrice * orderDetail.Quantity > 3000
                            group new
                            {
                                ProductName = orderDetail.Product.Name,
                                UnitsSold = orderDetail.Quantity,
                                TotalSales = orderDetail.UnitPrice * orderDetail.Quantity,
                                TotalSalesWithIVA = orderDetail.UnitPrice * orderDetail.Quantity * 1.21m
                            } by new
                            {
                                ProductName = orderDetail.Product.Name,
                                UnitsSold = orderDetail.Quantity,
                                TotalSales = orderDetail.UnitPrice * orderDetail.Quantity,
                                TotalSalesWithIVA = orderDetail.UnitPrice * orderDetail.Quantity * 1.21m
                            } into groupedResult
                            select new
                            {
                                ProductName = groupedResult.Key.ProductName,
                                UnitsSold = groupedResult.Key.UnitsSold,
                                TotalSales = groupedResult.Key.TotalSales,
                                TotalSalesWithIVA = groupedResult.Key.TotalSalesWithIVA
                            }).ToListAsync();


        }
    }
}
