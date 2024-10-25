
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../details_page/image_detail.dart';
import '../../data/models/wallpaper_model.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    Key? key,
    required this.photo,
  }) : super(key: key);

  Photos photo;
  bool isfavourite = false;
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
              print(photo.src!.large2X!);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageDetail(
                            photo: photo,
                          ),),);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage.memoryNetwork(
                imageScale: 0.5,
                ///////////////////////////////////////
                placeholder: Uint8List(12),
                image: photo.src!.medium!,
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
                  color: HexColor(photo.avgColor!),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
