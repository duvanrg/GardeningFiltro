using System;
using System.Collections.Generic;
using Domain.Entities;

namespace Domain.Interfaces;

public interface IClient : IGenericRepo<Client>
{

    Task<IEnumerable<object>> ClientNoPayment();

}
