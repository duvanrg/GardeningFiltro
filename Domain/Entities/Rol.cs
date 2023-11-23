﻿using System;
using System.Collections.Generic;

namespace Domain.Entities;

public partial class Rol: BaseEntity
{


    public string RolName { get; set; } = null!;

    public virtual ICollection<User> Usuarios { get; set; } = new List<User>();
}
