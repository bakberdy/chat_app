import 'package:chat_app/features/settings/presentation/widgets/buttons_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsPageContent();
  }
}

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({super.key});

  @override
  State<SettingsPageContent> createState() => _SettingsPageContentState();
}

class _SettingsPageContentState extends State<SettingsPageContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Settings',
          height: 50,
          pageContext: context,
        ),
        body: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: ListView(
              children: [
                SizedBox(height: 25),
                ButtonsList(
                  children: [
                    ButtonDetails(
                        onTap: () {
                          context
                              .push('${AppPaths.settings}${AppPaths.profile}');
                        },
                        title: 'Profile',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('lib/assets/icons/profile.png'))),
                  ],
                ),
                SizedBox(height: 20),
                ButtonsList(
                  children: [
                    ButtonDetails(
                        onTap: () {},
                        title: 'Notifications',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                                'lib/assets/icons/notification.png'))),
                    ButtonDetails(
                        onTap: () {},
                        title: 'Language',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('lib/assets/icons/language.png'))),
                    ButtonDetails(
                        onTap: () {},
                        title: 'Change theme',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('lib/assets/icons/night.png'))),
                  ],
                ),
                SizedBox(height: 20),
                ButtonsList(
                  children: [
                    ButtonDetails(
                        onTap: () {},
                        title: 'Help & Support',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('lib/assets/icons/info.png'))),
                    ButtonDetails(
                        onTap: () {},
                        title: 'About Shift',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('lib/assets/icons/about_us.png'))),
                  ],
                )
              ],
            )));
  }
}
