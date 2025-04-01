import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/utils/color_constant.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/helper/file_picker.dart';
import 'package:taptohello/helper/locator.dart';
import 'package:taptohello/helper/user_detail_service.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/services/shared_preference_service.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CustomBrandingView extends ConsumerStatefulWidget {
  const CustomBrandingView({super.key});

  @override
  ConsumerState<CustomBrandingView> createState() => _CustomBrandingViewState();
}

class _CustomBrandingViewState extends ConsumerState<CustomBrandingView>
    with BaseScreenView {
  final TextEditingController _colorColtroller = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final UserDetailService _userDetailService = getIt<UserDetailService>();
  late AuthViewModel _viewModel;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  File? file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    getColorAndImage();
    // _colorColtroller.text =
    //     _userDetailService.userDetailResponse?.user?.customBranding?.color ??
    //         "";
    // _imageController.text =
    //     _userDetailService.userDetailResponse?.user?.customBranding?.image ??
    //         "";
    if (_colorColtroller.text != "") {
      currentColor =
          Color(int.parse(_colorColtroller.text.replaceAll("#", "0xFF")));
    }
  }


  getColorAndImage() {
    _colorColtroller.text = SharedPreferenceService.getString('qrColor') ?? '';
    _imageController.text = SharedPreferenceService.getString('qrimage') ?? '';
    debugPrint('My selected color is: ${_colorColtroller.text} ${_imageController.text}');
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
          "Edit HelloCode™",
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
                          'HelloCode™ Colour',
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
                            'Please pick or write the color code and submit it for customizing the HelloCode™ pattern color.',
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
                              color: currentColor,
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
                Container(
                  child: CustomTextFormField(
                    maxlength: 8,
                    onChange: (value) {
                      setState(() {
                        if (!_colorColtroller.text.contains("#")) {
                          _colorColtroller.text = "#${_colorColtroller.text}";
                        }

                        currentColor = Color(int.parse(
                            _colorColtroller.text.replaceAll("#", "0xFF")));
                      });
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
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Done'),
                                  onPressed: () {
                                    setState(() => currentColor = pickerColor);
                                    _colorColtroller.text = currentColor
                                        .toString()
                                        .substring(10,
                                            currentColor.toString().length - 1);
                                    _colorColtroller.text =
                                        "#${_colorColtroller.text}";
                                    print( currentColor);
                                    print(_colorColtroller.text);
                                    // Color(0xFF892493)
                                    SharedPreferenceService.setString('qrColor', _colorColtroller.text);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Icon(Icons.colorize_rounded)),
                    label: "Color",
                    hintText: "#000000",

                    controller: _colorColtroller,
                    // hintText: "Bio",
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please select a darker or solid colour for HelloCode\ncreation purpose.',
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
                          'HelloCode™ Logo',
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
                            'Upload the custom logo or image for your HelloCode™ here and then submit it.',
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
                            print('My image url is: $file');
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
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(_imageController.text)),
                                  borderRadius: BorderRadius.circular(5)),
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
                  showSnackbar("Please select a color");
                } else {
                   print('My color: ${_colorColtroller.text}');
                   SharedPreferenceService.setString('qrColor', _colorColtroller.text);
                   SharedPreferenceService.setString('qrimage', _imageController.text);
                  _viewModel.addCustomBranding(file, _colorColtroller.text);
                }
                 print('My image url is: ${_imageController.text}');
                 // SharedPreferenceService.setString('helloCodeLogo', _colorColtroller.text);
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

  void changeColor(Color color) {
    setState(() => pickerColor = color);
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
