import 'enum.dart';

import '../constant/lists.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  static bool isDark(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  }

  static double screeHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screeWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static String generateTrendingUrl(int page) =>
      '${APIConstant.trendingUrl}$page';
  static String generatePopularUrl(int page) =>
      '${APIConstant.popularUrl}$page';

  static String generateMovieDetailsUrl(String movieId) =>
      '${APIConstant.baseUrl}/movie/$movieId?api_key=${APIConstant.apiKey}&append_to_response=videos,credits,reviews,similar';
  static String generateSearchUrl(String query) =>
      '${APIConstant.searchMovieUrl}$query&api_key=${APIConstant.apiKey}&language=en-US&sort_by=release_date.desc';

  static String generateImageUrl(String path) =>
      '${APIConstant.baseImageURL}$path';
  static String generateGenreUrl(String id) => '${APIConstant.genreUrl}$id';
  static String generateProfileUrl(String path) =>
      '${APIConstant.baseProfileUrl}$path';
  static String generateAvatarUrl(String path) =>
      '${APIConstant.baseAvatarUrl}$path';
  static Uri generateVideoUrl(String key) =>
      Uri.parse('${APIConstant.baseVideoUrl}$key');

  static Future<void> launchVideoUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  static List<String> getGenreById(List<int> ids) {
    const genres = Lists.listOfGenres;
    List<String> names = [];
    for (int i = 0; i < ids.length; i++) {
      for (int x = 0; x < genres.length; x++) {
        if (ids[i] == genres[x]['id']) {
          names.add(genres[x]['name']);
          continue;
        }
      }
    }
    return names;
  }

  static String formatDate(var date) {
    return DateFormat.yMMMMd('en_US').format(date);
  }

  static String getYear(var date) {
    return DateFormat.y().format(date);
  }

  static String minutesToHours(int minutes) {
    int hours = minutes ~/ 60;
    int remainingMinutes = minutes % 60;
    return "${hours}h ${remainingMinutes}m";
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static getMovieListName(String type) {
    switch (type) {
      case 'upcoming':
        return MoviesList.upcoming;
      case 'trending':
        return MoviesList.trending;
      case 'popular':
        return MoviesList.popular;
      default:
        return;
    }
  }
}
