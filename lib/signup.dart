import 'package:flutter/material.dart';
import 'package:app_watlet/home.dart';
import 'signup.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _showPass = false;
  bool _showConfirmPass = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  var _userNameErr = "Tài khoản không hợp lệ";
  var _nameErr = "Họ tên không được để trống";
  var _passErr = "Mật khẩu phải trên 6 ký tự";
  var _confirmPassErr = "Mật khẩu xác nhận không khớp";

  var _userInvalid = false;
  var _nameInvalid = false;
  var _passInvalid = false;
  var _confirmPassInvalid = false;

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
                "Đăng ký",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEABCCE),
                ),
              ),
            ),
            // Khung nhập Email
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x40EABCCE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC46A7A), width: 2),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Color(0xFF626262)),
                  controller: _emailController,
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
            // Khung nhập họ tên
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x40EABCCE),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFC46A7A), width: 2),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Color(0xFF626262)),
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Họ tên",
                    errorText: _nameInvalid ? _nameErr : null,
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
            // Khung nhập mật khẩu
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
                        border: InputBorder.none,
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
            // Khung nhập xác nhận mật khẩu
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
                      controller: _confirmPassController,
                      obscureText: !_showConfirmPass,
                      decoration: InputDecoration(
                        labelText: "Xác nhận mật khẩu",
                        errorText: _confirmPassInvalid ? _confirmPassErr : null,
                        labelStyle:
                            TextStyle(color: Color(0xFF626262), fontSize: 15),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                    GestureDetector(
                      onTap: onToggleShowConfirmPass,
                      child: Icon(
                        _showConfirmPass
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF626262),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Nút đăng ký
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
                  onPressed: onSignUpClicked,
                  child: Text("Đăng ký"),
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
                    children: <Widget>[
                      Text(
                        "Đã có tài khoản? ",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF494949)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Đăng nhập",
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

  void onToggleShowConfirmPass() {
    setState(() {
      _showConfirmPass = !_showConfirmPass;
    });
  }

  void onSignUpClicked() {
    setState(() {
      _userInvalid = _emailController.text.length < 6 ||
          !_emailController.text.contains("@");
      _nameInvalid = _nameController.text.isEmpty;
      _passInvalid = _passController.text.length < 6;
      _confirmPassInvalid = _passController.text != _confirmPassController.text;

      if (!_userInvalid &&
          !_nameInvalid &&
          !_passInvalid &&
          !_confirmPassInvalid) {
        // Navigate to the home page if registration is successful
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
}
