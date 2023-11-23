using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class ProductlineConf : IEntityTypeConfiguration<Productline>
    {
        public void Configure(EntityTypeBuilder<Productline> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("productlines")
                .UseCollation("utf8mb4_general_ci");

            builder.Property(e => e.DescriptionHtml).HasMaxLength(50);
            builder.Property(e => e.DescriptionText).HasMaxLength(50);
            builder.Property(e => e.Image).HasMaxLength(50);
            builder.Property(e => e.ProductLine1).HasMaxLength(50);
        }
    }
}