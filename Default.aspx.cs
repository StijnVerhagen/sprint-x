using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services.Description;
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

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLastMessage_Click(object sender, EventArgs e)
        {
            var message = HttpContext.Current.Application["LastMessage"];
            tbMessageReceived.Text = message.ToString();
        }

        protected void btnPublish_Click(object sender, EventArgs e)
        {
           
            // If a message has been submitted --> publish message
            if (tbMessageSend.Text != "")
            {
                string message = tbMessageSend.Text;

                Global.client.Publish(Global.SmartHubTopic, Encoding.UTF8.GetBytes(message), MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE, true);
            }
        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            var message = HttpContext.Current.Application["LastMessage"];
            tbMessageReceived.Text = message.ToString();

            UpdatePanel.Update();
        }

    }
}