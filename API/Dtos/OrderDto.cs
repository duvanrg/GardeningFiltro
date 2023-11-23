using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public class OrderDto :  BaseEntity
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
