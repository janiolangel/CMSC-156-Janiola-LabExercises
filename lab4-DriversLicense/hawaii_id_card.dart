import 'package:flutter/material.dart';
import '../models/id_form_data.dart';

class DriversLicense extends StatelessWidget {
  final IdFormData data;

  const DriversLicense({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF5F0E8),
        border: Border.all(color: const Color(0xFFB8860B), width: 3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _goldHeader(),
            _stateNumber(),
            _personalDetails(),
          ],
        ),
      ),
    );
  }

  // ── Gold stripe header ─────────────────────────────────
  Widget _goldHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFB8860B), Color(0xFFFFD700), Color(0xFFB8860B)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        children: [
          Container(height: 6, color: const Color(0xFF7A5C00)),
          const SizedBox(height: 6),
          const Text(
            "DRIVER'S LICENSE",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1A237E),
              letterSpacing: 3,
              shadows: [Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2)],
            ),
          ),
          const SizedBox(height: 6),
          Container(height: 6, color: const Color(0xFF7A5C00)),
        ],
      ),
    );
  }

  // ── Sub-header ─────────────────────────────────────────
  Widget _stateNumber() {
    return Container(
      color: const Color(0xFFF5F0E8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('STATE OF HAWAII', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Color(0xFF555555), letterSpacing: 1)),
          Text('CMSC156LAB04',    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Color(0xFF555555), letterSpacing: 1)),
        ],
      ),
    );
  }

  // ── Main body ──────────────────────────────────────────
  Widget _personalDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 12, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: photo
          _buildPhotoBox(),
          const SizedBox(width: 12),

          // Right: info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(children: [
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                      const Icon(Icons.ssid_chart, color: Colors.black45, size: 14),
                    ]),
                  ],
                ),
                const SizedBox(height: 4),

                Text(data.name.toUpperCase(),  //name in uppercase
                style: const TextStyle(
                  fontSize: 10, 
                  fontWeight: FontWeight.w900, 
                  color: Color(0xFF1A1A1A), 
                  letterSpacing: 0.5)),

                const SizedBox(height: 2),

                Text(data.address.toUpperCase(), //address in uppercase
                style: const TextStyle(
                  fontSize: 9, 
                  fontWeight: FontWeight.w700, 
                  color: Color(0xFF1A1A1A))),
                
                Text('${data.city.toUpperCase()}, HAWAII', 
                style: const TextStyle(
                  fontSize: 9, 
                  fontWeight: FontWeight.w700, 
                  color: Color(0xFF1A1A1A))),
                
                const SizedBox(height: 4),

                Row(children: [
                  _labelValue('SEX',  data.sex.substring(0, 1).toUpperCase()),
                  const SizedBox(width: 8),
                  _labelValue('HAIR', data.hairColor.toUpperCase()),
                  const SizedBox(width: 8),
                  _labelValue('EYES', data.eyeColor.toUpperCase()),
                ]),

                const SizedBox(height: 2),

                Row(children: [
                  _labelValue('HT', '${data.height}cm'),
                  const SizedBox(width: 8),
                  _labelValue('WT', '${data.weight}kg'),
                ]),

                const SizedBox(height: 8),

                Text(data.name, //signature in normal case
                style: const TextStyle(
                  fontStyle: FontStyle.italic, 
                  fontSize: 16, color: Color.fromARGB(221, 134, 130, 130))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Photo box ──────────────────────────────────────────
  Widget _buildPhotoBox() {
    return Container(
      width: 85,
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF8B6914), width: 2),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: ClipRRect( //cuts pic to match border
        borderRadius: BorderRadius.circular(2),
        child: Image.asset('assets/image.webp', 
          width: 85, 
          height: 105, 
          fit: BoxFit.cover),
      ),
    );
  }

  // ── Label-value helper ─────────────────────────────────
  Widget _labelValue(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$label: ', 
          style: const TextStyle(
            fontSize: 10, 
            fontWeight: FontWeight.w800, 
            color: Color(0xFF424242))),
          
          TextSpan(text: value,      
          style: const TextStyle(
            fontSize: 10, 
            fontWeight: FontWeight.w600, 
            color: Color(0xFF1A1A1A))),
        ],
      ),
    );
  }
}