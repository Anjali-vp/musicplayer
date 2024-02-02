// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import '../models/song_model.dart';
// class SongScreen extends StatelessWidget {
//   const SongScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     Song song=Song.songs[0];
//
//
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         fit:StackFit.expand ,
//         children: [
//            Image.asset(
//              song.coverUrl,
//              fit:BoxFit.cover,
//            ),
//           const _BackgroundFilter()
//         ],
//       ),
//     );
//   }
// }
//
// class _BackgroundFilter extends StatelessWidget {
//   const _BackgroundFilter({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (rect){
//         return LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.white,
//             Colors.white.withOpacity(0.5),
//             Colors.white.withOpacity(0.0),
//           ],
//           stops: [0.0,0.4,0.6]
//         ).createShader(rect);
//       },
//       blendMode: BlendMode.dstOut,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.deepPurple.shade800,
//               Colors.deepPurple.shade200,
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }
//
//class MyApp extends StatelessWidget {
//   const MyApp ({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
// return Container(
//        child: const Row(
//             mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
//             children: [
//             Icon(Icons.skip_previous_outlined,
//             color: Colors.white, size: 40),
//              Icon(Icons.pause, color: Colors.white, size: 50),
//              Icon(Icons.skip_next_outlined,
//            color: Colors.white, size: 40)
//        ],
//        ),
//     );
//   }
// }
// // child: const Padding(
// // padding: EdgeInsets.symmetric(horizontal: 20),
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Icon(Icons.replay_outlined,
// // color: Colors.white, size: 40),
// // Icon(Icons.shuffle, color: Colors.white, size: 40)
// // ],
// // ),
// // ),




// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Song Player',
//       home: SongScreen(),
//     );
//   }
// }
//
// class SongScreen extends StatefulWidget {
//   @override
//   _SongScreenState createState() => _SongScreenState();
// }
//
// class _SongScreenState extends State<SongScreen> {
//   final AudioPlayer player = AudioPlayer();
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   String songTitle = 'Song Title'; // Initialize song title
//
//   @override
//   void initState() {
//     super.initState();
//    // player.setUrl('path/to/your/song.mp3');
//     player.positionStream.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//     player.durationStream.listen((event) {
//       setState(() {
//         duration = event!;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     player.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Song Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Song artwork
//             Container(
//               height: 200,
//               width: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: AssetImage('assets/covers/musicbg.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             // Song title and artist
//             SizedBox(height: 20),
//             Text(
//               songTitle, // Display song title
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 5),
//             Text('Artist Name'),
//
//             // Song progress bar
//             Slider(
//               value: position.inSeconds.toDouble(),
//               max: duration.inSeconds.toDouble(),
//               onChanged: (value) {
//                 player.seek(Duration(seconds: value.toInt()));
//               },
//             ),
//
//             // Play/pause button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
//                   onPressed: () {
//                     if (player.playing) {
//                       player.pause();
//                     } else {
//                       player.play();
//                     }
//                   },
//                 ),
//               ],
//             ),
//
//             // Previous and next buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.skip_previous),
//                   onPressed: () {
//                     // Implement logic to play previous song
//                   },
//                 ),
//                 SizedBox(width: 20),
//                 IconButton(
//                   icon: Icon(Icons.skip_next),
//                   onPressed: () {
//                     // Implement logic to play next song
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Player',
      home: SongScreen(),
    );
  }
}

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    player.setUrl('path/to/your/song.mp3');
    player.positionStream.listen((event) {
      setState(() {
        position = event;
      });
    });
    player.durationStream.listen((event) {
      setState(() {
        duration = event!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.deepPurple.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Song artwork
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/covers/musicbg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Song title and artist
            SizedBox(height: 20),
            Text(
              'Song Title',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text('Artist Name'),

            // Song progress bar
            Slider(
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (value) {
                player.seek(Duration(seconds: value.toInt()));
              },
            ),

            // Play/pause button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
                  onPressed: () {
                    if (player.playing) {
                      player.pause();
                    } else {
                      player.play();
                    }
                  },
                ),
              ],
            ),

            // Previous and next buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {
                    // Implement logic to play previous song
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: () {
                    // Implement logic to play next song
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

