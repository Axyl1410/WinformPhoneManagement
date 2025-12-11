# 📱 Phone Store Management System

A Windows Forms desktop application for managing a phone store, built with C# and SQL Server.

## 📋 Overview

**QLCuaHangDienThoai** (Phone Store Management) is a comprehensive desktop application designed to help phone store owners manage their inventory, customers, orders, and sales efficiently. The application features a user-friendly interface with separate functionalities for administrators and customers.

## ✨ Features

### 👤 User Management
- User registration and authentication
- Role-based access control (Admin/Customer)
- Profile management with personal information

### 📱 Phone Management (Admin)
- Add, update, and delete phone products
- Manage phone categories (iPhone, Samsung, Nokia, OPPO, Vertu, etc.)
- Upload and manage product images
- Track inventory quantities and pricing

### 🛒 Shopping Features (Customer)
- Browse phones by category
- Search phones by name
- Add items to shopping cart
- Place orders and track order history

### 📦 Order Management
- Order status tracking (Unpaid, Paid, Cancelled)
- Order history for customers
- Complete order management for administrators

## 🏗️ Project Structure

```
WinformPhoneManagement/
├── QLCuaHangDienThoai.sln          # Solution file
├── QLCuaHangDienThoaiDb.sql        # Database schema and seed data
├── LICENSE                          # MIT License
└── QLCuaHangDienThoai/
    ├── Program.cs                   # Application entry point
    ├── TrangChu.cs                  # Main homepage/storefront
    ├── App.config                   # Application configuration
    ├── DAL/                         # Data Access Layer
    │   ├── DienThoaiDAL.cs         # Phone data operations
    │   ├── TaiKhoanDAL.cs          # Account data operations
    │   ├── LoaiDienThoaiDAL.cs     # Phone category operations
    │   ├── GioHangDAL.cs           # Shopping cart operations
    │   └── DatHangDAL.cs           # Order data operations
    ├── Entity/                      # Entity classes
    ├── GUI/                         # Graphical User Interface
    │   └── Admin.cs                # Admin dashboard
    ├── Models/                      # Data models
    └── Images/                      # Product images
```

## 🗄️ Database Schema

The application uses SQL Server with the following tables: 

| Table | Description |
|-------|-------------|
| `TaiKhoan` | User accounts (username, password, profile info, admin flag) |
| `LoaiDienThoai` | Phone categories (iPhone, Samsung, Nokia, etc.) |
| `DienThoai` | Phone products (name, description, quantity, price, image) |
| `GioHang` | Shopping cart items |
| `DatHang` | Orders with status tracking |

## 🚀 Getting Started

### Prerequisites
- Windows OS
- Visual Studio 2019 or later
- SQL Server 2019 or later
- .NET Framework 4.7.2 or later

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Axyl1410/WinformPhoneManagement.git
   ```

2. **Set up the database**
   - Open SQL Server Management Studio
   - Execute `QLCuaHangDienThoaiDb. sql` to create the database and seed data

3. **Configure connection string**
   - Update the connection string in `App.config` to match your SQL Server instance

4. **Build and run**
   - Open `QLCuaHangDienThoai.sln` in Visual Studio
   - Build the solution (Ctrl + Shift + B)
   - Run the application (F5)

### Default Accounts

| Username | Password | Role |
|----------|----------|------|
| admin | 123456 | Administrator |
| User | 123456 | Customer |

## 🛠️ Technologies Used

- **Language:** C# (. NET Framework)
- **UI Framework:** Windows Forms (WinForms)
- **Database:** Microsoft SQL Server
- **IDE:** Visual Studio

## 📸 Supported Phone Brands

- 🍎 Apple iPhone (10, 11, 12, 13, 14, 15)
- 📱 Samsung (Galaxy J, A, S, M series)
- 📞 Nokia (Classic & Smartphone)
- 📷 OPPO (A, F series)
- 💎 Vertu (Luxury phones)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- **Axyl1410** - *Initial work* - [GitHub Profile](https://github.com/Axyl1410)

---

⭐ If you find this project helpful, please consider giving it a star! 
