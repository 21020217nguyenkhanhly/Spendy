import 'package:flutter/material.dart';
import 'package:app_watlet/report.dart';
import 'package:app_watlet/profile.dart';
import 'package:app_watlet/watletspend.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Trạng thái của chỉ mục hiện tại

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lớp gradient chiếm 1/3 màn hình trên cùng
          Positioned(
            top: 0, // Điều chỉnh cho lên một chút
            left: 0,
            right: 0,
            child: Container(
              height:
                  MediaQuery.of(context).size.height / 3, // Chiếm 1/3 màn hình
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE7B7C3), // Màu gradient sáng
                    Color(0xFFBF7570), // Màu gradient tối
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Chào bạn,\nKhánh Ly', // Dòng chữ bạn muốn hiển thị
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Màu chữ trắng
                      fontFamily: 'Inter', // Font Inter
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Thẻ tổng kết - Đặt ở dưới phần gradient
          Positioned(
            top: 180, // Dịch thẻ xuống dưới gradient (thêm khoảng 20)
            left: 16,
            right: 16,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFFCF9092), // Màu khung tổng kết
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0), // Thêm khoảng padding để làm thẻ to hơn
                child: Column(
                  children: [
                    // Tổng số dư ở trên
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Tổng số dư',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter', // Font Inter
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 8.0), // Padding trái
                      alignment: Alignment.centerLeft, // Căn trái
                      child: Text(
                        '1.000.000 đ', // Số tiền dư
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white, // Màu chữ của số dư
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Thu nhập và chi phí ngang hàng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Thu nhập
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white, // Màu mũi tên xuống
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thu nhập',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8B0023), // Màu text
                                    fontFamily: 'Inter', // Font Inter
                                  ),
                                ),
                                Text(
                                  '1.840.000 đ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Màu số tiền
                                    fontFamily: 'Inter', // Font Inter
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Chi phí
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.white, // Màu mũi tên lên
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Chi tiêu',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8B0023), // Màu text
                                    fontFamily: 'Inter', // Font Inter
                                  ),
                                ),
                                Text(
                                  '840.000 đ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Màu số tiền
                                    fontFamily: 'Inter', // Font Inter
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Phần lịch sử thu chi và thông tin dưới thẻ
          Positioned(
            top: 380, // Điều chỉnh vị trí để đặt phần này xuống dưới thẻ
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Lịch sử thu chi
                Text(
                  'Lịch sử thu chi',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter', // Font Inter
                  ),
                ),
                SizedBox(height: 10),
                // Dòng thông tin về lương
                Row(
                  children: [
                    // Ảnh Salary
                    Image.asset(
                      './images/Salary.png', // Đảm bảo đường dẫn hình ảnh đúng
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    // Column chứa Lương và Hôm nay
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text Lương
                        Text(
                          'Lương',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // Màu chữ Lương
                          ),
                        ),
                        SizedBox(
                            height: 5), // Khoảng cách giữa Lương và Hôm nay
                        // Text Hôm nay
                        Text(
                          'Hôm nay',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666), // Màu chữ thời gian
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // Đẩy số tiền sang phía bên phải
                    // Số tiền lương
                    Text(
                      '+1.240.000 đ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25A969), // Màu chữ số tiền lương
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Image.asset(
                      './images/Clothes.png', // Đảm bảo đường dẫn hình ảnh đúng
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trang phục',
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
                    Spacer(), // Đẩy số tiền sang phía bên phải
                    // Số tiền lương
                    Text(
                      '-320.000 đ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF95B51), // Màu chữ số tiền lương
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      './images/Teacher.png',
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gia sư',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000), // Màu chữ Lương
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '11 tháng 7, 2024',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666), // Màu chữ thời gian
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '+600.000 đ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF25A969),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Image.asset(
                      './images/Phone.png', // Đảm bảo đường dẫn hình ảnh đúng
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Điện thoại',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '10 tháng 7, 2024',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // Đẩy số tiền sang phía bên phải
                    // Số tiền lương
                    Text(
                      '-135.000 đ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF95B51), // Màu chữ số tiền lương
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Thanh điều hướng dưới cùng
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
              onTap: (index) {
                setState(() {
                  _currentIndex = index; // Cập nhật chỉ mục được chọn
                });

                // Điều hướng dựa trên chỉ mục
                switch (index) {
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReportPage()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WatletSpendPage()),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                    break;
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
