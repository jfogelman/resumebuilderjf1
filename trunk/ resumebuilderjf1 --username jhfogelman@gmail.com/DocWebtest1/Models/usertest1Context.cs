using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using DocWebtest1.Models.Mapping;

namespace DocWebtest1.Models
{
    public class usertest1Context : DbContext
    {
        static usertest1Context()
        {
            Database.SetInitializer<usertest1Context>(null);
        }

		public usertest1Context()
			: base("Name=usertest1Context")
		{
		}

        public DbSet<Achievement> Achievements { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Education> Educations { get; set; }
        public DbSet<Email> Emails { get; set; }
        public DbSet<Experience> Experiences { get; set; }
        public DbSet<Phone> Phones { get; set; }
        public DbSet<ResumeEducation> ResumeEducations { get; set; }
        public DbSet<ResumeExperience> ResumeExperiences { get; set; }
        public DbSet<Resume> Resumes { get; set; }
        public DbSet<UserResume> UserResumes { get; set; }
        public DbSet<Usertable> Usertables { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new AchievementMap());
            modelBuilder.Configurations.Add(new AddressMap());
            modelBuilder.Configurations.Add(new EducationMap());
            modelBuilder.Configurations.Add(new EmailMap());
            modelBuilder.Configurations.Add(new ExperienceMap());
            modelBuilder.Configurations.Add(new PhoneMap());
            modelBuilder.Configurations.Add(new ResumeEducationMap());
            modelBuilder.Configurations.Add(new ResumeExperienceMap());
            modelBuilder.Configurations.Add(new ResumeMap());
            modelBuilder.Configurations.Add(new UserResumeMap());
            modelBuilder.Configurations.Add(new UsertableMap());
        }
    }
}
