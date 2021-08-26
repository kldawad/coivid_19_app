import 'package:covid_19_app/network/cases_data.dart';
import 'package:covid_19_app/ui/most_affected_panel.dart';
import 'package:covid_19_app/ui/world_panel.dart';
import 'package:covid_19_app/utils/constants.dart';
import 'package:covid_19_app/utils/data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'country_screen.dart';
import 'info_panel.dart';
import 'package:provider/provider.dart';
import 'package:covid_19_app/models/country_data.dart';
import 'package:covid_19_app/ui/country_screen.dart';

CasesData casesData = CasesData();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future fetchData() async {
    Provider.of<CountryData>(context, listen: false).fetchCountryData();
    Provider.of<CountryData>(context, listen: false).fetchTotalCases();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(fontFamily: 'Circular'),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 100,
                color: Colors.orange.shade100,
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'World Wide',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          CountryScreen(),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kprimaryBlack,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Provider.of<CountryData>(context).worldData == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : WorldwidePanel(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Most Affected Countries',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Provider.of<CountryData>(context).countryData == null
                  ? Container()
                  : MostAffectedPanel(),
              InfoPanel(),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'WE ARE TOGETHER IN THE FIGHT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
