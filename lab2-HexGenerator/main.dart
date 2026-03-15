import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HexRange());
}

class HexRange extends StatefulWidget {
  const HexRange({super.key});

  @override
  State<HexRange> createState() => _HexRangeState();
}

class _HexRangeState extends State<HexRange> {
  // Initial RGB values (255, 255, 173) = #FF00AD
  double _red = 255;
  double _green = 255;
  double _blue = 173;

  String get _hexValue => //integer, hexadecimal, 2 digits, uppercase
      '#${_red.toInt().toRadixString(16).padLeft(2, '0')}'
      '${_green.toInt().toRadixString(16).padLeft(2, '0')}'
      '${_blue.toInt().toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            Positioned( //"Back" text
              bottom: 840,
              left: 25,
              child: Text(
                '< Back',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Positioned( //"Hex Values" text
              bottom: 750,
              left: 38,
              child: Text(
                'Hex Values',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 47,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Positioned( // "156 Lab 2 - Janiola" text
              bottom: 735,
              left: 41,
              child: Text(
                '156 Lab 2 - Janiola',
                style: GoogleFonts.poppins(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Positioned( // Color Box
              bottom: 330,
              left: 40,
              child: Container(
                width: 350,
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(
                    255,
                    _red.toInt(),
                    _green.toInt(),
                    _blue.toInt(),
                  ),
                ),
              ),
            ),

            Positioned( //Display Hex Value
              bottom: 340,
              left: 40,
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                alignment: Alignment.center,
                child: Text(
                  _hexValue,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            Positioned( // Sliders
              bottom: 100,
              left: 50,
              child: SizedBox(
                width: 330,
                child: Column(
                  children: [

                    Text( //Red Slider Label
                      'Red: ${_red.toInt()}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.red, 
                        inactiveTrackColor: Colors.red.shade100,
                        trackHeight: 20,
                        thumbShape: const 
                          RoundSliderThumbShape(enabledThumbRadius: 0), //Remove thumb
                        overlayShape: SliderComponentShape.noOverlay, //Remove overlay
                      ),
                      child: Slider(
                        value: _red,
                        min: 0,
                        max: 255,
                        onChanged: 
                        (value) => setState(
                          () => _red = value), //Update red value on slider change
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text( //Green Slider Label
                      'Green: ${_green.toInt()}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.green.shade100,
                        trackHeight: 20,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        value: _green,
                        min: 0,
                        max: 255,
                        onChanged: (value) => setState(() => _green = value),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text( //Blue Slider Label
                      'Blue: ${_blue.toInt()}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.blue,
                        inactiveTrackColor: Colors.blue.shade100,
                        trackHeight: 20,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: Slider(
                        value: _blue,
                        min: 0,
                        max: 255,
                        onChanged: (value) => setState(() => _blue = value),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}