
import 'package:flutter/material.dart';
import 'package:instasave/Infrastructure/Base/MediaQuery/get_mediaquery.dart';

class BackCard extends StatelessWidget {
  const BackCard({
    super.key,
    required this.active, required this.position,
  });

  final int active;
  final int position;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: displayHeight(context) * .0406,
      width: displayWidth(context) * .088,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            const Color.fromARGB(
                255, 245, 109, 255)
                .withOpacity(active == position ? 1 : 0),
            const Color.fromARGB(
                255, 158, 36, 255)
                .withOpacity(active == position ? 1 : 0),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}