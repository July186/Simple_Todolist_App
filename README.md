# Flutter To-Do List App

Aplikasi sederhana To-Do List menggunakan **Flutter**, tanpa database eksternal.  
Data tugas (task) dikelola dengan model sederhana dan disimpan sementara di memori (dapat diperluas dengan penyimpanan lokal bila diperlukan).

## Widget Tree Diagram (Simplified)
```
MyApp (StatelessWidget)
 └── MaterialApp
     ├── Todolist (StatefulWidget)
     │    └── Scaffold
     │         ├── AppBar
     │         ├── ListView (berisi widget ToDoItem)
     │         └── FloatingActionButton (navigasi ke AddTodo)
     └── AddTodo (StatefulWidget)
          └── Scaffold
               ├── AppBar
               ├── TextField (input tugas baru)
               └── ElevatedButton (tombol simpan tugas)
```

## Pendekatan State Management yang Dipilih
Pada aplikasi ini, digunakan pendekatan Provider sebagai state management.

## Alasan Pemilihan Provider
Provider banyak digunakan, terdokumentasi dengan baik, dan sering menjadi standar dasar sebelum beralih ke state management lain yang lebih kompleks.
hanya widget yang membutuhkan data yang akan di-rebuild, sehingga performa aplikasi lebih baik.
 