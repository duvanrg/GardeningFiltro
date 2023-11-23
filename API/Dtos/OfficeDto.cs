using System;
using System.Collections.Generic;
using Domain.Entities;

namespace API.Dtos;

public partial class OfficeDto:  BaseEntityS
{

    public int PostalCodeId { get; set; }

    public string Phone { get; set; } = null!;

    public string AddressLine1 { get; set; } = null!;

    public string AddressLine2 { get; set; }

    public virtual ICollection<Employee> Employees { get; set; } = new List<Employee>();

    public virtual Postalcode PostalCode { get; set; } = null!;
}
