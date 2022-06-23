import 'package:flutter/material.dart';

class UNADButton extends StatefulWidget {

  final String label;
  final Color color;
  final IconData? icon;
  final bool? isEnabled;
  final Function onTap;

  const UNADButton({super.key, 
    required this.label, 
    required this.color, 
    this.icon,
    this.isEnabled = true,
    required this.onTap
  });

  @override
  State<UNADButton> createState() => _UNADButtonState();
}

class _UNADButtonState extends State<UNADButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isEnabled!) {
          widget.onTap();
        }
      } ,
      child: Opacity(
        opacity: widget.isEnabled! ? 1 : 0.5,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.icon != null ? Align(alignment: Alignment.centerLeft, child: Icon(widget.icon, color: Colors.white)) : const SizedBox(height: 25),
              Align(
                alignment: Alignment.center,
                child: Text(widget.label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}