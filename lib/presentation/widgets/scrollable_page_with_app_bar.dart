import 'package:chat_app/core/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class ScrollablePageWithAppBar extends StatelessWidget {
  const ScrollablePageWithAppBar({super.key, required this.appBarTitle, required this.body, this.searchController, this.showSearchBar= true});
  final String appBarTitle;
  final Widget body;
  final TextEditingController? searchController;
  final bool showSearchBar;


  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            expandedHeight: 120,
            // floating: true,
            pinned: true,
            backgroundColor: Colors.white,
            title: Text(
              appBarTitle,
              style: themeData.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
            flexibleSpace: showSearchBar?LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final currentHeight = constraints.biggest.height;
                double opacity =
                    (currentHeight - kToolbarHeight) / (150 - kToolbarHeight);
                opacity = opacity.clamp(0.0, 1.0);

                return Container(
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
                  child: Opacity(opacity: opacity, child: CustomSearchBar(controller: searchController,)),
                );
              },
            ):null,
          ),
          SliverToBoxAdapter(
            child: body,
          )
      ],
    );
  }
}