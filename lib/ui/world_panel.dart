import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:covid_19_app/models/country_data.dart';

class WorldwidePanel extends StatelessWidget {
  // WorldwidePanel({required this.worldData});
  //
  // final Map worldData;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: [
        StatusPanel(
          title: 'CONFIRMED',
          textColor: Colors.red,
          panelColor: Colors.red.shade100,
          count:
              Provider.of<CountryData>(context).worldData!['cases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue.shade100,
          textColor: Colors.blue.shade900,
          count:
              Provider.of<CountryData>(context).worldData!['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green.shade100,
          textColor: Colors.green,
          count: Provider.of<CountryData>(context)
              .worldData!['recovered']
              .toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.grey.shade400,
          textColor: Colors.grey.shade900,
          count:
              Provider.of<CountryData>(context).worldData!['deaths'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final String title;
  final String count;
  final Color textColor;
  final Color panelColor;

  StatusPanel(
      {required this.title,
      required this.count,
      required this.panelColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Container(
        margin: EdgeInsets.all(10),
        height: 80,
        width: width / 2,
        color: panelColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ));
  }
}
