import 'package:flutter/material.dart';
import 'home.dart';
import 'report.dart';
import 'login.dart';
import 'watletspend.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 3; // Mặc định chọn mục 'Cá Nhân'

  void _onItemTapped(int index) {
    if (index == _currentIndex)
      return; // Không làm gì nếu chọn lại tab hiện tại

    setState(() {
      _currentIndex = index;
    });

    // Điều hướng đến các trang khác
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ReportPage()),
      );
    } else if (index == 2) {
      // Điều hướng đến WatletSpendPage khi chọn mục "Ví"
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WatletSpendPage()),
      );
    }
  }

  void _logout() {
    // Khi nhấn "Đăng xuất", điều hướng về màn hình đăng nhập
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE7B7C3),
                    Color(0xFFBF7570),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Hồ sơ",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 120, // Điều chỉnh để nâng các phần tử lên dưới chữ "Hồ sơ"
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 4 / 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60), // Điều chỉnh khoảng cách từ trên
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        './images/Avatar.png'), // Đảm bảo đường dẫn đúng
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Nguyễn Văn A", // Tên người dùng cố định
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "email@example.com", // Email cố định
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey, fontFamily: 'Inter'),
                  ),
                  SizedBox(height: 30),
                  // Các mục dưới email
                  _buildRow(Icons.notifications, 'Thông báo'),
                  _buildRow(Icons.security, 'Bảo mật'),
                  _buildRow(Icons.help_outline, 'Hỗ trợ'),
                  SizedBox(height: 30), // Tăng khoảng cách giữa các mục
                  GestureDetector(
                    onTap: _logout, // Khi nhấn vào 'Đăng xuất'
                    child: _buildRow(Icons.exit_to_app, 'Đăng xuất'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Trang Chủ'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart), label: 'Biểu Đồ'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet), label: 'Ví'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Cá Nhân'),
              ],
              currentIndex: _currentIndex,
              selectedItemColor: Color(0xFFE7B7C2),
              unselectedItemColor: Color(0xFFAAAAAA),
              onTap: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }

  // Hàm dựng một hàng với biểu tượng và văn bản
  Widget _buildRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 20), // Thay đổi padding tại đây
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFBF7570), size: 24),
          SizedBox(width: 30),
          Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Color(0xFF000000), fontFamily: 'Inter'),
          ),
        ],
      ),
    );
  }
}
