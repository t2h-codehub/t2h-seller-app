import 'package:flutter/material.dart';
import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/presentation/home/home_view.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  int indexSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLang();
  }

  getLang() {
    indexSelected = SharedPreferenceService.getInt("language") ?? 0;
    setState(() {});
    debugPrint('My lang index is: $indexSelected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () {

              AppConstants.selectedIndex = indexSelected;
              setState(() {});
              debugPrint('My language index is: ${AppConstants.selectedIndex}');
              SharedPreferenceService.setInt("language", AppConstants.selectedIndex);
              debugPrint('My selected language index is: ${SharedPreferenceService.getInt("language")}');
              SharedPreferenceService.setString("mylanguage", AppConstants.languageList[indexSelected]);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeView()),
                (route) => false,
              );
            },
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: ShapeDecoration(
                color: AppCol.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Proceed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ]),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeView()));
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Image.asset(
                "assets/images/back.png",
                height: 24,
              )),
        ),
        title: Text(
          "Change Language",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Text(
              'Select your preferred language for text sections on edit profile screen for a seamless experience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 25),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: AppConstants.languageList.length,
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.black),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    indexSelected = index;
                    setState(() {});
                    debugPrint('My language index is: $indexSelected');
                    debugPrint('My language is: ${AppConstants.languageList[indexSelected]}');
                    SharedPreferenceService.setString("mylanguage", AppConstants.languageList[indexSelected]);
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.languageList[index],
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.18,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                top: 1,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: ShapeDecoration(
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 0.75,
                                          color: Color(0xFF858585)),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: indexSelected == index,
                                child: Positioned(
                                  left: 6.50,
                                  top: 6.50,
                                  child: Container(
                                    width: 11,
                                    height: 11,
                                    decoration: ShapeDecoration(
                                      color: AppCol.primary,
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
