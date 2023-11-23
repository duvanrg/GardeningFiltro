using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class PaymentConf : IEntityTypeConfiguration<Payment>
    {
        public void Configure(EntityTypeBuilder<Payment> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("payments")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.ClienteId, "IX_payments_ClienteId");

            builder.HasIndex(e => e.MethodId, "IX_payments_MethodId");

            builder.Property(e => e.TransactionId).HasMaxLength(50);

            builder.HasOne(d => d.Cliente).WithMany(p => p.Payments)
                .HasForeignKey(d => d.ClienteId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            builder.HasOne(d => d.Method).WithMany(p => p.Payments).HasForeignKey(d => d.MethodId);
        }
    }
}