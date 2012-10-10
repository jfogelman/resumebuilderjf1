using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class AchievementMap : EntityTypeConfiguration<Achievement>
    {
        public AchievementMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            // Table & Column Mappings
            this.ToTable("Achievements");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.Description).HasColumnName("Description");
            this.Property(t => t.ExperienceID).HasColumnName("ExperienceID");

            // Relationships
            this.HasRequired(t => t.Experience)
                .WithMany(t => t.Achievements)
                .HasForeignKey(d => d.ExperienceID);

        }
    }
}
