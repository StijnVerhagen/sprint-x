using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace DashboardLibrary
{
    public class MqttTest
    {
        public void GetValue()
        {
            // create client instance
            MqttClient client = new MqttClient("broker.mqtt-dashboard.com");

            // register to message received
            client.MqttMsgPublishReceived += Client_recievedMessage;

            string clientId = Guid.NewGuid().ToString();
            client.Connect(clientId);

            System.Diagnostics.Debug.WriteLine("Subscriber: sjoerdMessage");

            client.Subscribe(new String[] { "sjoerdMessage" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });

        }

        static void Client_recievedMessage(object sender, MqttMsgPublishEventArgs e)
        {
            //Handle message received
            var message = System.Text.Encoding.Default.GetString(e.Message);
            System.Diagnostics.Debug.WriteLine(message);

        }

    }
}
