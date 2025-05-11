CREATE DATABASE library_management;

USE library_management;

-- Members Table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    membership_date DATE NOT NULL,
    active_status BOOLEAN DEFAULT TRUE
) COMMENT 'Stores library member information';

-- Authors Table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
) COMMENT 'Contains author details';

-- Publishers Table
CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100),
    webbsite VARCHAR(150),
) COMMENT 'Contains publisher details';

-- Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_year INT,
    publisher_id INT,
    genre VARCHAR(50),
    available_copies INT DEFAULT 1,
    FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
) COMMENT 'Main book inventory';

-- Book_Authors Junction Table
CREATE TABLE book_authors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES books (book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES authors (author_id) ON DELETE CASCADE
) COMMENT 'Junction table for book-author relationships';

-- Loans Table
CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status ENUM(
        'active',
        'returned',
        'overdue'
    ) DEFAULT 'active',
    FOREIGN KEY (book_id) REFERENCES books (book_id),
    FOREIGN KEY (member_id) REFERENCES members (member_id),
    CONSTRAINT chk_dates CHECK (due_date > loan_date)
) COMMENT 'Tracks all book loans';

-- Fines Table
CREATE TABLE fines (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    issued_date DATE NOT NULL,
    paid_status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (loan_id) REFERENCES loans (loan_id)
) COMMENT 'Records fines for overdue books';