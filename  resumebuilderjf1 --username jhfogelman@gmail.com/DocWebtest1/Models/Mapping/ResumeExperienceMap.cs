using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ResumeExperienceMap : EntityTypeConfiguration<ResumeExperience>
    {
        public ResumeExperienceMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            // Table & Column Mappings
            this.ToTable("ResumeExperiences");
            this.Property(t => t.ResumeID).HasColumnName("ResumeID");
            this.Property(t => t.ExperienceID).HasColumnName("ExperienceID");
            this.Property(t => t.ID).HasColumnName("ID");

            // Relationships
            this.HasRequired(t => t.Experience)
                .WithMany(t => t.ResumeExperiences)
                .HasForeignKey(d => d.ExperienceID);
            this.HasRequired(t => t.Resume)
                .WithMany(t => t.ResumeExperiences)
                .HasForeignKey(d => d.ResumeID);

        }
    }
}
