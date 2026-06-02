import 'package:flutter/material.dart';

class UnduckText extends StatelessWidget {
  final TextStyle style;

  const UnduckText({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    final charWidth = (style.fontSize ?? 16) * 0.6;
    return Text.rich(TextSpan(
      style: style,
      children: [
        const TextSpan(text: 'Un'),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: SizedBox(
            width: charWidth,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Text('d', style: style),
                Text('f', style: style.copyWith(color: const Color(0x38A03C00))),
              ],
            ),
          ),
        ),
        const TextSpan(text: 'uck'),
      ],
    ));
  }
}
