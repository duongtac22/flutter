import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _validateButton = false;

  // void validateForm() {
  //   bool isValid = true ;

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/shopfee_logo.png'),
              height: 100,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3C3C)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(16),
                  //       color: Colors.white,
                  //       boxShadow: const [
                  //         BoxShadow(
                  //             color: Color(0xFF5D4037),
                  //             blurRadius: 1,
                  //             offset: Offset(0, 0))
                  //       ]),
                  //   child: const
                  // ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _validateButton = value.isNotEmpty ? true : false;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: false,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Input your name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5D4037)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No. Handphone',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3C3C3C)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _validateButton = value.isNotEmpty ? true : false;
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    obscureText: false,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        labelText: "Input your No. Handphone",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5D4037)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD0D0D0)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.black))),
                  ),

                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    'By tapping "Register" you agree to our \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Color(0xFF7C7C7C))),
                            TextSpan(
                                text: ' Terms of Use ',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Color(0xFF032172))),
                            TextSpan(
                                text: 'and',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Color(0xFF7C7C7C))),
                            TextSpan(
                                text: ' Privacy Policy!',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Color(0xFF032172))),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      )),

                  const SizedBox(height: 32),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !_validateButton
                            ? const Color(0xFFCACACA)
                            : const Color(0xFF5D4037),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        !_validateButton
                            ? ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Color(0xFFE33131),
                                  // behavior: SnackBarBehavior.floating,
                                  content: Text('Complete your data first'),
                                ),
                              )
                            : _formKey.currentState!.validate()
                                ?
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  )
                                : null;
                      },
                      child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        print('Press Login');
                      },
                      child: const Text('Have an account? Login',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontSize: 14)),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
