// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:taptohello/core/app_export.dart';
// import 'package:taptohello/core/constants.dart';
// import 'package:taptohello/helper/base_screen_view.dart';
// import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

// // ignore: must_be_immutable
// class ProfileItemWidget extends ConsumerStatefulWidget {
//   bool value;
//   final String image;
//   final String title;
//   final String id;
//   Key key;
//   bool? showMenuIcon;
//   ProfileItemWidget(this.value, this.image, this.title, this.id,
//       {this.showMenuIcon = false, required this.key});

//   @override
//   ConsumerState<ProfileItemWidget> createState() =>
//       _EditProfileItemWidgetState();
// }

// class _EditProfileItemWidgetState extends ConsumerState<ProfileItemWidget>
//     with BaseScreenView {
//   late AuthViewModel _viewModel;
//   @override
//   void initState() {
//     super.initState();
//     _viewModel = ref.read(authViewModel);
//     _viewModel.attachView(this);
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       onTap: () {
//         setState(() {
//           _viewModel.toggleService(widget.id);

//           // widget.value = !widget.value;
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.only(
//           top: 15,
//         ),
//         padding: getPadding(
//           left: 17,
//           top: 16,
//           right: 17,
//           bottom: 16,
//         ),
//         decoration: AppDecoration.outlineBlack9003f.copyWith(
//             borderRadius: BorderRadius.circular(12), color: Colors.white),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             widget.showMenuIcon ?? false
//                 ? Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: Icon(
//                       Icons.menu,
//                       color: Color(0xff677b8a80),
//                     ),
//                   )
//                 : SizedBox.shrink(),
//                 ClipRRect(
//   borderRadius: BorderRadius.circular(5),
//   child: CachedNetworkImage(
//     imageUrl: (widget.image != null && widget.image.isNotEmpty)
//         ? (widget.image.contains(AppConstants.imageBaseUrl)
//             ? widget.image
//             : AppConstants.imageBaseUrl + widget.image)
//         : '',
//     height: 33,
//     width: 33,
//     fit: BoxFit.cover,
//     placeholder: (context, url) =>
//         const SizedBox(
//           height: 33,
//           width: 33,
//           child: Center(child: CircularProgressIndicator(strokeWidth: 2))),
//     errorWidget: (context, url, error) =>
//         const Icon(Icons.error, size: 20),
//   ),
// ),

//             // ClipRRect(
//             //   borderRadius: BorderRadius.circular(5),
//             //   child: Image.network(
//             //     widget.image,
//             //     height: 33,
//             //     width: 33,
//             //   ),
//             // ),
//             Padding(
//               padding: getPadding(
//                 left: 24,
//                 top: 7,
//                 bottom: 7,
//               ),
//               child: Text(
//                 widget.title,
//                 overflow: TextOverflow.ellipsis,
//                 textAlign: TextAlign.left,
//                 style: AppStyle.txtPoppinsSemiBold12.copyWith(fontSize: 14),
//               ),
//             ),
//             Spacer(),
           
           
//             SizedBox(
//               height: 24,
//               width: 45,
//               child: AnimatedToggleSwitch<bool>.dual(
//                 current: widget.value,
//                 first: false,
//                 second: true,
//                 innerColor: widget.value ? AppCol.primary : Color(0xFFD0D5DD),
//                 dif: 1.0,
//                 borderColor: Colors.transparent,
//                 // borderWidth: 2.0,
//                 // height: 20,
//                 indicatorSize: Size(17, 18),
//                 indicatorColor: Colors.white,
//                 onChanged: (b) {
//                   setState(() {
//                     widget.value = b;
//                     _viewModel.toggleService(widget.id);
//                   });
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void showSnackbar(String message, {Color? color}) {
//     // TODO: implement showSnackbar
//   }
// }


import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

class ProfileItemWidget extends ConsumerStatefulWidget {
  final bool value;
  final String image;
  final String title;
  final String id;
  final bool? showMenuIcon;

  const ProfileItemWidget(
    this.value,
    this.image,
    this.title,
    this.id, {
    this.showMenuIcon = false,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileItemWidget> createState() => _EditProfileItemWidgetState();
}

class _EditProfileItemWidgetState extends ConsumerState<ProfileItemWidget> with BaseScreenView {
  late AuthViewModel _viewModel;
  late bool isEnabled;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    isEnabled = widget.value;
  }

  @override
  void dispose() {
    _viewModel.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          isEnabled = !isEnabled;
          _viewModel.toggleService(widget.id);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: getPadding(left: 17, top: 16, right: 17, bottom: 16),
        decoration: AppDecoration.outlineBlack9003f.copyWith(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            if (widget.showMenuIcon ?? false)
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.menu, color: Color(0xff677b8a80)),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: widget.image.contains(AppConstants.imageBaseUrl)
                    ? widget.image
                    : AppConstants.imageBaseUrl + widget.image,
                height: 33,
                width: 33,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  height: 33,
                  width: 33,
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 20),
              ),
            ),
            Padding(
              padding: getPadding(left: 24, top: 7, bottom: 7),
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.txtPoppinsSemiBold12.copyWith(fontSize: 14),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 24,
              width: 45,
              child: AnimatedToggleSwitch<bool>.dual(
                current: isEnabled,
                first: false,
                second: true,
                innerColor: isEnabled ? AppCol.primary : const Color(0xFFD0D5DD),
                dif: 1.0,
                borderColor: Colors.transparent,
                indicatorSize: const Size(17, 18),
                indicatorColor: Colors.white,
                onChanged: (b) {
                  setState(() {
                    isEnabled = b;
                    _viewModel.toggleService(widget.id);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.black,
      ),
    );
  }
}

