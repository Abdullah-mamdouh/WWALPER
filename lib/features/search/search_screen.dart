import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/features/search/widgets/search_appbar_widget.dart';
import 'package:wwalper_app/features/search/widgets/search_result_widget.dart';

import '../../core/di/injection.dart';
import '../home/logic/home_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<HomeProvider>(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: const SearchAppBarWidget(),
          body: TabBarView(
            children: [
              SearchResultWidget(),
              SizedBox.shrink(),
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
