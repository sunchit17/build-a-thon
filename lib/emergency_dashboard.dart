import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class EmergencyDashboard extends StatefulWidget {
  @override
  _EmergencyDashboardState createState() => _EmergencyDashboardState();
}

class _EmergencyDashboardState extends State<EmergencyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("EMERGENCY"),
      ),
      body: ListView(
        children: <Widget>[
          _buildEmergencyOptions(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Here is a list of hospitals around you",
              style: TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ),
          _buildHospitalList(),
        ],
      ),
    );
  }

  Widget _buildEmergencyOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.red,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.ambulance,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Center(
                      child: Text(
                    "Call an ambulance \nto your location",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )),
                  flex: 3,
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _buildHospitalList() {
    return ListView(
      children: <Widget>[
        _buildHospitalCard("Fortis Hospital", "981273981", "Yelahanka"),
        _buildHospitalCard("AIIMS Hospital", "981273981", "Banerghatta"),
        _buildHospitalCard("Cytecare Hospital", "981273981", "Bagalur"),
      ],
      shrinkWrap: true,
    );
  }

  Widget _buildHospitalCard(
      String hospitalName, String number, String address) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  hospitalName,
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        number,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () => launch("tel://$number")),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  address,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
