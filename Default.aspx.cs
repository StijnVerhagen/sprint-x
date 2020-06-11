using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace Sprint_x
{
    public partial class _Default : Page
    {

        const string MqttBrokerHostName = "broker.mqtt-dashboard.com";
        const string SmartHubTopic = "smarthub/data";

        protected void Page_Load(object sender, EventArgs e)
        {
           // MqttProcessing();// call to the MQTT client setup steps.
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            MqttClient client = new MqttClient(MqttBrokerHostName);

            client.ProtocolVersion = MqttProtocolVersion.Version_3_1;

            byte code = client.Connect(Guid.NewGuid().ToString());

            ushort msgIds = client.Subscribe(new string[] { SmartHubTopic },
                new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });

            lblValue.Text = "";

            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;
        }
        public void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            string messageReceived = "Received = " + System.Text.Encoding.UTF8.GetString(e.Message) + " on topic " + e.Topic;

            Session["messageSend"] = messageReceived;

            // tbValue.Text += "Received = " + Encoding.UTF8.GetString(e.Message) + "on topic " + e.Topic + "\r\n";
        }

        public void btnDisplay_Click(object sender, EventArgs e)
        {
            string messageDisplay = Convert.ToString(Session["messageSend"]);
            lblValue.Text = messageDisplay;
        }
    }
}