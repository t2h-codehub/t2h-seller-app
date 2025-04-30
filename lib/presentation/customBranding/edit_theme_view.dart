import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/data/upload/models/add_theme_model.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/file_picker.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditThemeView extends ConsumerStatefulWidget {
  const EditThemeView({super.key});

  @override
  ConsumerState<EditThemeView> createState() => _CustomBrandingViewState();
}

class _CustomBrandingViewState extends ConsumerState<EditThemeView>
    with BaseScreenView {
  final TextEditingController _colorColtroller = TextEditingController();
  final TextEditingController _color2Coltroller = TextEditingController();

  final TextEditingController _imageController = TextEditingController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late AuthViewModel _viewModel;
  Color pickerColor1 = Color(0xff443a49);

  Color currentColor1 = Color(0xff443a49);
  Color pickerColor2 = Color(0xffd4a52a);
  Color currentColor2 = Color(0xffd4a52a);
  File? file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    getColor();
    // _colorColtroller.text =
    //     _userDetailService.userDetailResponse?.user?.customBranding?.color ??
    //         "";
    // _imageController.text =
    //     _userDetailService.userDetailResponse?.user?.customBranding?.image ??
    //         "";
    if (_colorColtroller.text != "") {
      currentColor1 =
          Color(int.parse(_colorColtroller.text.replaceAll("#", "0xFF")));
    }
    if (_color2Coltroller.text != "") {
      currentColor2 =
          Color(int.parse(_color2Coltroller.text.replaceAll("#", "0xFF")));
    }
  }

  getColor() {
    _colorColtroller.text = SharedPreferenceService.getString('customColorOne') ?? '';
    _color2Coltroller.text = SharedPreferenceService.getString('customColorTwo') ?? '';
    debugPrint('My selected color is: ${_colorColtroller.text} ${_color2Coltroller.text}');
    /*currentColor1 =  Color(int.parse(_colorColtroller
        .text
        .replaceAll("#", "0xFF")));*/
    setState(() {});
    // hexStringToHexInt(qrColor);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);

    return Scaffold(
      backgroundColor: AppCol.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          "Custom Branding",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Custom Theme',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 210,
                          child: Text(
                            'Please pick or write the custom color code and submit it for the customized theme.',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 101,
                          width: 101,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [currentColor1, currentColor2]),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        Text(
                          "Live\nPreview",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        maxlength: 8,
                        onChange: (value) {
                          if (!_colorColtroller.text.contains("#")) {
                            setState(() {
                              _colorColtroller.text =
                                  "#${_colorColtroller.text}";
                              currentColor1 = Color(int.parse(_colorColtroller
                                  .text
                                  .replaceAll("#", "0xFF")));
                            });
                          }
                          print('My color is: $currentColor1');
                          SharedPreferenceService.setString('customColorOne', currentColor1.toString());
                        },
                        // isenabled: false,
                        suffix: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor1,
                                      onColorChanged: changeColor1,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Done'),
                                      onPressed: () {
                                        setState(
                                            () => currentColor1 = pickerColor1);
                                        _colorColtroller.text = currentColor1
                                            .toString()
                                            .substring(
                                                10,
                                                currentColor1
                                                        .toString()
                                                        .length -
                                                    1);
                                        _colorColtroller.text =
                                            "#${_colorColtroller.text}";
                                        print(currentColor1);
                                        print(_colorColtroller.text);
                                        // Color(0xFF892493)
                                        SharedPreferenceService.setString('customColorOne', _colorColtroller.text);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(Icons.colorize_rounded)),
                        label: "Color1",
                        hintText: "#000000",

                        controller: _colorColtroller,
                        // hintText: "Bio",
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        maxlength: 8,
                        onChange: (value) {
                          setState(() {
                            if (!_color2Coltroller.text.contains("#")) {
                              _color2Coltroller.text =
                                  "#${_color2Coltroller.text}";
                            }
                            currentColor2 = Color(int.parse(_color2Coltroller
                                .text
                                .replaceAll("#", "0xFF")));
                            print('My color is: $currentColor2');
                          });
                          SharedPreferenceService.setString('customColorTwo', _colorColtroller.text);
                        },
                        // isenabled: false,
                        suffix: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Pick a color!'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: pickerColor2,
                                      onColorChanged: changeColor2,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: const Text('Done'),
                                      onPressed: () {
                                        setState(
                                            () => currentColor2 = pickerColor2);
                                        _color2Coltroller.text = currentColor2
                                            .toString()
                                            .substring(
                                                10,
                                                currentColor2
                                                        .toString()
                                                        .length -
                                                    1);
                                        _color2Coltroller.text =
                                            "#${_color2Coltroller.text}";
                                        print(currentColor2);
                                        print(_color2Coltroller.text);
                                        // Color(0xFF892493)
                                        SharedPreferenceService.setString('customColorTwo', _color2Coltroller.text);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Icon(Icons.colorize_rounded)),
                        label: "Colour2",
                        hintText: "#000000",

                        controller: _color2Coltroller,
                        // hintText: "Bio",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Please select a darker or solid colour for SocioCode™\ncreation purpose.',
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 11,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Custom Logo',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 210,
                          child: Text(
                            'Please upload the custom logo for your profile here.',
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SizedBox(
                          width: 202,
                          child: Text(
                            'Max file size: 1Mb and max resolution: 500px x 500px. File type: jpeg/png.',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 11,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () =>
                          openPickImageModalSheet(context).then((value) {
                        if (value != null) {
                          _viewModel.uploadSingleFile(value).then((fileURL) {
                            setState(() {
                              _imageController.text = fileURL ?? "";
                              file = value;
                            });
                          });
                        }
                      }),
                      child: (_imageController.text.isEmpty ||
                              _imageController.text == "")
                          ? Container(
                              height: 101,
                              width: 101,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/newIcons/placeholderImage.png")),
                                  borderRadius: BorderRadius.circular(5)),
                            )
                          : Container(
                              height: 101,
                              width: 101,
                              decoration: 
                              BoxDecoration(
  image: DecorationImage(
    image: CachedNetworkImageProvider(
      (_imageController.text != null && _imageController.text.isNotEmpty)
          ? (_imageController.text.contains(AppConstants.imageBaseUrl)
              ? _imageController.text
              : AppConstants.imageBaseUrl + _imageController.text)
          : "https://www.qwikcilver.com/wp-content/uploads/2019/01/dummy-post-square-1-thegem-blog-masonry.jpg", // Fallback image URL
    ),
    fit: BoxFit.cover,
  ),
  borderRadius: BorderRadius.circular(5),
)
,
                              // BoxDecoration(
                              //     image: DecorationImage(
                              //         image:
                              //             NetworkImage(_imageController.text)),
                              //     borderRadius: BorderRadius.circular(5)),
                            ),
                    )
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (_colorColtroller.text == "") {
                  _colorColtroller.text = "#443a49";
                  SharedPreferenceService.setString('customColorOne', _colorColtroller.text);
                }
                if (_color2Coltroller.text == "") {
                  _color2Coltroller.text = "#d4a52a";
                  SharedPreferenceService.setString('customColorTwo', _color2Coltroller.text);
                }
                // showSnackbar("Please select both color");

                _viewModel.addThemeRequest = AddThemeRequest(
                    color1: _colorColtroller.text,
                    color2: _color2Coltroller.text,
                    image: _imageController.text.isNotEmpty ? _imageController.text : '');
                _viewModel.addTheme(_viewModel.addThemeRequest);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                decoration: ShapeDecoration(
                  color: AppCol.primary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: AppCol.primary),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void changeColor1(Color color) {
    setState(() => pickerColor1 = color);
  }

  void changeColor2(Color color) {
    setState(() => pickerColor2 = color);
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // TODO: implement showSnackbar
  }
}
