using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class MethodPaymentConf : IEntityTypeConfiguration<Methodpayment>
    {
        public void Configure(EntityTypeBuilder<Methodpayment> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("methodpayments")
                .UseCollation("utf8mb4_general_ci");

            builder.Property(e => e.MethodPayment1).HasMaxLength(50);
        }
    }
}