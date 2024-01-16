public class BloodBankService
{
    private int bloodQuantity = 0;

    public bool AddBlood(string branchName, string branchPassword, int quantity)
    {
        // Authenticate branch
        if (AuthenticateBranch(branchName, branchPassword))
        {
            bloodQuantity += quantity;
            return true;
        }
        return false;
    }

    private bool AuthenticateBranch(string branchName, string branchPassword)
    {
        // Authentication logic
        return true;
    }
}
