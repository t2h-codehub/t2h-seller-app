import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/data/auth/model/add_service.dart';
import 'package:taptohello/data/auth/model/services.dart';
import 'package:taptohello/helper/base_screen_view.dart';
import 'package:taptohello/presentation/sign_in_screen/auth_view_model.dart';
import 'package:taptohello/widgets/custom_text_form_field.dart';

class AddData extends ConsumerStatefulWidget {
  final Value value;
  const AddData({Key? key, required this.value}) : super(key: key);

  @override
  ConsumerState<AddData> createState() => _AddDataState();
}

class _AddDataState extends ConsumerState<AddData> with BaseScreenView {
  TextEditingController addDataController = TextEditingController();
  var focusNode = FocusNode();
  late AuthViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(authViewModel);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppCol.primary,
                      size: 30,
                    ),
                  ),
                  Text(widget.value.title ?? "",
                      style: TextStyle(
                          color: AppCol.black900,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      if (addDataController.text.isNotEmpty) {
                        focusNode.unfocus();
                        _viewModel.addServiceRequest = AddServiceRequest(
                            content: addDataController.text,
                            serviceId: widget.value.id);
                        _viewModel.addService(
                            _viewModel.addServiceRequest, context);
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppCol.primary)),
                        margin: getMargin(top: 8, bottom: 8),
                        padding:
                            getMargin(top: 4, bottom: 4, left: 10, right: 10),
                        child: Text("Save",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsMedium10Gray900.copyWith(
                                fontSize: 12, color: AppCol.primary))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: AppCol.primary.withOpacity(0.2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.value.logo ?? "",
                        height: 100,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.value.title ?? "",
                        style: TextStyle(
                            color: AppCol.black900,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFormField(
                maxlength: 300,
                focusNode: focusNode,
                controller: addDataController,
                hintText: "Enter the value for ${widget.value.title}",
              ),
            )
          ],
        ),
      ),
    );
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
