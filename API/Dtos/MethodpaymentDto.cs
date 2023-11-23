using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class MethodpaymentDto :  BaseEntity
{


    public string MethodPayment1 { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
}
