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
        private const string MqttBrokerHostName = "broker.mqtt-dashboard.com";
        private string idCode;

        public static string SmartHubTopic = "smarthub/data";
        public static MqttClient client;

        protected void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            client = new MqttClient(MqttBrokerHostName);
            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;
            idCode = Guid.NewGuid().ToString();
            client.Connect(idCode);

            client.Subscribe(new string[] { SmartHubTopic },
                new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
        }

        protected void Application_End(object sender, EventArgs e)
        {
            client.Disconnect();
        }

        private void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            // Decode message
            string message = Encoding.UTF8.GetString(e.Message);

            // Display message in console
            System.Diagnostics.Debug.WriteLine("Message: " + message);

            Application["LastMessage"] = message;
        }
        
    }
}