<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Sprint_x.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="/BootstrapTemplate/css/now-ui-dashboard.css">

    <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

    <!-- Fontfaces CSS-->
    <link href="BootstrapTemplate/css/font-face.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="BootstrapTemplate/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="BootstrapTemplate/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="BootstrapTemplate/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="BootstrapTemplate/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">
       



        <!-- PAGE CONTAINER-->
        <div class="page-container">


            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">overview</h2>
                                    <button class="au-btn au-btn-icon au-btn--blue">
                                        <i class="zmdi zmdi-plus"></i>add item</button>
                                </div>
                            </div>
                        </div>
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-pin"></i>
                                            </div>
                                            <div class="text">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanelLiter" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Timer runat="server" ID="TimerLiter" Interval="1000" OnTick="Timer_Tick"></asp:Timer>
                                                    <h1 class="h1-asplabel"><asp:Literal ID="lblLiter" runat="server">0</asp:Literal></h1>
                                                    <%--<asp:Label ID="lblLiter" class="h1-asplabel" runat="server" Text="0"></asp:Label>--%>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <span>Huidige liters</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart2"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanelkWh" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:Timer runat="server" ID="TimerkWh" Interval="1000" OnTick="Timer_Tick"></asp:Timer>
                                                    <h1 class="h1-asplabel"><asp:Literal ID="lblkWh" runat="server">0</asp:Literal></h1>
                                                    <%--<asp:Label ID="lblLiter" class="h1-asplabel" runat="server" Text="0"></asp:Label>--%>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <span>Huidige kWh</span>
                                        </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart3"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanelEuro" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:Timer runat="server" ID="TimerEuro" Interval="1000" OnTick="Timer_Tick"></asp:Timer>
                                                        <h1 class="h1-asplabel"><asp:Literal ID="lblEuro" runat="server">€0</asp:Literal></h1>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <span>Huidig besteed</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart4"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2>67</h2>
                                                <span>Douchebeurten</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart">
                                            <canvas id="widgetChart1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
                                        <h3 class="title-2">recent reports</h3>
                                        <div class="chart-info">
                                            <div class="chart-info__left">
                                                <div class="chart-note">
                                                    <span class="dot dot--blue"></span>
                                                    <span>products</span>
                                                </div>
                                                <div class="chart-note mr-0">
                                                    <span class="dot dot--green"></span>
                                                    <span>services</span>
                                                </div>
                                            </div>
                                            <div class="chart-info__right">
                                                <div class="chart-statis">
                                                    <span class="index incre">
                                                        <i class="zmdi zmdi-long-arrow-up"></i>25%</span>
                                                    <span class="label">products</span>
                                                </div>
                                                <div class="chart-statis mr-0">
                                                    <span class="index decre">
                                                        <i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                                    <span class="label">services</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="recent-report__chart">
                                            <canvas id="recent-rep-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">char by %</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div class="chart-note-wrap">
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--blue"></span>
                                                        <span>products</span>
                                                    </div>
                                                    <div class="chart-note mr-0 d-block">
                                                        <span class="dot dot--red"></span>
                                                        <span>services</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="percent-chart">
                                                    <canvas id="percent-chart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="copyright">
                                    <p>Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="BootstrapTemplate/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="BootstrapTemplate/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="BootstrapTemplate/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="BootstrapTemplate/vendor/slick/slick.min.js">
    </script>
    <script src="BootstrapTemplate/vendor/wow/wow.min.js"></script>
    <script src="BootstrapTemplate/vendor/animsition/animsition.min.js"></script>
    <script src="BootstrapTemplate/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="BootstrapTemplate/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="BootstrapTemplate/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="BootstrapTemplate/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="BootstrapTemplate/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="BootstrapTemplate/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="BootstrapTemplate/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="BootstrapTemplate/js/main.js"></script>

</body>
</asp:Content>
