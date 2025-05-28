import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showBottomSheetWithButtons(BuildContext context,
    {String? title, required List<BottomSheetActionItem> actions}) {
  final theme = Theme.of(context);
  if (Platform.isAndroid) {
    showModalBottomSheet(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _bottomSheetContent(theme, actions);
        });
  }
  if (Platform.isIOS) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
              title: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  : null,
              actions: actions
                  .map(
                    (e) => CupertinoActionSheetAction(
                      onPressed: e.onTap,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(e.icon, color: theme.primaryColor),
                          SizedBox(width: 10),
                          Text(e.text,
                              style: TextStyle(
                                  fontSize: 16, color: theme.primaryColor)),
                        ],
                      ),
                    ),
                  )
                  .toList());
        });
  }
}

Widget _bottomSheetContent(ThemeData theme, List<BottomSheetActionItem> items) {
  return SafeArea(
    child: ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SizedBox(height: 15);
        }
        final item = items[index - 1];
        return InkWell(
          onTap: item.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                Icon(item.icon, color: theme.primaryColor),
                SizedBox(width: 10),
                Text(item.text, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return index == 0
            ? SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(height: 1),
              );
      },
      itemCount: items.length + 1,
    ),
  );
}

class BottomSheetActionItem {
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  BottomSheetActionItem(
      {required this.onTap, required this.text, required this.icon});
}
