using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ResumeEducationMap : EntityTypeConfiguration<ResumeEducation>
    {
        public ResumeEducationMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            // Table & Column Mappings
            this.ToTable("ResumeEducations");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.ResumeID).HasColumnName("ResumeID");
            this.Property(t => t.EducationID).HasColumnName("EducationID");

            // Relationships
            this.HasRequired(t => t.Education)
                .WithMany(t => t.ResumeEducations)
                .HasForeignKey(d => d.EducationID);
            this.HasRequired(t => t.Resume)
                .WithMany(t => t.ResumeEducations)
                .HasForeignKey(d => d.ResumeID);

        }
    }
}
