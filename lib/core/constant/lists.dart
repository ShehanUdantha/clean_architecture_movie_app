import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Lists {
  static const List<BottomNavigationBarItem> bottomBarItemList = [
    BottomNavigationBarItem(
      icon: Icon(
        Iconsax.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Iconsax.heart,
      ),
      label: 'Favorite',
    ),
  ];

  static const List<Map<String, dynamic>> listOfGenres = [
    {
      'id': 28,
      'name': 'Action',
      'image': 'assets/genres/action.jpg',
    },
    {
      'id': 12,
      'name': 'Adventure',
      'image': 'assets/genres/adventure.jpg',
    },
    {
      'id': 16,
      'name': 'Animation',
      'image': 'assets/genres/animation.jpg',
    },
    {
      'id': 80,
      'name': 'Crime',
      'image': 'assets/genres/crime.jpg',
    },
    {
      'id': 14,
      'name': 'Fantasy',
      'image': 'assets/genres/fantasy.jpg',
    },
    {
      'id': 27,
      'name': 'Horror',
      'image': 'assets/genres/horror.jpg',
    },
    {
      'id': 878,
      'name': 'Sci-Fi',
      'image': 'assets/genres/scifi.jpg',
    },
    {
      'id': 35,
      'name': 'Comedy',
      'image': 'assets/genres/comedy.png',
    },
    {
      'id': 99,
      'name': 'Documentary',
      'image': 'assets/genres/documentary.jpg',
    },
    {
      'id': 18,
      'name': 'Drama',
      'image': 'assets/genres/drama.jpg',
    },
    {
      'id': 10751,
      'name': 'Family',
      'image': 'assets/genres/family.jpg',
    },
    {
      'id': 36,
      'name': 'History',
      'image': 'assets/genres/history.jpg',
    },
    {
      'id': 10402,
      'name': 'Music',
      'image': 'assets/genres/music.webp',
    },
    {
      'id': 9648,
      'name': 'Mystery',
      'image': 'assets/genres/mystery.jpg',
    },
    {
      'id': 10749,
      'name': 'Romance',
      'image': 'assets/genres/romance.jpg',
    },
    {
      'id': 10770,
      'name': 'TV Movie',
      'image': 'assets/genres/tv.jpeg',
    },
    {
      'id': 53,
      'name': 'Thriller',
      'image': 'assets/genres/thriller.png',
    },
    {
      'id': 10752,
      'name': 'War',
      'image': 'assets/genres/war.jpg',
    },
    {
      'id': 37,
      'name': 'Western',
      'image': 'assets/genres/western.jpg',
    },
  ];
}
