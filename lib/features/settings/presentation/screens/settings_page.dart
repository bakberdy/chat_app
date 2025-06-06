import 'package:chat_app/features/settings/presentation/widgets/buttons_list.dart';
import 'package:chat_app/features/settings/profile/presentation/bloc/profile/profile_bloc.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/core.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>(),
      child: SettingsPageContent(),
    );
  }
}

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({super.key});

  @override
  State<SettingsPageContent> createState() => _SettingsPageContentState();
}

class _SettingsPageContentState extends State<SettingsPageContent> {
  final _refreshController = RefreshController();
  late final ProfileBloc _profileBloc;
  String? _currentUserId;

  @override
  void initState() {
    _currentUserId = context.read<AuthListener>().uuid;
    _profileBloc = context.read<ProfileBloc>();
    if (_currentUserId != null) {
      _profileBloc
          .add(ProfileEvent.getCurrentUserProfile(userId: _currentUserId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state is ProfileLoaded || _refreshController.isLoading) {
          debugPrint('dede');
          _refreshController.refreshCompleted();
        }
      },
      child: Scaffold(
          appBar: CustomAppBar(
            title: 'Settings',
            height: 50,
            pageContext: context,
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
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: SmartRefresher(
              onRefresh: () {
                if (_currentUserId != null) {
                  _profileBloc.add(ProfileEvent.getCurrentUserProfile(
                      userId: _currentUserId!));
                } else {
                  showErrorToast("You aren't authorized", context);
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
                completeIcon: Icon(Icons.check, weight: 2, color: Colors.green),
                failedIcon: Icon(Icons.error, color: Colors.red),
              ),
              controller: _refreshController,
              child: ListView(
                children: [
                  SizedBox(height: 15),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return UserInfoWidget(
                        user: (state is ProfileLoaded)
                            ? state.currentUserProfile
                            : null,
                        isLoading: _currentUserId == null,
                      );
                    },
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
          )),
    );
  }
}
