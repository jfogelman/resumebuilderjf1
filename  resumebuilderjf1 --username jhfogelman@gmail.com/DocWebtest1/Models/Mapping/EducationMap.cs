using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class EducationMap : EntityTypeConfiguration<Education>
    {
        public EducationMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.EduDesc)
                .HasMaxLength(50);

            this.Property(t => t.SchoolName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.SchoolCity)
                .HasMaxLength(50);

            this.Property(t => t.SchoolState)
                .IsFixedLength()
                .HasMaxLength(3);

            this.Property(t => t.SchoolCountry)
                .HasMaxLength(50);

            this.Property(t => t.DegreeName)
                .IsRequired()
                .HasMaxLength(50);

            this.Property(t => t.DegreeTitle)
                .IsRequired()
                .IsFixedLength()
                .HasMaxLength(10);

            this.Property(t => t.DegreeDesc)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Educations");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.EduDesc).HasColumnName("EduDesc");
            this.Property(t => t.StartDate).HasColumnName("StartDate");
            this.Property(t => t.EndDate).HasColumnName("EndDate");
            this.Property(t => t.IsCurrent).HasColumnName("IsCurrent");
            this.Property(t => t.SchoolName).HasColumnName("SchoolName");
            this.Property(t => t.SchoolCity).HasColumnName("SchoolCity");
            this.Property(t => t.SchoolState).HasColumnName("SchoolState");
            this.Property(t => t.SchoolCountry).HasColumnName("SchoolCountry");
            this.Property(t => t.DegreeName).HasColumnName("DegreeName");
            this.Property(t => t.DegreeTitle).HasColumnName("DegreeTitle");
            this.Property(t => t.DegreeDesc).HasColumnName("DegreeDesc");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Educations)
                .HasForeignKey(d => d.UserID);

        }
    }
}
