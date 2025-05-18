import 'package:flutter/material.dart';

class PageNotAuthorized extends StatelessWidget {
  const PageNotAuthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Authorized'),),
    );
  }
}