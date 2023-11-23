using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class orderdetailConf : IEntityTypeConfiguration<Orderdetail>
    {
        public void Configure(EntityTypeBuilder<Orderdetail> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("orderdetails")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.OrderId, "IX_orderdetails_OrderId");

            builder.HasIndex(e => e.ProductId, "IX_orderdetails_ProductCode");

            builder.HasOne(d => d.Order).WithMany(p => p.Orderdetails)
                .HasForeignKey(d => d.OrderId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            builder.HasOne(d => d.Product).WithMany(p => p.Orderdetails).HasForeignKey(d => d.ProductId);
        }
    }
}