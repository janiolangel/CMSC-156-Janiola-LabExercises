import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HexRange());
}

// ── iPhone 14 Pro Max logical resolution ──
const double kDeviceWidth  = 430.0;
const double kDeviceHeight = 932.0;

class HexRange extends StatefulWidget {
  const HexRange({super.key});

  @override
  State<HexRange> createState() => _HexRangeState();
}

class _HexRangeState extends State<HexRange> {
  double _red   = 19;
  double _green = 31;
  double _blue  = 78;

  String get _hexValue =>
      '#${_red.toInt().toRadixString(16).padLeft(2, '0')}'
      '${_green.toInt().toRadixString(16).padLeft(2, '0')}'
      '${_blue.toInt().toRadixString(16).padLeft(2, '0')}'
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    // Scale factor based on actual screen vs iPhone 14 Pro Max
    final actual = MediaQuery.of(context).size;
    final scaleX = actual.width  / kDeviceWidth;
    final scaleY = actual.height / kDeviceHeight;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          // Lock to exact iPhone 14 Pro Max dimensions, scaled to fit screen
          child: SizedBox(
            width:  actual.width,
            height: actual.height,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.center,
              child: SizedBox(
                width:  kDeviceWidth,
                height: kDeviceHeight,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 24),

                          // < Back
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              '< Back',
                              style: GoogleFonts.poppins(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Title
                          Text(
                            'Hex Values',
                            style: GoogleFonts.poppins(
                              fontSize: 47,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              height: 1.1,
                            ),
                          ),

                          // Subtitle
                          Text(
                            '156 Lab 2 - Janiola',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Color Box
                          Container(
                            width: double.infinity,
                            height: 298,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(
                                255,
                                _red.toInt(),
                                _green.toInt(),
                                _blue.toInt(),
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft:  Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                          ),

                          // Hex Value Bar
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: const BorderRadius.only(
                                bottomLeft:  Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                              border: Border(
                                left:   BorderSide(color: Colors.grey.shade300),
                                right:  BorderSide(color: Colors.grey.shade300),
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              _hexValue,
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                          const SizedBox(height: 28),

                          // Red Slider
                          _buildSlider(
                            context,
                            label: 'Red',
                            value: _red,
                            activeColor: Colors.red,
                            inactiveColor: Colors.red.shade100,
                            onChanged: (v) => setState(() => _red = v),
                          ),

                          const SizedBox(height: 16),

                          // Green Slider
                          _buildSlider(
                            context,
                            label: 'Green',
                            value: _green,
                            activeColor: Colors.green,
                            inactiveColor: Colors.green.shade100,
                            onChanged: (v) => setState(() => _green = v),
                          ),

                          const SizedBox(height: 16),

                          // Blue Slider
                          _buildSlider(
                            context,
                            label: 'Blue',
                            value: _blue,
                            activeColor: Colors.blue,
                            inactiveColor: Colors.blue.shade100,
                            onChanged: (v) => setState(() => _blue = v),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(
    BuildContext context, {
    required String label,
    required double value,
    required Color activeColor,
    required Color inactiveColor,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toInt()}',
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor:   activeColor,
            inactiveTrackColor: inactiveColor,
            trackHeight: 14,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 14),
            thumbColor: activeColor,
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}