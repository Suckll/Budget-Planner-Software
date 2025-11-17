# 📊 Budget Planner Software

A modern and easy-to-use **budget and expense management app** built with **Flutter** and **SQLite**.  
It helps users track income, expenses, spending categories, and manage finances efficiently.

---

## ✨ Features

### 🔐 User & Security
- Login system with predefined credentials
- Logout support
- Can be extended to Firebase or online accounts later

### 💰 Transactions
- Add income and expenses
- Categorize transactions (Food, Transport, Bills, etc.)
- Shows latest recent transactions on Dashboard
- Full transactions list with delete option
- Stored locally using **SQLite** database

### 📊 Dashboard
- Displays **Total Income, Total Expense, Current Balance**
- Quick actions:
  - ➕ Add Transaction
  - 📄 View Transactions

### 🎨 UI / UX
- Dark theme interface
- Clean and minimal card layout
- Dropdown category selector & transaction type selector

---

## 🧪 Technologies Used

| Technology | Purpose |
|-----------|---------|
| Flutter | Mobile application framework |
| Dart | Programming language |
| SQLite (sqflite) | Local offline database |
| path_provider | DB storage path |
| Material 3 Design | UI components |
---

## 🗄 Database Structure (SQLite)

**Table:** `transactions`

| Column      | Type    | Description |
|-------------|---------|-------------|
| `id`        | INTEGER PRIMARY KEY AUTOINCREMENT | Unique transaction ID |
| `type`      | TEXT    | `income` or `expense` |
| `amount`    | REAL    | Money value |
| `note`      | TEXT    | Description |
| `category`  | TEXT    | Expense/Income category |
| `date`      | TEXT    | ISO timestamp |

---

## 📥 Installation & Running

### Requirements
- Flutter SDK installed
- Android Studio or VS Code
- Android Emulator or Real Device

### Commands

```sh
git clone https://github.com/Suckll/Budget-Planner-Software.git
cd Budget-Planner-Software
flutter pub get
flutter run
```
## File Structure
```sh
lib/
 ├─ main.dart
 ├─ src/
 │   ├─ db/app_db.dart              # SQLite database helper
 │   ├─ pages/
 │   │   ├─ dashboard_page.dart
 │   │   ├─ add_transaction_page.dart
 │   │   ├─ transactions_page.dart
 │   │   └─ login_page.dart
 │   ├─ utils/money.dart            # currency formatting
 │   ├─ services/notifications.dart # (optional)
