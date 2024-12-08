import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Đảm bảo đã thêm thư viện image_picker
import 'home.dart'; // Đảm bảo đã import trang Home
import 'report.dart'; // Đảm bảo đã import trang Report
import 'profile.dart'; // Đảm bảo đã import trang Profile
import 'watletspend.dart';
import 'qr.dart';

class WatletIncomePage extends StatefulWidget {
  @override
  _WatletIncomePageState createState() => _WatletIncomePageState();
}

class _WatletIncomePageState extends State<WatletIncomePage> {
  String _selectedOption = "Thu nhập"; // Mặc định là Chi tiêu
  int _currentIndex = 2; // Chọn tab "Ví" mặc định
  bool _isDropdownOpen = false; // Trạng thái của dropdown (hiển thị hoặc ẩn)
  TextEditingController _noteController =
      TextEditingController(); // Controller for the note input
  TextEditingController _moneyController =
      TextEditingController(); // Controller cho số tiền
  String _pickedImage = ''; // Biến lưu ảnh chọn từ thư viện hoặc camera

  // Hàm điều hướng cho BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Điều hướng theo index được chọn
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReportPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  // Mở camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile.path;
      });
    }
  }

  // Mở thư viện ảnh
  Future<void> _pickImageFromLibrary() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedImage = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Phần gradient ở đầu trang
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
            top: 80, // Điều chỉnh giá trị 'top' để dịch chuyển khung lên 80
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Chọn Chi tiêu hoặc Thu nhập
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text("Chi tiêu"),
                                onTap: () {
                                  setState(() {
                                    _selectedOption = "Chi tiêu";
                                  });
                                  Navigator.pop(context); // Đóng dialog
                                },
                              ),
                              ListTile(
                                title: Text("Thu nhập"),
                                onTap: () {
                                  setState(() {
                                    _selectedOption = "Thu nhập";
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WatletSpendPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFEABCCE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _selectedOption,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFFC46A7A),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Phần dưới gradient, chứa các nội dung khác
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Số tiền (bên phải màn hình)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Số tiền",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16,
                              fontFamily: 'Inter'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 200, // Giới hạn chiều rộng của ô nhập tiền
                              child: TextField(
                                controller: _moneyController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Nhập số tiền",
                                  border: InputBorder.none, // Không có border
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    // Cập nhật giá trị khi người dùng thay đổi
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            // Hiển thị "0 đ" nếu không có nhập liệu
                            if (_moneyController.text.isNotEmpty)
                              Text(
                                "${_moneyController.text} đ",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFF2F7E79)),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Hình ảnh Question và text "Chọn danh mục"
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset('./images/Question.png',
                            width: 24, height: 24),
                        SizedBox(width: 10),
                        Text("Chọn danh mục", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Hình ảnh Youtube
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset('./images/Youtube.png',
                            width: 24, height: 24),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Lịch và thời gian
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 24),
                            SizedBox(width: 10),
                            Text(
                              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Text(
                          "${DateTime.now().hour}:${DateTime.now().minute}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Ghi chú
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.note, size: 24),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _noteController,
                            decoration: InputDecoration(
                              hintText: "Nhập ghi chú",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Icon ảnh hoặc camera
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Điều hướng đến trang quét mã QR khi nhấn vào camera
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QRPage()),
                            );
                          },
                          child: Image.asset('./images/Camera.png',
                              width: 50, height: 50),
                        ),
                        SizedBox(width: 20),
                        GestureDetector(
                          onTap: _pickImageFromLibrary,
                          child: Image.asset('./images/Library.png',
                              width: 50, height: 50),
                        ),
                      ],
                    ),
                  ),
                  // Line ngang
                  Divider(),

                  // Nút lưu
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Logic lưu
                      },
                      child: Text(
                        "Lưu",
                        style: TextStyle(
                          color: Colors.white, // White text color
                          fontFamily: 'Inter', // Font family 'Inter'
                          fontSize: 18, // Font size 18
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFFCF9092), // Button background color
                        padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40), // Adjust padding for desired size
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Rounded corners
                        ),
                        fixedSize: Size(
                            358, 51), // Fixed width and height for the button
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
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
              onTap: _onItemTapped, // Xử lý khi nhấn vào các tab
            ),
          ),
        ],
      ),
    );
  }
}
