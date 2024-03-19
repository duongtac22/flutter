import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _totalPage = 3;

  final PageController _pageController = PageController(initialPage: 0);

  int _current = 0;

  List<Widget> _createPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _totalPage; i++) {
      list.add(
          i == _current ? _createIndicator(true) : _createIndicator(false));
    }
    return list;
  }

  Widget _createIndicator(bool isCurrent) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 12,
      width: isCurrent ? 24 : 12,
      decoration: BoxDecoration(
        color: isCurrent ? const Color(0xFF5D4037) : const Color(0xFFCACACA),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (_current != _totalPage - 1) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      } else {
                        Navigator.pushReplacementNamed(context, "/register");
                      }
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF3C3C3C),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _current = page;
                      });
                    },
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/onboarding1.png"),
                                height: 200,
                              ),
                            ),
                            SizedBox(height: 60),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose and customize your Drinks',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Customize your own drink exactly how you like it by adding any topping you like!!!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/onboarding2.png"),
                                height: 200,
                              ),
                            ),
                            SizedBox(height: 60),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quickly and easly',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/onboarding3.png"),
                                height: 200,
                              ),
                            ),
                            SizedBox(height: 60),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Get and Redeem Voucher',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF3C3C3C),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _createPageIndicator(),
                    ),
                    _current != _totalPage - 1
                        ? Expanded(
                            child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5D4037),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                },
                                child: const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 14, 0, 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'NEXT',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 36),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    ))),
                          ))
                        : Expanded(
                            child: Align(
                            alignment: FractionalOffset.centerRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5D4037),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, "/register");
                                },
                                child: const Padding(
                                    padding: EdgeInsets.fromLTRB(24, 14, 0, 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          'Login/Register',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 36),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    ))),
                          ))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
