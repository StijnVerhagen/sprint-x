using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web;
using System.Web.Services.Description;
using System.Windows;
using System.Windows.Threading;
using Microsoft.Ajax.Utilities;

namespace Sprint_x
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Timer_Tick(object sender, EventArgs e)
        {
            string valueLiter;
            string valuekWh;
            string valueEuro;

            // Binnenkomst van de input
            var incomingValue = HttpContext.Current.Application["LastMessage"];

            // Methode voor het omzetten van input naar kWh en Liters
            (valueLiter, valuekWh, valueEuro)  = Convert_Input((incomingValue).ToString());

            lblLiter.Text = valueLiter;
            lblkWh.Text = valuekWh;
            lblEuro.Text = valueEuro;

            // Update de UpdatePanels
            UpdatePanelLiter.Update();
            UpdatePanelkWh.Update();
            UpdatePanelEuro.Update();

        }

        protected (string, string, string) Convert_Input(string input)
        {
            try
            {                
                string outputLiter;
                string outputkWh;
                string outputEuro;

                double dblLiter = Liter(input);

                outputkWh = Kwh(dblLiter);

                outputEuro = Euro(dblLiter);

                // Liter naar string
                outputLiter = dblLiter.ToString();

                // Variabele terug sturen
                return (outputLiter, outputkWh, outputEuro);
            }
            catch
            {
                // 0 terugsturen als input geen getal is (kan voorkomen door een fout)
                return ("0", "0", "€0");
                throw;
            }
        }

        protected double Liter(string inputL)
        {
            // Omzetten van string naar double
            double dblInput = Convert.ToDouble(inputL);

            // Input delen door 1000 om liters te krijgen, vervolgens afronden met Math.Round
            double dblLiter = Convert.ToDouble(Math.Round((dblInput / 1000), 1));

            return dblLiter;
        }

        protected string Kwh(double inputK)
        {
            double kWh;
            double x = 0.2;
            double y = 5;

            // Met het berekende aantal liter water, het kWh verbruik berekeren
            kWh = (inputK / y) * x;

            string outputkWh = (Math.Round(kWh), 2).ToString();

            // Haalt de haakjes weg van 'outputkWh'
            // Om een of andere reden word 5,238342 kWh afgerond naar (5,2) --> met haakjes
            outputkWh = outputkWh.Substring(1, outputkWh.Length - 2);

            return outputkWh;
        }

        protected string Euro(double inputE)
        {

            return null;
        }
    }
}