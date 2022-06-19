import 'package:flutter/material.dart';

class UNADButton extends StatelessWidget {

  final String label;
  final Color color;
  final IconData? icon;
  final bool? isEnabled;
  Function onTap;

  UNADButton({super.key, 
    required this.label, 
    required this.color, 
    this.icon,
    this.isEnabled = true,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled!) {
          onTap();
        }
      } ,
      child: Opacity(
        opacity: isEnabled! ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              icon != null ? Align(alignment: Alignment.centerLeft, child: Icon(icon, color: Colors.white)) : const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}