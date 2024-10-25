import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'my_icon_button_widget.dart';

class ImageDetail extends StatefulWidget {
  ImageDetail({
    Key? key,
    this.photo,
    //required this.image, required this.photographer, required this.photographerUrl
  }) : super(key: key);

  //final String image, photographer,photographerUrl;
  final photo;
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  bool isfavourite = false;
  List fav = [];

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage].request();

    final info = statuses[Permission.storage];

    //if user permanently denied permission, open app setting..
    if (info == PermissionStatus.permanentlyDenied) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Text("Open app setting to grant access."),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () async {
                    Navigator.pop(context);
                    openAppSettings();
                  },
                ),
                TextButton(
                  child: Text('Close'),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    var image = widget.photo.src;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: image!.large2x!,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                  imageUrl: image!.large2x!,
                  placeholder: (context, url) => Container(
                        color: Color(0xfff5f8fd),
                      ),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, top: 60),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
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
                    topLeft: Radius.circular(40)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyIconButton(
                    icon: Icons.download_rounded,
                    iconName: 'Download',
                    action: () => (),
                  ),
                  MyIconButton(
                    icon: Icons.wallpaper,
                    iconName: 'set Wallpaper',
                    action: () => (),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
