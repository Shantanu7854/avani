import 'package:flutter/material.dart';

class HouseholdsPage extends StatefulWidget {
  @override
  _HouseholdsPageState createState() => _HouseholdsPageState();
}

class _HouseholdsPageState extends State<HouseholdsPage> {
  final List<Map<String, dynamic>> wasteOptions = [
    {'name': 'E-waste', 'pricePerKg': 50.0},
    {'name': 'Newspapers', 'pricePerKg': 5.0},
    {'name': 'Plastic bottles', 'pricePerKg': 10.0},
    {'name': 'Glass bottles', 'pricePerKg': 15.0},
    {'name': 'Cardboard', 'pricePerKg': 8.0}
  ];

  final _selectedWastes = <String, double>{};
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  double minimumSellingValue = 200.0;

  double get _totalAmount {
    double total = 0.0;
    _selectedWastes.forEach((waste, weight) {
      final pricePerKg = wasteOptions.firstWhere((option) => option['name'] == waste)['pricePerKg'];
      total += pricePerKg * weight;
    });
    return total;
  }

  void _bookAppointment() {
    if (_selectedWastes.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _totalAmount >= minimumSellingValue) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Appointment Booked'),
          content: Text('Your appointment has been booked successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(_totalAmount < minimumSellingValue
              ? 'The total amount should be at least 200 INR.'
              : 'Please select wastes and provide address and phone number.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('For Households'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'For Households:',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Avani EcoCare helps households manage their waste efficiently, promoting recycling and reducing the environmental footprint through smart waste segregation and data analysis.',
              style: textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Text(
              'Select dry wastes to sell:',
              style: textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            ...wasteOptions.map((waste) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckboxListTile(
                  title: Text('${waste['name']} - ${waste['pricePerKg']} INR/kg'),
                  value: _selectedWastes.containsKey(waste['name']),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        _selectedWastes[waste['name']] = 1.0; // Default weight set to 1 kg
                      } else {
                        _selectedWastes.remove(waste['name']);
                      }
                    });
                  },
                ),
                if (_selectedWastes.containsKey(waste['name']))
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter weight in kg',
                    ),
                    onChanged: (value) {
                      final weight = double.tryParse(value) ?? 0.0;
                      setState(() {
                        if (weight > 0) {
                          _selectedWastes[waste['name']] = weight;
                        } else {
                          _selectedWastes.remove(waste['name']);
                        }
                      });
                    },
                  ),
                SizedBox(height: 10),
              ],
            )).toList(),
            SizedBox(height: 20),
            Text(
              'Enter address:',
              style: textTheme.titleMedium,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your address',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter phone number:',
              style: textTheme.titleMedium,
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your phone number',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Amount: ${_totalAmount.toStringAsFixed(2)} INR',
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: _totalAmount >= minimumSellingValue ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Minimum selling value: 200 INR',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _bookAppointment,
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
