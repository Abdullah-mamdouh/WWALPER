import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/theming/colors.dart';
import 'package:wwalper_app/core/utils/app_assets.dart';
import 'package:wwalper_app/features/favorite/data/models/argument_model.dart';
import 'package:wwalper_app/features/favorite/logic/favorite_provider.dart';
import 'package:wwalper_app/features/home/logic/home_provider.dart';

import '../../../../core/utils/constants.dart';
import '../../data/models/wallpaper_model.dart';

class ImageCard extends StatefulWidget {
  Photos photo;
  bool? isPremium;
  ImageCard({Key? key, required this.photo, this.isPremium = false})
      : super(key: key);

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Future.microtask(() => Navigator.pushNamed(
            context, Routes.imageDetailsScreen,
            arguments:  ArgumentModel(photo: widget.photo, isfavorite: isfavorite)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).cardColor),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage.memoryNetwork(
                imageScale: 0.5,
                ///////////////////////////////////////
                placeholder: ConstantsText.kTransparentImage,
                image: widget.photo.src!.medium!,
              ),
            ),
            Visibility(
              visible: widget.isPremium!,
              child: PositionedDirectional(
                end: 15.h,
                top: 5.h,
                child: Image.asset(
                  AppAssets.premium,
                  width: 25.w,
                ),
              ),
            ),
            PositionedDirectional(
              end: 15,
              bottom: 5,
              child: Consumer<HomeProvider>(
                  builder: (context, homeProvider, child) {
                return IconButton(
                  onPressed: () async {
                    homeProvider.favorite(!isfavorite);
                    isfavorite = homeProvider.isFavorite;
                    await Provider.of<PhotosProvider>(context, listen: false)
                        .addFavoritePhoto(widget.photo);
                    setState(() {});
                  },
                  icon: isfavorite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border_outlined,
                          color: ColorsManager.grayLightColor,
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
