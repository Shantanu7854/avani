import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IndustriesPage extends StatelessWidget {
  final TextStyle customHeadlineStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  final TextStyle customBodyStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Industries Waste Management'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildWasteAnalyticsCard(
                context,
                'Example Industry: XYZ Manufacturing',
                'XYZ Manufacturing generates significant amounts of both dry and wet waste. '
                'Here’s a detailed view of their waste management strategies and visualizations:',
                Icons.factory,
                [
                  _buildSection('Dry Waste Distribution from Total Waste', _buildPieChart(dryWasteData)),
                  _buildSection('Wet Waste Distribution from Total Waste', _buildPieChart(wetWasteData)),
                  _buildSection('Reusable Percentage of Dry Wastes', _buildBarChart(dryWasteReuseData, dryWasteTitles)),
                  _buildSection('Reusable Percentage of Wet Wastes', _buildBarChart(wetWasteReuseData, wetWasteTitles)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWasteAnalyticsCard(BuildContext context, String title, String description, IconData icon, List<Widget> charts) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.teal),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: customHeadlineStyle),
                      SizedBox(height: 8),
                      Text(description, style: customBodyStyle),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ...charts,
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget chart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: customHeadlineStyle),
        SizedBox(height: 10),
        chart,
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPieChart(List<PieChartSectionData> sections) {
    return Container(
      height: 250,
      child: PieChart(
        PieChartData(
          sections: sections,
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  Widget _buildBarChart(List<BarChartGroupData> barGroups, List<String> titles) {
    return Container(
      height: 250,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          maxY: 100,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Reduced font size
                  );
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 16,
                    child: Text(titles[value.toInt()], style: style),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10, // Reduced font size
                  );
                  return Text('${value.toInt()}%', style: style);
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: barGroups,
        ),
      ),
    );
  }

  final List<PieChartSectionData> dryWasteData = [
    PieChartSectionData(color: Colors.blue, value: 30, title: 'Metals\n30%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.red, value: 25, title: 'E-Waste\n25%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.green, value: 20, title: 'Plastics\n20%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.yellow, value: 15, title: 'Paper\n15%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.grey, value: 10, title: 'Glass\n10%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
  ];

  final List<PieChartSectionData> wetWasteData = [
    PieChartSectionData(color: Colors.brown, value: 50, title: 'Composting\n50%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.orange, value: 30, title: 'Biogas\n30%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
    PieChartSectionData(color: Colors.greenAccent, value: 20, title: 'Animal Feed\n20%', radius: 50, titleStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
  ];

  final List<BarChartGroupData> dryWasteReuseData = [
    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 50, color: Colors.blue, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 40, color: Colors.red, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 30, color: Colors.green, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 20, color: Colors.yellow, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 10, color: Colors.grey, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
  ];

  final List<BarChartGroupData> wetWasteReuseData = [
    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 50, color: Colors.brown, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 30, color: Colors.orange, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 20, color: Colors.greenAccent, width: 12, borderRadius: BorderRadius.circular(4))], showingTooltipIndicators: [0]),
  ];

  final List<String> dryWasteTitles = ['Metals', 'E-Waste', 'Plastics', 'Paper', 'Glass'];
  final List<String> wetWasteTitles = ['Composting', 'Biogas', 'Animal Feed'];
}
