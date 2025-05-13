

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class DialogBuilder {
  final BuildContext context;

  DialogBuilder(this.context);

  void showLoadingIndicator(String message) {
    showDialog(
      
      context: context,
      barrierDismissible: false, // Prevent closing dialog by tapping outside
      builder: (context) {
        
        return WillPopScope(
          
          onWillPop: () async => false, // Prevent back button closing
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

          
            content: Column(
              
              mainAxisSize: MainAxisSize.min,
              children: [
             
                  CircleAvatar(
                    radius: 75,
                    child: Image(
                                  image: AssetImage("assets/images/taptohello.gif"),  // Your animated GIF
                                  width: 150,
                                  height: 150,
                                ),
                  ),
                SizedBox(height: 20),
                 // Image Widget
           
            SizedBox(width: 10), 
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      message.isNotEmpty ? message : 'Loading...',
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                        //ppCol.primary,
                        //backgroundColor: AppCol.primary
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void hideOpenDialog() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}