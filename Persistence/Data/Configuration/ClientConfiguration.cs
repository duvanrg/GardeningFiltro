using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class ClientConf : IEntityTypeConfiguration<Client>
    {
        public void Configure(EntityTypeBuilder<Client> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("clients")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.EmployeeId, "IX_clients_CodEmployee");

            builder.HasIndex(e => e.PersonId, "IX_clients_PersonId");

            builder.HasIndex(e => e.PostalCodeId, "IX_clients_PostalCodeId");

            builder.Property(e => e.ClientName).HasMaxLength(50);
            builder.Property(e => e.Fax).HasMaxLength(50);
            builder.Property(e => e.LineAddress).HasMaxLength(100);
            builder.Property(e => e.LineAddress2).HasMaxLength(100);
            builder.Property(e => e.Phone).HasMaxLength(50);

            builder.HasOne(d => d.Employee).WithMany(p => p.Clients)
                .HasForeignKey(d => d.EmployeeId)
                .HasConstraintName("FK_clients_Employees_CodEmployee");

            builder.HasOne(d => d.Person).WithMany(p => p.Clients).HasForeignKey(d => d.PersonId);

            builder.HasOne(d => d.PostalCode).WithMany(p => p.Clients).HasForeignKey(d => d.PostalCodeId);
        }
    }
}