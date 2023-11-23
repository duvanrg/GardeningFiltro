using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class User: BaseEntity
{


    public string Username { get; set; }

    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;

    public virtual ICollection<Refreshtoken> Refreshtokens { get; set; } = new List<Refreshtoken>();

    public virtual ICollection<Rol> Rols { get; set; } = new List<Rol>();
}
