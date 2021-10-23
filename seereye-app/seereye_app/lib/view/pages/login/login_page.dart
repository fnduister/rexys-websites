// The basic skeleton structure of the widget
import 'package:seereye_app/services/http_service.dart';
import 'package:seereye_app/view/layout/page_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  static const String routeName = "/login";
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<LoginPage> {
  late TextEditingController textControllerEmail;
  late FocusNode textFocusNodeEmail;
  late TextEditingController textControllerPassword;
  late FocusNode textFocusNodePassword;
  bool _isEditingEmail = false;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerEmail.text = "";
    textFocusNodeEmail = FocusNode();

    textControllerPassword = TextEditingController();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // ...
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Email address'),
                TextField(
                  focusNode: textFocusNodeEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: textControllerEmail,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingEmail = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeEmail.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodePassword);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[800]!,
                        width: 3,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                      color: Colors.blueGrey[300],
                    ),
                    hintText: "Email",
                    fillColor: Colors.white,
                    errorText: _isEditingEmail
                        ? _validateEmail(textControllerEmail.text)
                        : null,
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Text('Password'),
                TextField(
                  focusNode: textFocusNodePassword,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  controller: textControllerPassword,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingEmail = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeEmail.unfocus();
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blueGrey[800]!,
                        width: 3,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(
                      color: Colors.blueGrey[300],
                    ),
                    hintText: "Password",
                    fillColor: Colors.white,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.maxFinite,
                        child: TextButton(
                          onPressed: () async {
                            if (_validateEmail(textControllerEmail.text) ==
                                "") {
                              await HttpService.li
                                  .signInWithEmailPassword(
                                      textControllerEmail.text,
                                      textControllerPassword.text)
                                  .then((result) async {
                                print(result);

                                await HttpService.initSeereyeBuilders().then(
                                    (value) => {
                                          Navigator.pushNamed(
                                              context, PageRoutes.actor)
                                        });
                              }).catchError((error) {
                                print('Registration Error: $error');
                              });
                            }
                            setState(() {
                              _isEditingEmail = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return "";
  }
}
