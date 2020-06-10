using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace Mqtt_Test
{
    class Program
    {
        const string MQTT_BROKER_HOST_NAME = "brokernamehere.com";
        protected void Page_Load(object sender, EventArgs e)
        {
            MqttProcessing();// call to the MQTT client setup steps.
        }

        protected void MqttProcessing()
        {
            // create client instance 
            MqttClient client = new MqttClient(MQTT_BROKER_HOST_NAME);

            // register to message received 
            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;

            string clientId = Guid.NewGuid().ToString();
            client.Connect(clientId);

            // subscribe to the topic "/home/temperature" with QoS 2 
            client.Subscribe(new string[] { "hello/world" }, new byte {MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });

        }

        void client_MqttMsgPublishReceived(object sender, MqttMsgPublishEventArgs e)
        {
            try
            {
                string str = HttpContext.Current.Session["VariableName"].ToString();
                Session["message"] = "Received = " +
                                     Encoding.UTF8.GetString(e.Message) + " on topic " + e.Topic;
            }
            catch (HttpException ex)
            {
                Session["message"] = "ERROR:" + ex.Message;
            }
        }
    }
}
