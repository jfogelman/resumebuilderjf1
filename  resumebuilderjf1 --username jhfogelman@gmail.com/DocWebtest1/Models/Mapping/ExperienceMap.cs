using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ExperienceMap : EntityTypeConfiguration<Experience>
    {
        public ExperienceMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.CompanyName)
                .HasMaxLength(50);

            this.Property(t => t.CompanyState)
                .IsFixedLength()
                .HasMaxLength(3);

            this.Property(t => t.CompanyCity)
                .HasMaxLength(50);

            this.Property(t => t.JobTitle)
                .IsFixedLength()
                .HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Experiences");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.IsCurrent).HasColumnName("IsCurrent");
            this.Property(t => t.StartDate).HasColumnName("StartDate");
            this.Property(t => t.EndDate).HasColumnName("EndDate");
            this.Property(t => t.CompanyName).HasColumnName("CompanyName");
            this.Property(t => t.CompanyState).HasColumnName("CompanyState");
            this.Property(t => t.CompanyCity).HasColumnName("CompanyCity");
            this.Property(t => t.JobTitle).HasColumnName("JobTitle");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Experiences)
                .HasForeignKey(d => d.UserID);

        }
    }
}
