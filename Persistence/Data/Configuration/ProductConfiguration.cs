using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class ProductConf : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("products")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.SupplierId, "IX_products_IdSupplier");

            builder.HasIndex(e => e.ProductLineId, "IX_products_ProductLine");

            builder.HasOne(d => d.Supplier).WithMany(p => p.Products)
                .HasForeignKey(d => d.SupplierId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            builder.HasOne(d => d.ProductLine).WithMany(p => p.Products)
                .HasForeignKey(d => d.ProductLineId)
                .OnDelete(DeleteBehavior.ClientSetNull);
        }
    }
}