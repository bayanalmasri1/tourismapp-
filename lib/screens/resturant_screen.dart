import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constant.dart';
import 'package:tourism_app/model/resturant.dart';
import 'package:tourism_app/widgets/resturant_details.dart';

class RestaurantsPage extends StatefulWidget {
  final List<Restaurant> favoriteRestaurants;
  final Function(Restaurant) toggleFavorite;

  RestaurantsPage({
    required this.favoriteRestaurants,
    required this.toggleFavorite,
  });

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  String? selectedCity;

  List<Restaurant> get filteredRestaurants {
    if (selectedCity == null || selectedCity == 'الكل') {
      return restaurants;
    } else {
      return restaurants
          .where((restaurant) => restaurant.city == selectedCity)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kTextColor,
        title: Text('المطاعم', style: GoogleFonts.cairo()),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            hint: Text('اختر المدينة', style: GoogleFonts.cairo()),
            value: selectedCity,
            items: ['الكل', 'الرس', 'عنيزة', 'بريدة']
                .map((city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city, style: GoogleFonts.cairo()),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return Card(
                  color: kPrimaryColor,
                  child: ListTile(
                    title: Column(
                      children: [
                        Image.asset(restaurant.image, width: 300, height: 200),
                        Text(restaurant.name, style: GoogleFonts.cairo()),
                        Text(restaurant.city, style: GoogleFonts.cairo()),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        widget.favoriteRestaurants.contains(restaurant)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.favoriteRestaurants.contains(restaurant)
                            ? Colors.red
                            : null,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.toggleFavorite(restaurant);
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestaurantDetailPage(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
