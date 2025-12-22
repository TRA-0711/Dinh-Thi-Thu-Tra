package com.example.nullabledemo

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Gắn layout XML vào Activity
        setContentView(R.layout.activity_main)

        // Ánh xạ View từ XML
        val edtName: EditText = findViewById(R.id.edtName)
        val btnCheck: Button = findViewById(R.id.btnCheck)
        val txtResult: TextView = findViewById(R.id.txtResult)

        // Sự kiện click nút
        btnCheck.setOnClickListener {

            // 🔴 BIẾN NULLABLE
            val name: String? = edtName.text?.toString()

            // 🔵 SAFE CALL + ELVIS
            val length: Int = name?.length ?: 0

            // 🔵 XỬ LÝ NULL RÕ RÀNG
            if (name.isNullOrEmpty()) {
                txtResult.text = "Tên đang NULL hoặc rỗng"
            } else {
                txtResult.text = """
                    Tên: $name
                    Độ dài: $length
                """.trimIndent()
            }
        }
    }
}
