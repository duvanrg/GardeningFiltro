using System;
using System.Collections.Generic;
using Domain.Entities;

namespace Domain.Interfaces;

public interface IOffice : IGenericRepoS<Office>
{
        Task<IEnumerable<Office>> GetOfficeNoSellFruits();
}
