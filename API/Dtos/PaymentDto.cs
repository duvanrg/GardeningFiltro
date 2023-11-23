using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class PaymentDto :  BaseEntity
{


    public int MethodId { get; set; }

    public string TransactionId { get; set; }

    public DateOnly PaymentDate { get; set; }

    public decimal Total { get; set; }

    public int ClienteId { get; set; }

    public virtual Client Cliente { get; set; } = null!;

    public virtual Methodpayment Method { get; set; } = null!;
}
