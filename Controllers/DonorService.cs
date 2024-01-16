public class Donor
{
    public string FullName { get; set; }
    public string BloodType { get; set; }
    public string Town { get; set; }
    public string City { get; set; }
    public string PhoneNumber { get; set; }
    public byte[] Photo { get; set; }
}

public class DonorService
{
    private Dictionary<string, Donor> donors = new Dictionary<string, Donor>();

    public bool CreateDonor(string branchName, string branchPassword, Donor donor)
    {
        // Authenticate branch
        if (AuthenticateBranch(branchName, branchPassword))
        {
            // Check if donor already exists
#pragma warning disable CS8604 // Possible null reference argument.
            if (!donors.ContainsKey(donor.PhoneNumber))
            {
                donors.Add(donor.PhoneNumber, donor);
                return true;
            }
#pragma warning restore CS8604 // Possible null reference argument.
        }
        return false;
    }

    private bool AuthenticateBranch(string branchName, string branchPassword)
    {
        // Authentication logic
        return true;
    }
}
