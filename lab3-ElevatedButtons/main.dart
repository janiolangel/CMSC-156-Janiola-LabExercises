import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/lab1_screen.dart';
import 'screens/lab2_screen.dart';

void main() => runApp(const MyApp());

const double kDeviceWidth  = 430.0;
const double kDeviceHeight = 932.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FittedBox(
          child: SizedBox(
            width: kDeviceWidth,
            height: kDeviceHeight,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Title
                    Text(
                      'CMSC 156 LABS',
                      style: GoogleFonts.poppins(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 58, 87, 58),
                      ),
                    ),

                    Text(
                      'AM Janiola',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Lab 1 Button
                    ElevatedButton(
                      onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const MyNetflixCard())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 11, 98, 14),
                        foregroundColor: Colors.white,
                        elevation: 4,
                        fixedSize: const Size(200, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Lab 1', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                              Text('Netflix Card', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    // Lab 2 Button
                    ElevatedButton(
                      onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HexRange())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        fixedSize: const Size(200, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Lab 2', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                              Text('Hex Values', style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}