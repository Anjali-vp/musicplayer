import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:musicplayer/screens/home_screen.dart';
import 'package:whatsapp2/screens/home_screen.dart';

import 'screens/playlist_screen.dart';
import 'screens/song_screen.dart';
//import 'package:whatsapp2/main.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter",
      theme: ThemeData( textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/',page: () => const HomeScreen()),
         GetPage(name: '/song',page: () =>  SongScreen()),
         GetPage(name: '/playlist',page: () => const PlaylistScreen()),


      ],
    );
  }
}
