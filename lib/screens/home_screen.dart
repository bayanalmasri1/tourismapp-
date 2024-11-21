import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constant.dart';
import 'package:tourism_app/model/resturant.dart';
import 'package:tourism_app/screens/details_screen.dart';
import 'package:tourism_app/screens/favorit_screen.dart';
import 'package:tourism_app/screens/map_screen.dart';
import 'package:tourism_app/screens/resturant_screen.dart';
import '../model/places.dart';
import '../widgets/destination_card.dart';
import '../widgets/icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Restaurant> favoriteRestaurants = []; // قائمة المطاعم المفضلة
  String searchQuery = ""; // نص البحث
  List<Map<String, dynamic>> filteredDestinations = destinations; // الوجهات المصفاة

  // دالة لتحديث نص البحث وتصفية الوجهات
  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredDestinations = destinations
          .where((destination) =>
              destination['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  // دالة لإضافة أو إزالة المطاعم من قائمة المفضلة
  void toggleFavorite(Restaurant restaurant) {
    setState(() {
      if (favoriteRestaurants.contains(restaurant)) {
        favoriteRestaurants.remove(restaurant);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${restaurant.name} تم إزالته من المفضلة'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        favoriteRestaurants.add(restaurant);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${restaurant.name} تمت إضافته إلى المفضلة'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'السياحة في القصيم ',
          style: GoogleFonts.cairo(color: Colors.white),
        ),
        backgroundColor: kTextLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // إضافة شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'Search destinations, activities...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: updateSearch, // تحديث النص المدخل
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                quickAccessIcon(Icons.home, () {}),
                quickAccessIcon(Icons.restaurant, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantsPage(
                        favoriteRestaurants: favoriteRestaurants,
                        toggleFavorite: toggleFavorite,
                      ),
                    ),
                  );
                }),
                quickAccessIcon(Icons.favorite_border_outlined, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoriteRestaurantsPage(
                        favoriteRestaurants: favoriteRestaurants,
                      ),
                    ),
                  );
                }),
                quickAccessIcon(Icons.map, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        latitude: 24.7136,
                        longitude: 46.6753,
                        locationName: 'القصيم ',
                      ),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'اشهر المناطق ',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDestinations.length, // عرض الوجهات المصفاة
                itemBuilder: (context, index) {
                  final destination = filteredDestinations[index];
                  return DestinationCard(
                    name: destination['name'],
                    imageUrl: 'assets/images/${index + 1}.jpg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationDetailsScreen(
                            destination: destination,
                          ),
                        ),
                      );
                    },
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
