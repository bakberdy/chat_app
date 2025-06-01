import 'package:chat_app/features/users/presentation/blocs/users_bloc/users_bloc.dart';
import 'package:chat_app/features/users/presentation/widgets/users_list.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersBloc>(),
      child: UsersPageContent(),
    );
  }
}

class UsersPageContent extends StatefulWidget {
  const UsersPageContent({super.key});

  @override
  State<UsersPageContent> createState() => _UsersPageContentState();
}

class _UsersPageContentState extends State<UsersPageContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final _searchController = TextEditingController();
  // final _friendsScrollController = ScrollController();
  // final _allUsersScrollController = ScrollController();

  @override
  void initState() {
    context.read<UsersBloc>()
      ..add(LoadFriendsRequested())
      ..add(LoadAllUsersRequested());
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animation!.addListener(() {
      final value = _tabController.animation!.value;
      final newIndex = value.round();
      if (_currentPageNotifier.value != newIndex) {
        _currentPageNotifier.value = newIndex;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _currentPageNotifier.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        body: ScrollablePageWithAppBar(
          searchController: _searchController,
          appBarTitle: 'Friends',
          body: ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, _) {
              return Material(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 42,
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoSegmentedMenu<int>(
                        onValueChanged: (int? value) {
                          if (value != null) {
                            if (currentPage != value) {
                              _tabController.animateTo(value,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            _currentPageNotifier.value = value;
                          }
                        },
                        groupValue: currentPage,
                        children: <int, Widget>{
                          0: Text(
                            'Friends',
                            style: themeData.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  currentPage == 0 ? null : themeData.hintColor,
                            ),
                          ),
                          1: Text(
                            'All',
                            style: themeData.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color:
                                  currentPage == 1 ? null : themeData.hintColor,
                            ),
                          ),
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Flexible(
                      child: BlocBuilder<UsersBloc, UsersState>(
                        builder: (context, state) {
                          final friends = state.friends;
                          final allUsers = state.allUsers;
                          return TabBarView(
                            controller: _tabController,
                            children: [
                              UsersList(
                                users: friends,
                                onTap: (String uuid) {
                                  context.push(
                                      '${AppPaths.users}${AppPaths.profile}/$uuid');
                                },
                                onRefresh: () async {
                                  context
                                      .read<UsersBloc>()
                                      .add(LoadFriendsRequested());
                                },
                                isLoading:
                                    state.friendsStatus == StateStatus.loading,
                              ),
                              UsersList(
                                users: allUsers,
                                onTap: (String uuid) {},
                                onAddToFriend: (String uuid) {},
                                onRefresh: () async {
                                  context
                                      .read<UsersBloc>()
                                      .add(LoadAllUsersRequested());
                                },
                                isLoading:
                                    state.allUsersStatus == StateStatus.loading,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
