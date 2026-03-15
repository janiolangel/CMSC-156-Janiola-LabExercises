import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

const double kDeviceWidth  = 430.0;
const double kDeviceHeight = 932.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyNetflixCard extends StatelessWidget { //Tabs Part
  const MyNetflixCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FittedBox(
          child: SizedBox(
            width: kDeviceWidth,
            height: kDeviceHeight,

            child: DefaultTabController(
              length: 2,
              child: Scaffold(

                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),

                  title: Text('Lab 1', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),

                  bottom: TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    
                    tabs: [
                      Tab(
                        icon: Icon(Icons.play_circle_outline, color: Colors.red),
                        child: Text('Netflix Card', style: GoogleFonts.poppins())),
                      Tab(
                        icon: Icon(Icons.info, color: Colors.red),
                        child: Text('About', style: GoogleFonts.poppins())),
                    ],
                  ),
                ),

                body: const TabBarView(
                  children: [_NetflixCardTab(), _AboutTab()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NetflixCardTab extends StatelessWidget {
  const _NetflixCardTab();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        height: 340,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Red poster with title overlay
            Stack(
              children: [
                Container(
                  height: 265,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Icon(Icons.movie,
                    color: Colors.white,
                    size: 60)),
                ),
                Positioned(
                  bottom: 12, left: 12,
                  child: Text('Sample Movie',
                    style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text('Action • Drama • Thriller',
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12)),
            const Spacer(),

            // Action icons
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.add, color: Colors.white),
                  Icon(Icons.play_arrow, color: Colors.white),
                  Icon(Icons.thumb_up, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutTab extends StatelessWidget {
  const _AboutTab();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold)),

          const SizedBox(height: 12),

          Text(
            'The Netflix card is a dark grey, rounded Container sized at 220×340, which holds a '
            'Column of three sections: at the top, a Stack overlaps a red gradient box (centered '
            'movie icon) with the "Sample Movie" title pinned to its bottom-left; below that, a '
            'genre text reads "Action • Drama • Thriller"; and lastly, a Spacer stretches the '
            'remaining space downward, pushing a Row of add, play, and thumbs-up icons flush '
            "to the card's bottom.",
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black87,
              height: 1.6)),
        ],
      ),
    );
  }
}