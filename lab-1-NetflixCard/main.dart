import 'package:flutter/material.dart';

void main() {
  runApp(const MyNetflixCard());
}

class MyNetflixCard extends StatelessWidget {
  const MyNetflixCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'Lab1: Netflix Card - Janiola',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Netflix Card UI
        body: Center(
          child: Container(
            width: 220,
            height: 340,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // TOP AREA WITH OVERLAY TEXT
                Stack(
                  children: [
                    Container(
                      height: 265,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.movie,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),

                    // Text OVER the red poster
                    const Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        'Sample Movie',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  'Action • Drama • Thriller',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),

                const Spacer(), // Pushes the icons to the bottom

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
        ),
      ),
    );
  }
}
      