import 'package:chat_app/core/shared/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class ScrollablePageWithAppBar extends StatelessWidget {
  const ScrollablePageWithAppBar({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.searchController,
    this.showSearchBar = true,
  });
  final String appBarTitle;
  final Widget body;
  final TextEditingController? searchController;
  final bool showSearchBar;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              expandedHeight: 120,
              snap: true,
              floating: true,
              pinned: true,
              backgroundColor: Colors.white,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 10.0, top: 20),
                        child: Text(
                          appBarTitle,
                          style: themeData.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      if (showSearchBar)
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: themeData.hintColor.withAlpha(60),
                              ),
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CustomSearchBar(
                            controller: searchController,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: body,
      ),
    );
  }
}
