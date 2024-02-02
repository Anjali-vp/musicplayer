import 'package:flutter/material.dart';

class Song {
  final String title;
  final String description;
  // final String url;
  final String coverUrl;

  Song({
    required this.title,
    required this.description,
    // required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
        title: "Perfect",
        description: 'pefect',
        // url: null,
        coverUrl: "assets/covers/perfect.png"),

      Song(
         title: "Lover",
         description: "lover",
         // url: url,
         coverUrl: "assets/covers/lover.png"),

      Song(
         title: "Senorita",
         description: 'senorita',
         // url: url,
         coverUrl: "assets/covers/senorita.png"),
  ];
}