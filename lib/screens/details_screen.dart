import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constant.dart';
import 'map_screen.dart'; // تأكد من استيراد MapScreen

class DestinationDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DestinationDetailsScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(destination['name'],style: GoogleFonts.cairo(color: Colors.white)),
        backgroundColor: kTextLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Country: ${destination['country']}',
              style: GoogleFonts.cairo(fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              'Attractions:',
              style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: destination['attractions'].length,
                itemBuilder: (context, index) {
                  final attraction = destination['attractions'][index];
                  return Card(
                    color:  kPrimaryColor ,
                    margin: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (attraction['image'] != null)
                            Image.asset(
                              attraction['image'],
                              width: 200,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          SizedBox(height: 10),
                          Text(
                            attraction['name'],
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            attraction['description'],
                            style: GoogleFonts.cairo(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                    latitude: attraction['latitude'],   // تمرير خط العرض للمعلم
                                    longitude: attraction['longitude'], // تمرير خط الطول للمعلم
                                    locationName: attraction['name'],   // اسم المعلم
                                  ),
                                ),
                              );
                            },
                            child: Text('Show on Map',style: GoogleFonts.cairo(color: Colors.white)),
                            style: ElevatedButton.styleFrom(backgroundColor: kTextColor),
                          ),
                        ],
                      ),
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
}
