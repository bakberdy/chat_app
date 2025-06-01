import 'package:flutter/cupertino.dart';

class CupertinoSegmentedMenu<T extends Object> extends StatelessWidget {
  const CupertinoSegmentedMenu({
    super.key,
    required this.onValueChanged,
    required this.groupValue,
    required this.children,
  });

  final ValueChanged<T?> onValueChanged;
  final T groupValue;
  final Map<T, Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 28, left: 28, top: 10),
      child: CupertinoSlidingSegmentedControl<T>(
        backgroundColor: Color(0xffF7F7F9),
        onValueChanged: onValueChanged,
        children: children,
        groupValue: groupValue,
      ),
    );
  }
}
