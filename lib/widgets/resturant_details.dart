import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constant.dart';
import 'package:tourism_app/model/resturant.dart';


class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar
      (  backgroundColor: kTextColor,
        title: Text(restaurant.name,style:GoogleFonts.cairo(color: Colors.white) ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: restaurant.location,
                zoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: restaurant.location,
                      builder: (ctx) => Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(restaurant.image),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    restaurant.isFavorite = !restaurant.isFavorite;
                    
                  },
                  child: Text(restaurant.isFavorite ? 'إزالة من المفضلة' : 'إضافة إلى المفضلة',style:GoogleFonts.cairo (),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
