using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class PersonConf : IEntityTypeConfiguration<Person>
    {
        public void Configure(EntityTypeBuilder<Person> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("persons")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.PersonTypeId, "IX_persons_PersonTypeId");

            builder.Property(e => e.Email).HasMaxLength(50);
            builder.Property(e => e.FirstName).HasMaxLength(50);
            builder.Property(e => e.LastName1).HasMaxLength(50);
            builder.Property(e => e.LastName2).HasMaxLength(50);

            builder.HasOne(d => d.PersonType).WithMany(p => p.People).HasForeignKey(d => d.PersonTypeId);
        }
    }
}