# Sprint X - Stijn Verhagen

Voor mijn Sprint X in semester 2 van de FHICT Media Design opleiding heb ik een ASP.NET (C#) Web Application ontwikkeld. De applicatie is voortgekomen uit de proftaak die wij dit semester hebben mogen maken. Wij hadden als casus; 'Waterverbruik Inzichtelijk maken'. Met deze Web Application krijgt de gebruiker inzicht in zijn/haar waterverbruik.

## Motivatie

Ik heb gekozen voor dit onderwerp omdat ik dit tijdens de proftaak dit eigenlijk al wilde realisteren. Dit is helaas niet gelukt door dat wij als groep een aantal 
tegenslagen kregen. We hebben het niet af kunnen maken door de tijdsdruk die op het project zat.

Verdere motivatie voor het maken van dit project heeft als reden dat waterverbruik me persoonlijk interesseert. Ik vind gadgets zelf erg cool en heb zelf onlangs een watermeter aangeschaft.

## How does it work?

De Web Application maakt met behulp van een MQTT Library verbinding met een MQTT Broker (dit is eigenlijk een soort server). De data komt binnen in de Global.asax.cs en word doorgestuurd via een applicatie variabele die op de pagina zelf gebruikt kan worden. Code screenshots zijn hier onder te vinden.

De inputwaardes komen binnen in milliliters en worden omgezet naar liter, kWh en Euro voordat er iets weergegeven word aan de gebruiker. Dit leest natuurlijk makkelijker dan milliliters en de data is veel interessanter.


## Screenshots

![Global asax code](https://user-images.githubusercontent.com/57891326/85746626-e2253f00-b706-11ea-8b67-b4b0bc7989db.jpg)
![Volledig SS Converting](https://user-images.githubusercontent.com/57891326/85746632-e3566c00-b706-11ea-8914-924fde2d02a6.jpg)


## Portfolio

[Link naar portfolio](https://verhagen.myportfolio.com/introductie)


## Credits
[Sjoerd van Gerwen](https://svgdesign.nl/home/) - Partner / Medestudent

Erik Heijligers - SemesterCoach / Begeleider
