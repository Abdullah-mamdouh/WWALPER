// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Widget? leading;
//   final String? title;
//   final double? heightAppBar;
//   final List<Widget>? actions;
//   final VoidCallback? searchTab;
//   final VoidCallback? drawerTab;

//   const CustomAppBar(
//       {super.key,
//       this.leading,
//       this.title,
//       this.heightAppBar,
//       this.actions,
//       this.drawerTab,
//       this.searchTab
//       });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: leading ??
//           IconButton(
//           onPressed: drawerTab,
//           icon: const Icon(
//             Icons.menu,
//             color: Colors.white,
//             size: 35,
//           ),
//              // () => _scaffoldKey.currentState?.openDrawer(),
//         ),
        
//       title: Text(
//         title ,
//         style: TextStyle(
//           fontSize: 20.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       // actions: actions ??
//       //     [
//       //       InkWell(
//       //         onTap: searchTab ?? () {},
//       //         child: SvgPicture.asset(
//       //           AppImages.searchIcon,
//       //           width: 22.w,
//       //           height: 22.h,
//       //         ),
//       //       ),
//       //       horizontalSpace(30),
           
//       //     ],
//     );
//   }

//   @override
//   Size get preferredSize => Size(double.infinity, heightAppBar ?? 50.h);
// }
