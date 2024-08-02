import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WasteData {
  final String area;
  final double dryWaste;
  final double wetWaste;

  WasteData(this.area, this.dryWaste, this.wetWaste);
}

class MunicipalitiesPage extends StatefulWidget {
  @override
  _MunicipalitiesPageState createState() => _MunicipalitiesPageState();
}

class _MunicipalitiesPageState extends State<MunicipalitiesPage> {
  // Sample waste data (replace with actual data source)
  final List<WasteData> wasteData = [
    WasteData("Area 1", 50.0, 30.0),
    WasteData("Area 2", 35.0, 45.0),
    WasteData("Area 3", 60.0, 25.0),
  ];

  // Currently selected theme (light or dark)
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Waste Analysis'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(isLightTheme ? Icons.brightness_4 : Icons.brightness_2),
            onPressed: () => setState(() => isLightTheme = !isLightTheme),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Waste Analysis by Area',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isLightTheme ? Colors.green[800] : Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: buildBarChart(),
            ),
            SizedBox(height: 10),
            Text(
              'Dry Waste vs. Wet Waste Comparison',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isLightTheme ? Colors.black87 : Colors.grey[400],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: wasteData.length,
                itemBuilder: (context, index) {
                  final area = wasteData[index].area;
                  final dryWaste = wasteData[index].dryWaste;
                  final wetWaste = wasteData[index].wetWaste;
                  return ListTile(
                    title: Text(area),
                    subtitle: Row(
                      children: [
                        Text("Dry Waste: $dryWaste"),
                        Spacer(),
                        Text("Wet Waste: $wetWaste"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData buildBarChartGroupData(WasteData data) {
    return BarChartGroupData(
      x: wasteData.indexOf(data),
      barRods: [
        BarChartRodData(
          toY: data.dryWaste,
          color: Colors.green,
        ),
        BarChartRodData(
          toY: data.wetWaste,
          color: Colors.blue,
        ),
      ],
    );
  }

  BarChart buildBarChart() {
    return BarChart(
      BarChartData(
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                final title = wasteData[index].area;
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(title),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(value.toString()),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
        barGroups: wasteData.map(buildBarChartGroupData).toList(),
      ),
    );
  }
}
