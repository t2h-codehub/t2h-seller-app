import 'package:flutter/material.dart';

class ProductPostedDialog extends StatefulWidget {
  const ProductPostedDialog({super.key});

  @override
  State<ProductPostedDialog> createState() => _ProductPostedDialogState();
}

class _ProductPostedDialogState extends State<ProductPostedDialog> {
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
                  onTap: () {
                    Navigator.pop(context);
                  },
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
                Text(
                  'Product posted successfully on Instagram',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),

                /// Description text
                Text(
                  'Tip: Regular Instagram Post increases Follower Engagement',
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
