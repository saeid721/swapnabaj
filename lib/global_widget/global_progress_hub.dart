
import 'package:flutter/material.dart';


class ProgressHub extends StatelessWidget {

  final Widget child;
  final String titileText;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Animation<Color>? valueColor;

  const ProgressHub({
    super.key,
    required this.child,
    required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.black,
    this.valueColor, this.titileText="Please Wait.....",
  }) ;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Material(
            color: Colors.black26,
            child: Center(
              child: Container(
                height: 125,
                width: 120,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading..."),
                  ],
                ),
              ),
            ),
          )
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
