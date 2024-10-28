import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/theming/theme_provider.dart';
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
      backgroundColor: Provider.of<ThemeProvider>(context).isDark ? Colors.black : Colors.white,
      appBar: const HomeAppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h,),
        child: PhotosListWidget(),
      ),
    );
  }
}
