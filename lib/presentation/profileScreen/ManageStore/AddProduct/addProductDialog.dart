import 'package:flutter/material.dart';
import 'package:swapnil_s_application4/core/utils/commonFun.dart';
import 'package:swapnil_s_application4/presentation/home/home_view.dart';

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

                /*/// Want to post text
                Text(
                  'Want to post this product on Instagram?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16),

                /// Toggle button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(width: 4),

                    /// Toggle Button
                    Container(
                      height: 30,
                      width: 55,
                      child: AnimatedToggleSwitch<bool>.dual(
                        current: isProductPost,
                        first: false,
                        second: true,
                        innerColor: isProductPost
                            ? AppCol.primary
                            : Color(0xFFD0D5DD),
                        dif: 1.0,
                        borderColor: Colors.transparent,
                        // borderWidth: 2.0,
                        // height: 20,
                        indicatorSize: Size(24, 24),
                        indicatorColor: Colors.white,
                        onChanged: (b) {
                          isProductPost = b;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 4),

                    Text(
                      'Yes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isProductPost ? 10 : 16),

                /// Post this product button
                Visibility(
                  visible: isProductPost,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ProductPostedDialog();
                          });
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppCol.gray200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/newIcons/share_insta.png',
                              height: 20, width: 20),
                          SizedBox(width: 10),
                          Text(
                            'Post this product on my Instagram',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: isProductPost,
                    child: SizedBox(height: 16)),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
