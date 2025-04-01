import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends ConsumerStatefulWidget {
  bool value;
  final String image;
  final String title;
  final String id;
  Key key;
  bool? showMenuIcon;
  ProfileItemWidget(this.value, this.image, this.title, this.id,
      {this.showMenuIcon = false, required this.key});

  @override
  ConsumerState<ProfileItemWidget> createState() =>
      _EditProfileItemWidgetState();
}

class _EditProfileItemWidgetState extends ConsumerState<ProfileItemWidget>
    with BaseScreenView {
  late AuthViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          _viewModel.toggleService(widget.id);

          // widget.value = !widget.value;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 15,
        ),
        padding: getPadding(
          left: 17,
          top: 16,
          right: 17,
          bottom: 16,
        ),
        decoration: AppDecoration.outlineBlack9003f.copyWith(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.showMenuIcon ?? false
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.menu,
                      color: Color(0xff677b8a80),
                    ),
                  )
                : SizedBox.shrink(),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.image,
                height: 33,
                width: 33,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 24,
                top: 7,
                bottom: 7,
              ),
              child: Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsSemiBold12.copyWith(fontSize: 14),
              ),
            ),
            Spacer(),
           
           
            SizedBox(
              height: 24,
              width: 45,
              child: AnimatedToggleSwitch<bool>.dual(
                current: widget.value,
                first: false,
                second: true,
                innerColor: widget.value ? AppCol.primary : Color(0xFFD0D5DD),
                dif: 1.0,
                borderColor: Colors.transparent,
                // borderWidth: 2.0,
                // height: 20,
                indicatorSize: Size(17, 18),
                indicatorColor: Colors.white,
                onChanged: (b) {
                  setState(() {
                    widget.value = b;
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
    // TODO: implement showSnackbar
  }
}
