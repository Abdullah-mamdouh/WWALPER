import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wwalper_app/features/home/logic/home_cubit.dart';
import 'package:wwalper_app/features/home/logic/home_state.dart';

class PhotosListWidget extends StatelessWidget {
  const PhotosListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeCubit>(context);
        return Expanded(
          child: SmartRefresher(
            footer: ClassicFooter(
              loadingText: 'Loading',
              noDataText: 'No More Data',
            ),
            enablePullUp: true,
            enablePullDown: true,
            onLoading: () async {
              await cubit.loadMoreData(20);
              // await cubit.loadMoreData(
              //   context: context,
              //   type: type,
              // );
            },
            onRefresh: () async {
              await cubit.refreshData();
              // await cubit.refreshData(
              //   context: context,
              //   type: type,
              // );
            },
            controller: cubit.refreshController,
            child: Container(),
          ),
        );
      },
    );
  }
}
