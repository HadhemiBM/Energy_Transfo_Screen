
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class TransformerAvailabilityChart extends StatefulWidget {
  const TransformerAvailabilityChart({super.key});

  @override
  State<TransformerAvailabilityChart> createState() => _TransformerAvailabilityChartState();
}

class _TransformerAvailabilityChartState extends State<TransformerAvailabilityChart> {
  String selectedTransfo = "Transfo 1";

  final Map<String, Map<String, double>> allTransformersData = {
    "Transfo 1": {
      "Capacité utilisée": 750,
      "Capacité libre": 250,
    },
    "Transfo 2": {
      "Capacité utilisée": 400,
      "Capacité libre": 600,
    },
    "Transfo 3": {
      "Capacité utilisée": 300,
      "Capacité libre": 700,
    },
  };

  final List<Color> colorList = const [
    Color(0xFFB9C40B),
    Color(0xFF00AC4F),
  ];

  @override
  Widget build(BuildContext context) {
    final dataMap = allTransformersData[selectedTransfo]!;
    final screenWidth = MediaQuery.of(context).size.width;
return SizedBox(
  height: 400,  // or whatever height you want
  child: Container(
    padding: const EdgeInsets.all(10),
    // margin: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      // color: const Color(0xFF0D0D1A),
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
Row(
  children: [
    const Expanded(
      child: Text(
        'Disponibilité des Transformateurs (KVA)',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    const SizedBox(width: 16),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white, // Fond sombre
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white, // Fond de la liste
        value: selectedTransfo,
        
        icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        underline: const SizedBox(), // Retirer la ligne par défaut
        items: allTransformersData.keys.map((String key) {
          return DropdownMenuItem<String>(
            value: key,
            child: Text(key),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedTransfo = value!;
          });
        },
      ),
    ),
  ],
),

        const SizedBox(height: 20),
        Expanded(
          child: PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(milliseconds: 800),
            chartType: ChartType.ring,
            baseChartColor: Colors.transparent,
            colorList: colorList,
            totalValue: 1000,
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              showChartValueBackground: false,
              chartValueStyle: TextStyle(color: Colors.black),
              showChartValuesInPercentage: false,
            ),
            legendOptions: const LegendOptions(
              showLegends: true,
              showLegendsInRow: true,
              legendShape: BoxShape.rectangle,
              legendPosition: LegendPosition.top,
              legendTextStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  ),
);

  }
}
