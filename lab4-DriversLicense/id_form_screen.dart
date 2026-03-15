import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/id_form_data.dart';
import '../widgets/hawaii_id_card.dart';

const double kW = 390.0;
const double kH = 844.0;

class IdFormScreen extends StatefulWidget {
  const IdFormScreen({super.key});
  @override
  State<IdFormScreen> createState() => _IdFormScreenState();
}

class _IdFormScreenState extends State<IdFormScreen> {
  final _formKey = GlobalKey<FormState>(); 
  final _name    = TextEditingController(); //gets user input from text fields 
  final _height  = TextEditingController();
  final _weight  = TextEditingController();
  final _hair    = TextEditingController();
  final _eyes    = TextEditingController();
  final _sex     = TextEditingController();
  final _address = TextEditingController();

  @override
  void dispose() {
    for (final c in [_name, _height, _weight, _hair, _eyes, _sex, _address]) c.dispose(); //frees memory so app doesn't leak resources.
    super.dispose(); //cleanup method that runs when the widget is removed 
  }

  void showID() {
    if (!_formKey.currentState!.validate()) return; 
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,

        child: DriversLicense(
          data: IdFormData(
            name: _name.text, 
            height: _height.text, 
            weight: _weight.text,
            hairColor: _hair.text, 
            eyeColor: _eyes.text, 
            sex: _sex.text,
            city: 'Honolulu', 
            address: _address.text,

          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FittedBox(
          child: SizedBox(
            width: kW,
            height: kH,
            child: Scaffold(
              backgroundColor: const Color(0xFFF2F2F7),

              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),

                  child: Form( //a container for form fields that provides validation 
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      
                      children: [
                        // ── Header ────────────────────────────
                        const Text('Driver License', 
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.w800, 
                          color: Color.fromARGB(255, 8, 106, 49), 
                          letterSpacing: -0.5)),

                        const SizedBox(height: 4),

                        const Text('Fill in your details below', 
                        style: TextStyle(
                          fontSize: 14, 
                          color: Color(0xFF8E8E93))),
                          
                        const SizedBox(height: 24),

                        // ── Fields ────────────────────────────
                        _f(_name,    'Full Name',   Icons.person_outline,         cap: TextCapitalization.words),
                        _f(_sex,     'Sex',         Icons.wc_outlined,            cap: TextCapitalization.words),
                        _f(_address, 'Address',     Icons.home_outlined,          cap: TextCapitalization.sentences),
                        _fLocked(    'City',        Icons.location_city_outlined),
                        
                        Row(children: [
                          Expanded(child: _f(_height, 'Height (cm)', Icons.height,                  num: true)),
                          const SizedBox(width: 12),
                          Expanded(child: _f(_weight, 'Weight (kg)', Icons.monitor_weight_outlined, num: true)),
                        ]),
                        
                        Row(children: [
                          Expanded(child: _f(_hair, 'Hair Color', Icons.brush_outlined,             cap: TextCapitalization.words)),
                          const SizedBox(width: 12),
                          Expanded(child: _f(_eyes, 'Eye Color',  Icons.remove_red_eye_outlined,    cap: TextCapitalization.words)),
                        ]),

                        const SizedBox(height: 16),

                        // ── Button ────────────────────────────
                        SizedBox(
                          height: 54,
                          child: ElevatedButton(
                            onPressed: showID,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 8, 106, 49),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            ),
                            child: const Text('SHOW MY ID', 
                            style: TextStyle(
                              fontWeight: FontWeight.w800, 
                              fontSize: 15, 
                              letterSpacing: 1.5)),
                          ),
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
    );
  }
  
  // Helper method to create form fields with consistent styling and validation
  Widget _f(TextEditingController c, String label, IconData icon, {
    bool num = false, TextCapitalization cap = TextCapitalization.none,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: c, 
        textCapitalization: cap,
        keyboardType: num ? TextInputType.number : TextInputType.text, //brings up numeric keyboard on mobile devices if the field is for numbers
        inputFormatters: num ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))] : null, //allows only numbers and an optional decimal 
        validator: (v) => (v == null || v.isEmpty) ? 'Required' : null, 
        
        style: const TextStyle( fontSize: 15, color: Color(0xFF1C1C1E)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF8E8E93), fontSize: 14),
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 21, 167, 82), size: 20),
          filled: true, fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          enabledBorder:      OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder:      OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color.fromARGB(255, 21, 167, 82), width: 1.5)),
        ),
      ),
    );
  }

  // A variation of the above method for fields that are locked (read-only) with a lock icon
  Widget _fLocked(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        initialValue: 'Honolulu',
        readOnly: true,
        
        style: const TextStyle(fontSize: 15, color: Color(0xFF1C1C1E)),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF8E8E93), fontSize: 14),
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 21, 167, 82), size: 20),
          suffixIcon: Icon(Icons.lock_outline, size: 14, color: Colors.grey.shade400),
          filled: true, fillColor: const Color(0xFFEEEEF3),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
        ),
      ),
    );
  }
}