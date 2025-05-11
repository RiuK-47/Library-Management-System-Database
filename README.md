# Library-Management-System-Database

I've designed a comprehensive Library Management System database that tracks books, borrowers, loans, and library inventory. This system allows librarians to manage book checkouts, returns, and monitor overdue items while maintaining relationships between entities like books, authors, and borrowers.

## 🌟 Features

- **Full inventory management** (books, authors, publishers)
- **Member tracking** with membership status
- **Loan/return system** with due date enforcement
- **Automatic fine calculation** for overdue items
- **Comprehensive search capabilities** (by title, author, genre)
- **Normalized structure** (3NF compliant)

## 🗄️ Database Schema

### Core Tables

| Table          | Description                         |
| -------------- | ----------------------------------- |
| `members`      | Library patron information          |
| `books`        | Catalog of all library items        |
| `authors`      | Book writers                        |
| `publishers`   | Publishing companies                |
| `loans`        | Checkout records                    |
| `fines`        | Overdue penalties                   |
| `book_authors` | Resolves many-to-many relationships |
