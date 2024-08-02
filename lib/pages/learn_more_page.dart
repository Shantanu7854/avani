import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn More'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction
              Text(
                'Introduction to Avani EcoCare',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Avani EcoCare is an innovative smart waste management system designed to revolutionize how waste is managed across various sectors. By integrating IoT technology with mobile applications, we provide a comprehensive solution that caters to the needs of users, industries, and corporations.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),

              // Features
              Text(
                'Key Features',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '1. IoT-Enabled Dustbins: Our smart dustbins are equipped with IoT sensors to accurately measure and categorize waste into dry and wet categories. This helps in efficient waste collection and recycling.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '2. Real-Time Data: Waste data is transmitted in real-time to the mobile app, providing valuable insights and analytics for better waste management decisions.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '3. Mobile App Integration: Our mobile app allows users to monitor waste levels, schedule waste collection, and access detailed reports on waste management.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '4. Customizable Solutions: We offer tailored solutions for municipalities, industries, and households to meet specific waste management needs.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),

              // Benefits
              Text(
                'Benefits',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '1. Enhanced Efficiency: Automated waste sorting and collection optimize resource allocation and reduce operational costs.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '2. Environmental Impact: Improved waste segregation and recycling contribute to a cleaner and healthier environment.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '3. User Convenience: Seamless integration with mobile devices makes it easier for users to manage and track their waste disposal activities.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32),

            
            ],
          ),
        ),
      ),
    );
  }
}
