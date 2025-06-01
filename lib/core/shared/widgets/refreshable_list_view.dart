import 'package:chat_app/core/shared/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshableListView extends StatefulWidget {
  const RefreshableListView(
      {super.key,
      required this.themeData,
      required this.isLoading,
      required this.onRefresh,
      required this.emptyListWidget,
      required this.itemBuilder,
      this.separatorBuilder,
      required this.itemCount});

  final ThemeData themeData;
  final bool isLoading;
  final Future<void> Function() onRefresh;
  final InfoWidget emptyListWidget;
  final NullableIndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final int itemCount;

  @override
  State<RefreshableListView> createState() => _RefreshableListViewState();
}

class _RefreshableListViewState extends State<RefreshableListView> {
  final RefreshController _refreshController = RefreshController();

  Future<void> _handleRefresh() async {
    await widget.onRefresh();
  }

  @override
  void didUpdateWidget(covariant RefreshableListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      Future.delayed(Duration.zero, () {
        if (!mounted) return;
        if (widget.isLoading && !_refreshController.isRefresh) {
          _refreshController.requestRefresh(needCallback: false);
        } else if (!widget.isLoading && _refreshController.isRefresh) {
          _refreshController.refreshCompleted();
        }
      });
    }
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_refreshController.isRefresh) {
          _refreshController.requestRefresh(needCallback: false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _handleRefresh,
      physics: const AlwaysScrollableScrollPhysics(),
      header: ClassicHeader(
        refreshingText: 'Loading',
        refreshingIcon: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: widget.themeData.hintColor,
              strokeWidth: 2,
            )),
        completeText: 'Loaded',
        completeIcon: Icon(Icons.check, weight: 2, color: Colors.green),
        failedIcon: Icon(Icons.error, color: Colors.red),
      ),
      child: widget.itemCount == 0
          ? ListView(children: [
              const SizedBox(height: 100),
              widget.isLoading
                  ? SizedBox()
                  : Center(child: widget.emptyListWidget),
            ])
          : ListView.separated(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
              separatorBuilder: widget.separatorBuilder ??
                  (BuildContext context, int index) => SizedBox(height: 8)),
    );
  }
}
