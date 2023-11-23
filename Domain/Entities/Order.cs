using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Order: BaseEntity
{


    public DateOnly OrderDate { get; set; }

    public DateOnly ExpectedDate { get; set; }

    public DateOnly DeliveryDate { get; set; }

    public int StatusId { get; set; }

    public string Comments { get; set; }

    public int ClientId { get; set; }

    public virtual Client Client { get; set; } = null!;

    public virtual ICollection<Orderdetail> Orderdetails { get; set; } = new List<Orderdetail>();

    public virtual Status Status { get; set; } = null!;
}
