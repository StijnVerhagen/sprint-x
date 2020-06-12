using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Threading;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace Sprint_x
{
    public partial class _Default : Page
    {
        private const string MqttBrokerHostName = "broker.mqtt-dashboard.com";
        private const string SmartHubTopic = "smarthub/data";
        private string idCode;
        private string message;

        private MqttClient client;


        protected void Page_Load(object sender, EventArgs e)
        {
           client = new MqttClient(MqttBrokerHostName);

           client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;

           idCode = Guid.NewGuid().ToString();

           client.Connect(idCode);

        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            client.Subscribe(new string[] { SmartHubTopic },
                new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            lblValue.Text = "";
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
            if (tbMessageSend.Text != "")
            {
                message = tbMessageSend.Text;
                client.Publish(SmartHubTopic, Encoding.UTF8.GetBytes(message), MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE, true);
            }
            
        }

        void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            string ReceivedMessage = Encoding.UTF8.GetString(e.Message);

            lblValue.Text = ReceivedMessage;
            lblValue.Visible = true;
        }
    }
}