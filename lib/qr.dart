import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import dart:io to use File

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String _text = "Chưa có dữ liệu"; // Text để hiển thị kết quả OCR
  bool _isProcessing = false; // Trạng thái để kiểm tra quá trình xử lý OCR
  XFile? _imageFile; // Biến để lưu ảnh đã chọn, có thể là null

  // Hàm chọn ảnh từ thư viện hoặc camera và quét text bằng OCR
  Future<void> _pickImageAndScan() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera); // Chọn từ camera thay vì thư viện

    if (pickedFile != null) {
      setState(() {
        _isProcessing = true; // Bắt đầu quá trình xử lý OCR
        _imageFile = pickedFile; // Lưu ảnh đã chọn
      });

      // Quét văn bản từ ảnh đã chọn
      String text = await FlutterTesseractOcr.extractText(pickedFile.path);

      setState(() {
        _isProcessing = false; // Kết thúc quá trình xử lý
        _text = text.isNotEmpty ? text : "Không nhận diện được văn bản";
      });
    } else {
      setState(() {
        _text = "Chưa chụp ảnh nào.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quét văn bản từ hình ảnh"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Phần gradient ở đầu
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
                child: Center(
                  child: Text(
                    "Quét văn bản từ hình ảnh",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            // Phần nội dung
            Positioned(
              top: MediaQuery.of(context).size.height /
                  3, // Đặt phần nội dung dưới gradient
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  // Hiển thị văn bản đã quét
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        _text,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  // Hiển thị ảnh chụp nếu có
                  if (_imageFile != null)
                    Image.file(
                      File(_imageFile!.path),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  // Nút để chọn ảnh từ camera
                  ElevatedButton(
                    onPressed: _pickImageAndScan,
                    child: _isProcessing
                        ? CircularProgressIndicator() // Hiển thị loading khi quét
                        : Text("Chụp ảnh để quét"),
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
