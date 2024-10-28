import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/core/widgets/custom_show_toast.dart';
import 'package:wwalper_app/features/auth/ui/widgets/arrow_back_widget.dart';
import 'package:wwalper_app/features/favorite/data/models/argument_model.dart';
import 'package:wwalper_app/features/home/data/models/wallpaper_model.dart';
import 'package:wwalper_app/features/photo_details/widgets/favorite_icon_widget.dart';

import '../../core/di/injection.dart';
import '../../core/theming/colors.dart';
import '../favorite/logic/favorite_provider.dart';
import '../home/logic/home_provider.dart';
import 'widgets/my_icon_button_widget.dart';

class ImageDetailScreen extends StatefulWidget {
ArgumentModel argumentModel;

  ImageDetailScreen({
    Key? key,
    required this.argumentModel,
  }) : super(key: key);

  @override
  _ImageDetailScreenState createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {

  @override
  void initState() {
    //_requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var image = widget.argumentModel.photo.src;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: image!.large!,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: image.large!,
                placeholder: (context, url) => Container(
                  color: Color(0xfff5f8fd),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.w, top: 40.h),
            child: Row(
              children: [
                ArrowBackWidget(),
                Spacer(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xff1C1B1B).withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyIconButton(
                    icon: Icons.download_rounded,
                    iconName: 'Download',
                    action: () async{
                      await Provider.of<HomeProvider>(context, listen: false)
                          .downloadImage(image.large2X!, context);
                      showToast(
                        text: "Image Downloaded Successfully",
                        state: ToastStates.success,
                      );
                    },
                  ),
                  MyIconButton(
                    icon: Icons.wallpaper,
                    iconName: 'Set Wallpaper',
                    action: () {
                      Provider.of<HomeProvider>(context, listen: false)
                          .setwallpaper(image.large2X!);
                      showToast(
                        text: "Wallpaper Set as Home Image",
                        state: ToastStates.success,
                      );
                    },
                  ),
                  FavoriteIconWidget(argumentModel: widget.argumentModel),
                  /*Expanded(
                    child: Consumer<HomeProvider>(
                        builder: (context, homeProvider, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  homeProvider.favorite(!widget.argumentModel.isfavorite);
                                  widget.argumentModel.isfavorite = homeProvider.isFavorite;
                                  await Provider.of<PhotosProvider>(context, listen: false)
                                      .addFavoritePhoto(widget.argumentModel.photo);
                                  setState(() {
                                    Provider.of<PhotosProvider>(context, listen: false).getFavoritePhotos();
                                  });
                                },
                                icon: widget.argumentModel.isfavorite
                                    ? Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 40,
                                )
                                    : Icon(
                                  Icons.favorite_border_outlined,
                                  color: ColorsManager.grayLightColor,
                                  size: 40,
                                ),
                              ),
                              Text(
                                "Favorite",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: Colors.white),
                                textAlign: TextAlign.center,
                              )
                            ],
                          );
                        }),
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestPermission() async {
    // Request permissions for Android versions requiring specific media permissions.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      if (await Permission.photos.isPermanentlyDenied) Permission.photos,
    ].request();

    final info = statuses[Permission.storage];

    // Show dialog if permission is permanently denied.
    if (info == PermissionStatus.permanentlyDenied) {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    if (!mounted) return;  // Ensure the widget is still in the tree.

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: Text("Open app settings to grant storage access."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                Navigator.pop(context);
                await openAppSettings();
              },
            ),
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
