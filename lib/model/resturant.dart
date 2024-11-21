import 'package:latlong2/latlong.dart';

class Restaurant {
  final String name;
  final String city;
  final String image;
  final LatLng location;
  bool isFavorite;

  Restaurant( {
    required this.city,
    required this.name,
    required this.image,
    required this.location,
    this.isFavorite = false,
  });
}

  final List<Restaurant> restaurants = [
    Restaurant(
      name: "مطعم وكافيه لوريت",
      city: "الرس",
      image: "assets/images/lurette.jpg",
      location: LatLng(25.2048, 55.2708),
    ),
    Restaurant(
      name: "مطعم وكافيه اوريجانو",
      city: "الرس",
      image: "assets/images/oregano.jpg",
      location: LatLng(24.4539, 54.3773),
    ),
    Restaurant(
      name: "مطعم لوفت",
       city: "الرس",
      image: "assets/images/loft.jpg",
      location: LatLng(25.2760, 55.2965),
    ),
    Restaurant(
      name: "مطعم دي مانزو",
      city: "الرس",
      image: "assets/images/manzo.jpg",
      location: LatLng(25.2108, 55.2798),
    ),
    Restaurant(
      name: "مطعم اوفن",
      city:"عنيزة",
      image: "assets/images/oven.jpg",
      location: LatLng(24.7136, 46.6753),
    ),
    Restaurant(
      name: "مطعم فينور",
      city:"عنيزة",
      image: "assets/images/venor.jpg",
      location: LatLng(24.7743, 46.7386),
    ),
    Restaurant(
      name: "مطعم WBJ",
      city:"عنيزة" ,
      image: "assets/images/wbj.jpg",
      location: LatLng(25.1860, 55.2690),
    ),
     Restaurant(
      name: "مطعم كراتر",
      city:"بريدة",
      image: "assets/images/kraktr.jpg",
      location:LatLng (26.408299138499824, 43.91112196898202),
    ),
     Restaurant(
      name: "مطعم كذا ميزا",
      city:"بريدة",
      image: "assets/images/kathameza.jpg",
      location:LatLng (26.392570974905833, 43.92118432698824),
    ),
    Restaurant(
      name: "مطعم افيكتو",
      city:"بريدة",
      image: "assets/images/eficto.jpg",
      location:LatLng(26.41491868142902, 43.92252410427517),
    ),

  ];
