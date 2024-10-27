import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';
import 'package:wwalper_app/features/home/ui/widgets/home_appbar_widget.dart';
import 'package:wwalper_app/features/home/ui/widgets/photos_list_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<HomeProvider>(context, listen: false).emitGetWallpapersStates();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: PhotosListWidget(),
      ),
    );
  }
}
