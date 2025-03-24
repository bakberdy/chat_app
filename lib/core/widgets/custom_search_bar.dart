import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28, vertical: 5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 6,
            color: Color(0xff000000).withAlpha(25))
      ]),
      height: 40,
      width: double.infinity,
      child: TextField(
        controller: controller,
        style: themeData.textTheme.bodyMedium,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: themeData.hintColor,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            hintText: "Search",
            hintStyle: themeData.textTheme.bodyMedium
                ?.copyWith(color: themeData.hintColor)),
      ),
    );
  }
}
