using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Persistencia.Data.Configuration
{
    public class EmployeeConf : IEntityTypeConfiguration<Employee>
    {
        public void Configure(EntityTypeBuilder<Employee> builder)
        {
            builder.HasKey(e => e.Id).HasName("PRIMARY");

            builder
                .ToTable("employees")
                .UseCollation("utf8mb4_general_ci");

            builder.HasIndex(e => e.OfficeId, "IX_Employees_OfficeCode");

            builder.HasIndex(e => e.PersonId, "IX_Employees_PersonId");
            builder.HasIndex(e => e.ManagerId, "IX_Employees_ManagerId");

            builder.Property(e => e.Extention).HasMaxLength(50);

            builder.HasOne(d => d.Office).WithMany(p => p.Employees)
                .HasForeignKey(d => d.OfficeId)
                .HasConstraintName("FK_Employees_offices_OfficeCode");

            builder.HasOne(d => d.Person).WithMany(p => p.Employees)
                .HasForeignKey(d => d.PersonId)
                .HasConstraintName("FK_Employees_persons_PersonId");

            builder.HasOne(d => d.Manager).WithMany(p => p.manager)
                .HasForeignKey(d => d.ManagerId)
                .HasConstraintName("IX_Employees_ManagerId");
        }
    }
}