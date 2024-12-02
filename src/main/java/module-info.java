module com.example.teseractorc {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.teseractorc to javafx.fxml;
    exports com.example.teseractorc;
    requires tess4j;
}