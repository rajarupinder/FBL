<%@ Application Language="C#" %>
<%@ Import Namespace="System.Timers" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        System.Timers.Timer myTimer = new System.Timers.Timer();
        // Set the Interval to 5 seconds (5000 milliseconds).
        //myTimer.Interval = 600000;
        myTimer.Interval = 660000;
        myTimer.AutoReset = true;
        myTimer.Elapsed += new ElapsedEventHandler(myTimer_Elapsed);
        myTimer.Enabled = true;       
    }

    public void myTimer_Elapsed(object source, System.Timers.ElapsedEventArgs e)
    {
        DateTime t1 = DateTime.Now.AddHours(11.5);
        DateTime t2 = Convert.ToDateTime("8:00 PM");
        DateTime t3 = Convert.ToDateTime("8:30 PM");                
        if (t1 > t2 && t1 < t3)
        { 
            //clsScheduleMail objScheduleMail = new clsScheduleMail();
            //objScheduleMail.SendScheduleMail();
        }

        DateTime local = DateTime.Now.AddHours(10.5);
        DateTime start = Convert.ToDateTime("10:10 AM");
        DateTime end = Convert.ToDateTime("10:30 AM");
        if (local > start && local < end)
        {
            Mail oMail = new Mail();
            oMail.Send();
        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
    }

    void Session_Start(object sender, EventArgs e) 
    {
      
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }
       
</script>
