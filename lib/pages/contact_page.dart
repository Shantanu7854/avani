import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch with Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            _buildContactOption(
              icon: Icons.chat,
              title: 'Chat Support',
              description: 'Need help? Start a chat with our support team for immediate assistance.',
              onTap: () {
                // Handle chat support tap
              },
            ),
            SizedBox(height: 20),
            _buildContactOption(
              icon: Icons.email,
              title: 'Email Us',
              description: 'Drop us an email at support@avaniecocare.com, and we\'ll get back to you within 24 hours.',
              onTap: () {
                // Handle email support tap
              },
            ),
            SizedBox(height: 20),
            _buildContactOption(
              icon: Icons.phone,
              title: 'Call Us',
              description: 'For urgent queries, call us at +1 234 567 890.',
              onTap: () {
                // Handle call support tap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal, size: 40),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      trailing: Icon(Icons.arrow_forward, color: Colors.teal),
      onTap: onTap,
    );
  }
}
