import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_19_app/models/country_data.dart';

class MostAffectedPanel extends StatelessWidget {
  // final List countryData;
  //
  // MostAffectedPanel({required this.countryData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer(
        builder: (context, name, child) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Image.network(
                      Provider.of<CountryData>(context).countryData![index]
                          ['countryInfo']['flag'],
                      // countryData[index]['countryInfo']['flag'],
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      Provider.of<CountryData>(context).countryData![index]
                          ['country'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Deaths: ${Provider.of<CountryData>(context).countryData![index]['deaths']}',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
            itemCount: 5,
          );
        },
      ),
    );
  }
}
