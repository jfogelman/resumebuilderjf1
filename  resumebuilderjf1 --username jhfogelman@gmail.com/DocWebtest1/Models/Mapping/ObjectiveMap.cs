using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class ObjectiveMap : EntityTypeConfiguration<Objective>
    {
        public ObjectiveMap()
        {
            // Primary Key
            this.HasKey(t => t.ID);

            // Properties
            this.Property(t => t.ObjectiveText)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Objectives");
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.ObjectiveText).HasColumnName("ObjectiveText");
            this.Property(t => t.UserID).HasColumnName("UserID");

            // Relationships
            this.HasRequired(t => t.Usertable)
                .WithMany(t => t.Objectives)
                .HasForeignKey(d => d.UserID);

        }
    }
}
