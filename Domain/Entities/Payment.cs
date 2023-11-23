using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Payment: BaseEntity
{


    public int MethodId { get; set; }

    public string TransactionId { get; set; }

    public DateOnly PaymentDate { get; set; }

    public decimal Total { get; set; }

    public int ClienteId { get; set; }

    public virtual Client Cliente { get; set; } = null!;

    public virtual Methodpayment Method { get; set; } = null!;
}
