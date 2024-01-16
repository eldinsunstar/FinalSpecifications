public class BloodRequest
{
    public string Hospital { get; set; }
    public string City { get; set; }
    public string Town { get; set; }
    public string BloodType { get; set; }
    public int Units { get; set; }
    public string ContactEmail { get; set; }
}

public class BloodRequestService
{
    private Queue<BloodRequest> requestQueue = new Queue<BloodRequest>();

    public void MakeRequest(BloodRequest request)
    {
        // Add the request to the queue
        requestQueue.Enqueue(request);
    }

    public void ProcessRequests()
    {
        // Process requests, send notifications, and update blood quantity
    }
}
