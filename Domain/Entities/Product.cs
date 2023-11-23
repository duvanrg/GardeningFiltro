using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Product : BaseEntityS
{

    public string Name { get; set; } = null!;

    public int ProductLineId { get; set; }

    public string Dimensions { get; set; }

    public int SupplierId { get; set; }

    public string Description { get; set; }

    public short StockQuantity { get; set; }

    public decimal SellingPrice { get; set; }

    public decimal SupplierPrice { get; set; }

    public virtual Supplier Supplier { get; set; } = null!;

    public virtual ICollection<Orderdetail> Orderdetails { get; set; } = new List<Orderdetail>();

    public virtual Productline ProductLine { get; set; } = null!;
}
