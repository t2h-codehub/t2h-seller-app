import 'package:flutter/material.dart';
import 'package:taptohello/core/utils/commonFun.dart';
import 'package:taptohello/presentation/home/home_view.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key, this.isFromVariant, this.isFromCatalogue});
  final bool? isFromVariant;
  final bool? isFromCatalogue;

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  bool isProductPost = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8),

                /// Close Icon
                InkWell(
                  onTap:
                  // widget.isFromVariant ?? false ?
                  () {
                    openScreenWithoutBack(context, HomeView(indexfromPrevious: 1,));
                  },
                  // : () {
                  //   Navigator.pop(context);
                  //   Navigator.pop(context);
                  // },
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 1.65),
                      Icon(
                        Icons.close_rounded,
                        size: 22,
                      ),
                    ],
                  ),
                ),

                /// Successful Image
                Image.asset(
                  'assets/newIcons/succ.png',
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 16),

                /// Product add successfully text
                Text(widget.isFromCatalogue ?? false ? "Product details saved" :
                  'Product added successfully',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                /// Description text
                Text(
                  'Tip: Adding more product options increases your chances of making sales!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 16),

             
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
