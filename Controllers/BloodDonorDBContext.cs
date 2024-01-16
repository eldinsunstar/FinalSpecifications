using Microsoft.EntityFrameworkCore;

public class BloodDonorDBContext : DbContext
{
    public DbSet<Donor>? Donors { get; set; }
    public DbSet<BloodBankService>? BloodBanks { get; set; }
    public DbSet<BloodRequest>? BloodRequests { get; set; }
    public DbSet<Branch>? Branches { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=tcp:rojbin-blooddonordb.database.windows.net,1433;Initial Catalog=BloodDonorDB;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;Authentication=Active Directory Default;");
    }
}

public class Branch
{
}