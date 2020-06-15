using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI;
using System.Windows;
using System.Windows.Threading;

using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using WebGrease.Activities;

namespace Sprint_x
{
    public partial class _Default : Page
    {

        /* Declaring of variables */
        // Broker host
        private const string MqttBrokerHostName = "broker.mqtt-dashboard.com";
        // Topic name
        private const string SmartHubTopic = "smarthub/data";
        private string idCode;
        private string message;

        private Thread valueThread;

        private MqttClient client;

        protected void Page_Load(object sender, EventArgs e)
        { 
            client = new MqttClient(MqttBrokerHostName);

            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;

            // Creating personal ID string
            idCode = Guid.NewGuid().ToString();

            // Connecting to client with ID
            client.Connect(idCode);
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        { 
            // Subscribing to topic & Clearing label
            client.Subscribe(new string[] { SmartHubTopic },
                new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            lblSubscribe.Visible = true;
            tbMessageReceived.Text = "";
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            // If a message has been submitted --> publish message
            if (tbMessageSend.Text != "")
            {
                message = tbMessageSend.Text;
                client.Publish(SmartHubTopic, Encoding.UTF8.GetBytes(message), MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE, true);
            }
            
        }

        void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            // Decode message
            string ReceivedMessage = Encoding.UTF8.GetString(e.Message);

            // Display message asynchronous
            PublishAsync(ReceivedMessage);
        }

        public async Task PublishAsync(string ReceivedMessage)
        {
            // Display message in console
            System.Diagnostics.Debug.WriteLine(ReceivedMessage);

            // tbMessageReceived.Text = ReceivedMessage;

        }
    }
}