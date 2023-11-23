using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class ClientDto :  BaseEntity
{


    public string ClientName { get; set; }

    public int PersonId { get; set; }

    public string Phone { get; set; }

    public string Fax { get; set; }

    public string LineAddress { get; set; }

    public string LineAddress2 { get; set; }

    public int PostalCodeId { get; set; }

    public int EmployeeId { get; set; }

    public decimal CreditLimit { get; set; }

    public virtual Employee Employee { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Person Person { get; set; } = null!;

    public virtual Postalcode PostalCode { get; set; } = null!;
}
