import 'package:flutter/material.dart';

import 'package:taptohello/core/app_export.dart';
import 'package:taptohello/core/constants.dart';
import 'package:taptohello/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:taptohello/services/shared_preference_service.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController? _pageController;
  int currentIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController?.nextPage(duration: _kDuration, curve: _kCurve);
  }

  previousFunction() {
    _pageController?.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppCol.bgColor,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              Container(
                  child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/newIcons/onboard_1.png"))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("CONNECT SMARTER",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 5),
                        Text(
                          "Convert your physical interaction to digital networking with trendy Hello Devices!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff666666),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/newIcons/onboard_2.png"))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ENGAGE DEEPER",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 5),
                        Text(
                          "Get all phygital updates of your network at one place",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff666666),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              )),
              Container(
                  child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/newIcons/onboard_3.png"))),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("MONETIZE BETTER",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(height: 5),
                        Text(
                          "Integrate leading CRMs and improve your business funnel",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff666666),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240.0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: currentIndex,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          if (currentIndex == 0) {
                            AppConstants.isOnboarding = true;
                            setState(() {});
                            SharedPreferenceService.setBool(
                              AppConstants.isOnboardingViewed,
                              AppConstants.isOnboarding,
                            );
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ));
                          } else {
                            previousFunction();
                          }
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Color(0xff677b8a80),
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            width: 52,
                            height: 50,
                            child: currentIndex == 0
                                ? Center(
                                    child: Text("Skip",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppCol.primary,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Image.asset(
                                      "assets/images/back.png",
                                      height: 24,
                                    ),
                                  ))),
                    SizedBox(
                      width: 2,
                    ),
                    InkWell(
                        onTap: () {
                          if (currentIndex == 2) {
                            AppConstants.isOnboarding = true;
                            setState(() {});
                            SharedPreferenceService.setBool(
                              AppConstants.isOnboardingViewed,
                              AppConstants.isOnboarding,
                            );
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ));
                          } else {
                            nextFunction();
                          }
                        },
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.all(16),
                            width:
                                MediaQuery.of(context).size.width - 52 - 16 * 3,

                            // width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppCol.primary,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                                    currentIndex == 2 ? "Get Started" : "Next",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )))))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 40,
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.blue),
          color: positionIndex == currentIndex
              ? AppCol.primary
              : AppCol.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
