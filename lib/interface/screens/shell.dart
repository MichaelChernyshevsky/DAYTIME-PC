import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/interface/screens/playlist_screen.dart';
import 'package:flutter_spotify_ui/widgets/current_track.dart';
import 'package:flutter_spotify_ui/widgets/side_menu.dart';

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideMenu(),
                const Expanded(
                  child: PlaylistScreen(playlist: lofihiphopPlaylist),
                ),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}
