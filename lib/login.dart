import 'package:app_watlet/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_watlet/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:app_watlet/introduction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter', // Thiết lập font chữ cho toàn bộ ứng dụng
        primaryColor: const Color(0xFFC46A7A), // Có thể tùy chỉnh màu sắc chính
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //const MyApp({super.key});

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEABCCE),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ví chi tiêu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x40EABCCE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC46A7A), width: 2),
                ), // Viền mặc định
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle: TextStyle(
                        color: Color(0xFF626262),
                        fontSize: 15), // Loại bỏ viền mặc định của TextField
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x40EABCCE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC46A7A), width: 2),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Color(0xFF626262)),
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle:
                            TextStyle(color: Color(0xFF626262), fontSize: 15),
                        border: InputBorder
                            .none, // Loại bỏ viền mặc định của TextField
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Icon(
                        _showPass ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF626262),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Hành động khi nhấn vào "Quên mật khẩu"
                },
                child: Text(
                  "Quên mật khẩu?",
                  style: TextStyle(color: Color(0xFFCF9092)),
                ),
              ),
            ),
            // Padding giữa nút "Quên mật khẩu" và nút "Đăng nhập"
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: 900,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC46A7A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onSignInClicked,
                  child: Text("Đăng nhập"),
                ),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: Column(
                // Thay Row thành Column
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tạo tài khoản? ",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF494949)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFC46A7A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        // Điều hướng tới HomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }
}
