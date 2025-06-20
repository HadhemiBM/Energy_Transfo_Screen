// transformer_chart.dart
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class TransformerAvailabilityChart extends StatelessWidget {
  const TransformerAvailabilityChart({super.key});
  final Map<String, double> dataMap = const {
    "Capacité utilisée": 750,
    "Capacité libre": 250,

  };
  final List<Color> colorList = const [
    Color(0xFFAEDCF2), // Capacité utilisée (bleu clair)
    Color(0xFF00C2FF), // Capacité libre (bleu vif)
   
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'Disponibilité des Transformateurs (KVA)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
  height: 400,
  child:
        PieChart(
          dataMap: dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartType: ChartType.ring,
          baseChartColor: Colors.transparent,

          colorList: colorList,         
          chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
          chartValueStyle: TextStyle(color: Colors.white),
            
            showChartValueBackground: false
          ),
          totalValue: 1000,         
          legendOptions: const LegendOptions(
            legendTextStyle: TextStyle(color: Colors.white),
            showLegends: true,
            showLegendsInRow: true,     
            legendShape: BoxShape.rectangle,
            legendPosition: LegendPosition.top,
          ),         
        ),),
        const SizedBox(height: 40),
      ],
    );
  }
}
