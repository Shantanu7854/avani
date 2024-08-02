import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
// import 'pages/overview_page.dart';
// import 'pages/features_page.dart';
import 'pages/contact_page.dart';
import 'pages/municipalities_page.dart';
import 'pages/households_page.dart';
import 'pages/industries_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avani EcoCare',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
      routes: {
        // '/overview': (context) => OverviewPage(),
        // '/features': (context) => FeaturesPage(),
        '/contact': (context) => ContactPage(),
        '/municipalities': (context) => MunicipalitiesPage(),
        '/households': (context) => HouseholdsPage(),
        '/industries': (context) => IndustriesPage(),
      },
    );
  }
}
