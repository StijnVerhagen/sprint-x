using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace Sprint_x
{
    public class Global : HttpApplication
    {

        // Declaring all variables
        private const string MqttBrokerHostName = "broker.mqtt-dashboard.com";
        private string idCode;

        public static string SmartHubTopic = "smarthub/data";
        public static MqttClient client;

        protected void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            // Creating client to broker
            client = new MqttClient(MqttBrokerHostName);
            // Check for updates in broker
            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;
            // Create user ID code string
            idCode = Guid.NewGuid().ToString();
            // Connect to client with ID code
            client.Connect(idCode);
            // Subscribe to the smarthub/data topic in broker
            client.Subscribe(new string[] { SmartHubTopic },
                new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Disconnect from client when application ends
            client.Disconnect();
        }

        private void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            // Decode message
            string message = Encoding.UTF8.GetString(e.Message);

            // Display message in console
            System.Diagnostics.Debug.WriteLine("Message: " + message);

            // Put message in Application["LastMessage"] to display in UI
            Application["LastMessage"] = message;
        }
        
    }
}