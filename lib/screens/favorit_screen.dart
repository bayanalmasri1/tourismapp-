import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourism_app/constant.dart';
import 'package:tourism_app/model/resturant.dart';
import 'package:tourism_app/widgets/resturant_details.dart';


class FavoriteRestaurantsPage extends StatelessWidget {
  final List<Restaurant> favoriteRestaurants;

  FavoriteRestaurantsPage({required this.favoriteRestaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kTextColor,
        title: Text('المفضلة',style: GoogleFonts.cairo(),),
      ),
      body: favoriteRestaurants.isEmpty
          ? Center(child: Text('لا توجد مطاعم مضافة للمفضلة',style: GoogleFonts.cairo(),))
          : ListView.builder(
              itemCount: favoriteRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = favoriteRestaurants[index];
                return Card(
                  color: kPrimaryColor,
                  child: ListTile(

                    leading: Image.asset(restaurant.image, width: 200, height: 200),
                    title: Text(restaurant.name,style: GoogleFonts.cairo(fontSize: 20),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailPage(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
