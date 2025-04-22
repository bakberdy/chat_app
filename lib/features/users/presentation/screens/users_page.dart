import 'package:chat_app/core/bloc/state_status.dart';
import 'package:chat_app/core/shared/widgets/cupertino_segmented_menu.dart';
import 'package:chat_app/features/users/presentation/blocs/users_bloc/users_bloc.dart';
import 'package:chat_app/features/users/widgets/users_list.dart';
import 'package:chat_app/core/shared/widgets/scrollable_page_with_app_bar.dart';
import 'package:chat_app/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final TabController tabController;
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<UsersBloc>()
      ..add(LoadFriendsRequested())
      ..add(LoadAllUsersRequested());
    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(() {
      final value = tabController.animation!.value;
      final newIndex = value.round();
      if (currentPageNotifier.value != newIndex) {
        currentPageNotifier.value = newIndex;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    currentPageNotifier.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        body: ScrollablePageWithAppBar(
          searchController: searchController,
          appBarTitle: 'Friends',
          body: ValueListenableBuilder<int>(
            valueListenable: currentPageNotifier,
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
                              tabController.animateTo(value,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            currentPageNotifier.value = value;
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
                            controller: tabController,
                            children: [
                              UsersList(
                                users: friends,
                                onTap: (String uuid) {},
                                onRefresh: () async {
                                  print('refreshed friends');
                                  context
                                      .read<UsersBloc>()
                                      .add(LoadFriendsRequested());
                                },
                                isLoading: state.friendsStatus is LoadingStatus,
                              ),
                              UsersList(
                                users: allUsers,
                                onTap: (String uuid) {},
                                onAddToFriend: (String uuid) {},
                                onRefresh: () async {
                                  print('refreshed all users');
                                  context
                                      .read<UsersBloc>()
                                      .add(LoadAllUsersRequested());
                                },
                                isLoading:
                                    state.allUsersStatus is LoadingStatus,
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
