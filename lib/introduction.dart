import 'package:flutter/material.dart';
import 'login.dart'; // Đảm bảo bạn import trang login
import 'signup.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/Home.png', // Đảm bảo đường dẫn đúng
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 3 / 5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Ví chi tiêu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEABCCE),
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 3 / 4,
              height: MediaQuery.of(context).size.height / 20,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE7B7C2),
                  foregroundColor: Colors.white,
                ),
                child: Text("Đăng nhập"),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 130,
              width: double.infinity,
              child: Column(
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
                                builder: (context) =>
                                    SignupPage()), // Điều hướng đến SignupPage
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
}
