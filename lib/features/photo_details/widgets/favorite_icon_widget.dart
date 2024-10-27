import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wwalper_app/features/favorite/data/models/argument_model.dart';

import '../../../core/theming/colors.dart';
import '../../favorite/logic/favorite_provider.dart';
import '../../home/logic/home_provider.dart';
class FavoriteIconWidget extends StatelessWidget {
   FavoriteIconWidget({Key? key, required this.argumentModel}) : super(key: key);
  ArgumentModel argumentModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    homeProvider.favorite(!argumentModel.isfavorite);
                    argumentModel.isfavorite = homeProvider.isFavorite;
                    await Provider.of<PhotosProvider>(context, listen: false)
                        .addFavoritePhoto(argumentModel.photo);
                    // setState(() {
                    //   Provider.of<PhotosProvider>(context, listen: false).getFavoritePhotos();
                    // });
                  },
                  icon: argumentModel.isfavorite
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
    );
  }
}
