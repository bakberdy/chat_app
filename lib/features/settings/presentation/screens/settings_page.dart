import 'package:chat_app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:chat_app/features/settings/presentation/widgets/buttons_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthEvent.getMe());
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Settings',
          height: 50,
          pageContext: context,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: BlocSelector<AuthBloc, AuthState, StateStatus>(
              selector: (state) => state.status,
              builder: (context, state) {
                return SmartRefresher(
                  onRefresh: () {
                    context.read<AuthBloc>().add(AuthEvent.getMe());
                    if (!state.isLoading) {
                      _refreshController.refreshCompleted(
                          resetFooterState: true);
                    }
                  },
                  header: ClassicHeader(
                    refreshingIcon: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: themeData.hintColor,
                          strokeWidth: 2,
                        )),
                    completeIcon:
                        Icon(Icons.check, weight: 2, color: Colors.green),
                    failedIcon: Icon(Icons.error, color: Colors.red),
                  ),
                  controller: _refreshController,
                  child: ListView(
                    children: [
                      SizedBox(height: 15),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return UserInfoWidget(
                            showOnlineIndicator: false,
                            user: state.currentUser,
                            isLoading: state.status.isLoading,
                          );
                        },
                      ),
                      SizedBox(height: 25),
                      ButtonsList(
                        children: [
                          ButtonDetails(
                              onTap: () {
                                context.push(
                                    '${AppPaths.settings}${AppPaths.profile}');
                              },
                              title: 'Profile',
                              prefixIcon: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      'lib/assets/icons/profile.png'))),
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
                                  child: Image.asset(
                                      'lib/assets/icons/feature.png'))),
                          ButtonDetails(
                              onTap: () {},
                              title: 'Talky FAQ',
                              prefixIcon: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      'lib/assets/icons/question.png')))
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
