using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace DocWebtest1.Models.Mapping
{
    public class UserResumeMap : EntityTypeConfiguration<UserResume>
    {
        public UserResumeMap()
        {
            // Primary Key
            this.HasKey(t => t.UserID);

            // Properties
            // Table & Column Mappings
            this.ToTable("UserResumes");
            this.Property(t => t.UserID).HasColumnName("UserID");
            this.Property(t => t.ResumeID).HasColumnName("ResumeID");
        }
    }
}
