import 'package:flutter/material.dart';
import 'package:whatsapp2/models/playlist_model.dart';
import 'package:whatsapp2/models/song_model.dart';

import '../widgets/playlist_card.dart';
import '../widgets/section_header.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> song = Song.songs;
    List<Playlist> playlists = Playlist.playlists;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8)
          ],
        ),
      ),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        appBar:const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
             const _DiscoverMusic(),
              TrendingMusic(song: song,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SectionHeader(title: "Playlists"),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playlists.length,
                        itemBuilder: ((context,index){
                          return PlaylistCard(playlists: playlists[index]);
                        })
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.song,
  });

  final List<Song> song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left:20,
          top: 20,
          bottom: 20
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: SectionHeader(title: "Trending music"),
          ),
           const SizedBox(height: 20,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: song.length,
                itemBuilder: (context, index){
                return SongCard(song: song[index]);
                }
            ),
          )
        ],
      ),
    );
  }
}




class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("hai guys how are you",
              style: Theme.of(context)
                  .textTheme.bodyLarge
          ),
          const SizedBox(height: 20,),
          Text("i am fine thanks",
            style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 20,),
          TextFormField(decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey.shade400),
            prefixIcon: Icon(Icons.search,color:Colors.grey.shade400 ,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide.none
            )
          ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        label: "Favourites",),
        BottomNavigationBarItem(
        icon: Icon(Icons.play_circle_outline),
    label: "Play",),
      BottomNavigationBarItem(
        icon: Icon(Icons.people_outline),
        label: "People",),
       ],
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "data:image/jpeg;base64,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"
            ),
          ),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(56);
}


