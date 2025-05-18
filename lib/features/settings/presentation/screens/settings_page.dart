import 'package:chat_app/core/auth/auth_listener.dart';
import 'package:chat_app/core/navigation/routing/app_paths.dart';
import 'package:chat_app/core/shared/entities/user_entity.dart';
import 'package:chat_app/core/shared/widgets/user_info_widget.dart';
import 'package:chat_app/features/settings/presentation/widgets/buttons_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final user = UserEntity.empty();

  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    print('builded page');
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                context.read<AuthListener>().signOut();
              },
              style: ButtonStyle(
                  enableFeedback: true,
                  padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                  backgroundColor:
                      WidgetStatePropertyAll(Colors.grey.shade200)),
              child: Text('log out'),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SmartRefresher(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 3));
              _refreshController.refreshCompleted();
            },
            header: ClassicHeader(
              refreshingIcon: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: themeData.hintColor,
                    strokeWidth: 2,
                  )),
              completeIcon: Icon(Icons.check, weight: 2, color: Colors.green),
              failedIcon: Icon(Icons.error, color: Colors.red),
            ),
            controller: _refreshController,
            child: ListView(
              children: [
                SizedBox(height: 15),
                Consumer<AuthListener>(
                  builder: (context, authlistener, _) {
                    print('builded consiumer');
                    final user = authlistener.currentUser;
                    if(user == null) return Text('User not authorized');
                    return UserInfoWidget(
                      user: user,
                      isLoading: !authlistener.isAuthorized,
                    );
                  }
                ),
                SizedBox(height: 25),
                ButtonsList(
                  children: [
                    ButtonDetails(
                        onTap: () {
                          context.push(
                              '${AppPaths.settings}${AppPaths.profile}/${context.read<AuthListener>().uuid}');
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
                        title: 'Talky Features',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('lib/assets/icons/feature.png'))),
                    ButtonDetails(
                        onTap: () {},
                        title: 'Talky FAQ',
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child:
                                Image.asset('lib/assets/icons/question.png')))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
