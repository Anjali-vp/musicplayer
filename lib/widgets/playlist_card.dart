import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
    required this.playlists,
  });

  final Playlist playlists;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/playlist', arguments: playlists);
      } ,
      child: Container(
        height: 75,
        margin: const EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(color: Colors.deepPurple.shade600.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15.0)
        ),

        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(playlists.imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width:20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playlists.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${playlists.songs.length} songs',
                  maxLines: 2,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                )
              ],
            ),

          ),
          IconButton(
              onPressed: () {},
              icon:const Icon(Icons.play_circle,
                color: Colors.white,),
              )
        ],
      ),),
    );
  }
}
//  @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty('playlist', playlist));
//   }
// }