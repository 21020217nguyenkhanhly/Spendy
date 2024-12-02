package com.example.teseractorc;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TesseractExample {
    public static void main(String[] args) {
        ITesseract tesseract = new Tesseract();

        tesseract.setDatapath("C:\\Program Files\\Tesseract-OCR\\tessdata");

        tesseract.setLanguage("vie");

        try {
            File imageFile = new File("C:\\Users\\DELL\\Picture\\ck.jpg");
            String result = tesseract.doOCR(imageFile);

            String transferredAmount = extractTransferredAmount(result);
            String transferStatus = extractTransferStatus(result);
            String transferContent = extractTransferContent(result);

            System.out.println("Số tiền đã chuyển: " + transferredAmount);
            System.out.println("Trạng thái giao dịch: " + transferStatus);
            System.out.println("Nội dung chuyển khoản: " + transferContent);

        } catch (TesseractException e) {
            System.err.println("Lỗi OCR: " + e.getMessage());
        }
    }

    private static String extractTransferredAmount(String text) {
        Pattern pattern = Pattern.compile("(\\d{1,3}(?:,\\d{3})*(?:\\.\\d+)?)\\s*VND");
        Matcher matcher = pattern.matcher(text);
        if (matcher.find()) {
            return matcher.group(1); // Trả về số tiền tìm được
        }
        return "Không tìm thấy số tiền"; // Nếu không tìm thấy số tiền
    }

    private static String extractTransferStatus(String text) {
        if (text.contains("Giao dịch thành công")) {
            return "Đã chuyển";
        }
        return "Chưa chuyển";
    }

    private static String extractTransferContent(String text) {
        Pattern pattern = Pattern.compile("Nội dung:\\s*(.*?)(?=\\n|$)");
        Matcher matcher = pattern.matcher(text);
        if (matcher.find()) {
            return matcher.group(1).trim(); // Trả về nội dung chuyển khoản
        }
        return "Không tìm thấy nội dung chuyển khoản";
    }
}
