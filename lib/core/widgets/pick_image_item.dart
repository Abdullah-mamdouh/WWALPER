import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/theming/colors.dart';


class PickImage extends StatefulWidget {
  final File? imageFile;
  final double? circleRadius;
  final Function()? getGalleryImage;
  final Function()? removeImage;
  PickImage(
      {super.key,
      required this.imageFile,
      required this.getGalleryImage,
      this.circleRadius,
      required this.removeImage});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.imageFile != null
            ? Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    radius:widget.circleRadius?? 70.r,
                    backgroundImage: FileImage(widget.imageFile!),
                    backgroundColor: Colors.transparent,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.removeImage!();
                        });
                      },
                      icon: CircleAvatar(
                        radius: 15.0.r,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.delete,
                          color: ColorsManager.mainRed,
                          size: 20.0,
                        ),
                      )),
                ],
              )
            : Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: widget.circleRadius ?? 37.0.r,
                        backgroundColor: ColorsManager.lightBlue,
                      ),
                      CircleAvatar(
                        radius: widget.circleRadius ?? 35.0.r,

                        // backgroundImage: const AssetImage(
                        //   AppImages.person,

                        //     ),

                        backgroundColor: ColorsManager.mainBlue,
                       
                      ),
                      ],
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.getGalleryImage!();
                        });
                      },
                      icon:Icon(
                        Icons.photo,
                        color: Colors.white,
                        size: 30.0.w,
                      )),
                ],
              ),
        verticalSpace(5),
      ],
    );
  }
}
