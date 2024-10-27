import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wwalper_app/core/helpers/spacing.dart';
import 'package:wwalper_app/core/theming/styles.dart';
import 'package:wwalper_app/features/auth/ui/widgets/arrow_back_widget.dart';

class DetailsPhotoAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  DetailsPhotoAppbarWidget({super.key});
  bool isShowWallpaperInfo = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArrowBackWidget(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 70, end: 20),
                  child: Row(
                    children: [
                      Visibility(
                        visible: isShowWallpaperInfo,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShowWallpaperInfo = !isShowWallpaperInfo;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Uploaded: 19/07/2022',
                                      style: TextStyles.font12WhiteBold,
                                    ),
                                    // const AppText(
                                    //   text: 'Uploaded: 19/07/2022',
                                    //   fontSize: 12,
                                    // ),
                                    // 8.width,
                                    horizontalSpace(8),
                                    const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              end: -10,
                              child: CustomPaint(
                                size:
                                    const Size(20, 30), // Adjust size as needed
                                painter: TrianglePainter(),
                              ),
                            )
                          ],
                        ),
                      ),
                      horizontalSpace(15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowWallpaperInfo = true;
                          });
                        },
                        child: const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint style
    final paint = Paint()
      ..color = Colors.grey[100]!
      ..style = PaintingStyle.fill; // Fill the triangle

    // Define the triangle points
    final path = Path()
      ..moveTo(0, size.height) // Bottom-left
      ..lineTo(size.width, size.height / 2) // Forward-right (tip)
      ..lineTo(0, 0) // Top-left
      ..close(); // Connect back to the start point

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
