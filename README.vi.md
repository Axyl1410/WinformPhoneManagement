# 📱 Hệ Thống Quản Lý Cửa Hàng Điện Thoại

Ứng dụng desktop Windows Forms để quản lý cửa hàng điện thoại, được xây dựng bằng C# và SQL Server.

## 📋 Tổng Quan

**QLCuaHangDienThoai** là một ứng dụng desktop toàn diện được thiết kế để giúp chủ cửa hàng điện thoại quản lý kho hàng, khách hàng, đơn hàng và doanh số một cách hiệu quả.  Ứng dụng có giao diện thân thiện với người dùng, phân chia chức năng riêng biệt cho quản trị viên và khách hàng. 

## ✨ Tính Năng

### 👤 Quản Lý Người Dùng
- Đăng ký và đăng nhập tài khoản
- Phân quyền theo vai trò (Admin/Khách hàng)
- Quản lý thông tin cá nhân

### 📱 Quản Lý Điện Thoại (Admin)
- Thêm, sửa, xóa sản phẩm điện thoại
- Quản lý danh mục điện thoại (iPhone, Samsung, Nokia, OPPO, Vertu,...)
- Tải lên và quản lý hình ảnh sản phẩm
- Theo dõi số lượng tồn kho và giá cả

### 🛒 Tính Năng Mua Sắm (Khách Hàng)
- Duyệt điện thoại theo danh mục
- Tìm kiếm điện thoại theo tên
- Thêm sản phẩm vào giỏ hàng
- Đặt hàng và xem lịch sử đặt hàng

### 📦 Quản Lý Đơn Hàng
- Theo dõi trạng thái đơn hàng (Chưa thanh toán, Đã thanh toán, Đã huỷ)
- Lịch sử đặt hàng cho khách hàng
- Quản lý đơn hàng toàn diện cho quản trị viên

## 🏗️ Cấu Trúc Dự Án

```
WinformPhoneManagement/
├── QLCuaHangDienThoai. sln          # File solution
├── QLCuaHangDienThoaiDb.sql        # Schema database và dữ liệu mẫu
├── LICENSE                          # Giấy phép MIT
└── QLCuaHangDienThoai/
    ├── Program.cs                   # Điểm khởi chạy ứng dụng
    ├── TrangChu. cs                  # Trang chủ/cửa hàng
    ├── App.config                   # Cấu hình ứng dụng
    ├── DAL/                         # Tầng Truy Cập Dữ Liệu
    │   ├── DienThoaiDAL.cs         # Thao tác dữ liệu điện thoại
    │   ├── TaiKhoanDAL. cs          # Thao tác dữ liệu tài khoản
    │   ├── LoaiDienThoaiDAL.cs     # Thao tác loại điện thoại
    │   ├── GioHangDAL. cs           # Thao tác giỏ hàng
    │   └── DatHangDAL.cs           # Thao tác đơn hàng
    ├── Entity/                      # Các lớp thực thể
    ├── GUI/                         # Giao Diện Người Dùng
    │   └── Admin.cs                # Bảng điều khiển Admin
    ├── Models/                      # Các model dữ liệu
    └── Images/                      # Hình ảnh sản phẩm
```

## 🗄️ Cơ Sở Dữ Liệu

Ứng dụng sử dụng SQL Server với các bảng sau:

| Bảng | Mô Tả |
|------|-------|
| `TaiKhoan` | Tài khoản người dùng (tên đăng nhập, mật khẩu, thông tin cá nhân, quyền admin) |
| `LoaiDienThoai` | Danh mục điện thoại (iPhone, Samsung, Nokia,... ) |
| `DienThoai` | Sản phẩm điện thoại (tên, mô tả, số lượng, giá, hình ảnh) |
| `GioHang` | Các mặt hàng trong giỏ hàng |
| `DatHang` | Đơn hàng với theo dõi trạng thái |

## 🚀 Bắt Đầu

### Yêu Cầu Hệ Thống
- Hệ điều hành Windows
- Visual Studio 2019 hoặc mới hơn
- SQL Server 2019 hoặc mới hơn
- .NET Framework 4.7.2 hoặc mới hơn

### Cài Đặt

1. **Clone repository**
   ```bash
   git clone https://github.com/Axyl1410/WinformPhoneManagement.git
   ```

2. **Thiết lập cơ sở dữ liệu**
   - Mở SQL Server Management Studio
   - Chạy file `QLCuaHangDienThoaiDb. sql` để tạo database và dữ liệu mẫu

3. **Cấu hình connection string**
   - Cập nhật connection string trong `App.config` cho phù hợp với SQL Server của bạn

4. **Build và chạy**
   - Mở `QLCuaHangDienThoai.sln` trong Visual Studio
   - Build solution (Ctrl + Shift + B)
   - Chạy ứng dụng (F5)

### Tài Khoản Mặc Định

| Tên đăng nhập | Mật khẩu | Vai trò |
|---------------|----------|---------|
| admin | 123456 | Quản trị viên |
| User | 123456 | Khách hàng |

## 🛠️ Công Nghệ Sử Dụng

- **Ngôn ngữ:** C# (.NET Framework)
- **UI Framework:** Windows Forms (WinForms)
- **Cơ sở dữ liệu:** Microsoft SQL Server
- **IDE:** Visual Studio

## 📸 Các Thương Hiệu Điện Thoại Hỗ Trợ

- 🍎 Apple iPhone (10, 11, 12, 13, 14, 15)
- 📱 Samsung (Dòng Galaxy J, A, S, M)
- 📞 Nokia (Điện thoại cổ điển & Smartphone)
- 📷 OPPO (Dòng A, F)
- 💎 Vertu (Điện thoại cao cấp)

## 📄 Giấy Phép

Dự án này được cấp phép theo Giấy phép MIT - xem file [LICENSE](LICENSE) để biết chi tiết.

## 👥 Tác Giả

- **Axyl1410** - *Phát triển ban đầu* - [GitHub Profile](https://github.com/Axyl1410)

---

⭐ Nếu bạn thấy dự án này hữu ích, hãy cho nó một ngôi sao nhé! 

---

🌐 [English Version](README.md)
