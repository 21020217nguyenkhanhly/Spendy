import 'package:flutter/material.dart';
import 'package:app_watlet/home.dart';
import 'package:app_watlet/profile.dart';
import 'package:app_watlet/watletspend.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _currentIndex = 1; // Mặc định chọn mục biểu đồ
  String _selectedOption = 'Chi tiêu';

  void _onItemTapped(int index) {
    if (index == _currentIndex)
      return; // Không làm gì nếu chọn lại tab hiện tại

    setState(() {
      _currentIndex = index;
    });

    // Điều hướng theo từng mục
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      // Giữ nguyên trên trang ReportPage
    } else if (index == 2) {
      // Điều hướng đến WatletSpendPage khi chọn mục Ví
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WatletSpendPage()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProfilePage()), // Chuyển đến ProfilePage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40), // Đẩy toàn bộ giao diện xuống
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Biểu đồ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4), // Giảm padding
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              DropdownButton<String>(
                                value: _selectedOption,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Chi tiêu',
                                  'Thu nhập'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                                underline: Container(),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF666666),
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Image.asset(
                      './images/Report.png', // Đảm bảo đường dẫn tới ảnh đúng
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 300, // Đẩy nội dung chi tiết xuống một chút
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        './images/Cafe.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Starbucks',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '12 tháng 7, 2024',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '-200.000 đ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF95B51),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        './images/Friend.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bạn bè',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '11 tháng 7, 2024',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '-85.000 đ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF95B51),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        './images/Youtube.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Youtube',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '11 tháng 7, 2024',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '-35.000 đ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF95B51),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Trang Chủ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: 'Biểu Đồ',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet),
                    label: 'Ví',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Cá Nhân',
                  ),
                ],
                currentIndex: _currentIndex,
                selectedItemColor: Color(0xFFE7B7C2),
                unselectedItemColor: Color(0xFFAAAAAA),
                onTap: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
