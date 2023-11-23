using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Methodpayment: BaseEntity
{


    public string MethodPayment1 { get; set; } = null!;

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
}
