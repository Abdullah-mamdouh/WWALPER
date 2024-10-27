import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/core/helpers/extensions/navigator.dart';
import 'package:wwalper_app/core/routing/routes.dart';
import 'package:wwalper_app/core/utils/constants.dart';
import 'package:wwalper_app/features/favorite/data/models/argument_model.dart';
import '../../../home/data/models/wallpaper_model.dart';
import '../../logic/favorite_provider.dart';

class FavoriteCardImage extends StatelessWidget {
  FavoriteCardImage({
    Key? key,
    required this.index,
    required this.photo,
  }) : super(key: key);
  int index;
  Photos photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).cardColor),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Future.microtask(() => context.pushNamed(
                  Routes.imageDetailsScreen,
                  arguments: ArgumentModel(photo: photo, isfavorite: true)));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage.memoryNetwork(
                imageScale: 0.5,
                placeholder: ConstantsText.kTransparentImage,
                imageErrorBuilder: (context, error, stackTrace) => Container(),
                image: photo.src!.medium!,placeholderErrorBuilder: (context, error, stackTrace) => Container(),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 5, left: 15, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<PhotosProvider>(context, listen: false)
                              .removePhoto(index);
                        },
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          //color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor(
                    photo.avgColor!,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
