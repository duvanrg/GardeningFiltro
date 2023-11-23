using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Orderdetail: BaseEntity
{


    public string ProductId { get; set; }

    public int Quantity { get; set; }

    public int UnitPrice { get; set; }

    public short LineNumber { get; set; }

    public int OrderId { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product Product { get; set; }
}
