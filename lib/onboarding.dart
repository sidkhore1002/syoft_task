import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class onboarding extends StatefulWidget {
  @override
  onboardingScreen createState() => onboardingScreen();
}

class onboardingScreen extends State<onboarding> {
  @override
  void initState() {}

  //widget to add the image on screen
  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      width: 450,
      height: 200,
    ));
  }

  //method to customise the page style
  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 10),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      // activeSize: Size(12, 12),
      // activeShape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Title of 1st Page',
              body: 'Body of 1st Page',
              image: buildImage("assets/images/img1.jpg"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title of 2nd Page',
              body: 'Body of 2nd Page',
              image: buildImage("assets/images/img1.jpg"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Title of 3rd Page',
              body: 'Body of 3rd Page',
              image: buildImage("assets/images/img1.jpg"),
              //getPageDecoration, a method to customise the page style
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            Navigator.pushNamed(context, '/mainLogin');
          },
          //ClampingScrollPhysics prevent the scroll offset from exceeding the bounds of the content.
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: false,
          skip:
              const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done: const Text("Start",
              style: TextStyle(fontWeight: FontWeight.bold)),
          dotsDecorator: getDotsDecorator()),
    );
  }
}
