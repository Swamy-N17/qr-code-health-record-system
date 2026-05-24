```sql
CREATE DATABASE health_record_db;

USE health_record_db;

-- =========================
-- TABLE: USERS
-- =========================

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'doctor', 'patient') NOT NULL
);

-- =========================
-- TABLE: DOCTORS
-- =========================

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    specialization VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    date_of_birth DATE
);

-- =========================
-- TABLE: PATIENTS
-- =========================

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    blood_group VARCHAR(5),
    phone VARCHAR(20),
    email VARCHAR(100),
    password VARCHAR(255) NOT NULL,
    address VARCHAR(200),
    allergies VARCHAR(200),
    qr_code VARCHAR(50),
    diagnosis TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TABLE: DIAGNOSES
-- =========================

CREATE TABLE diagnoses (
    diagnosis_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT,
    diagnosis TEXT,
    diagnosis_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_diagnosis_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_diagnosis_doctor
    FOREIGN KEY (doctor_id)
    REFERENCES users(user_id)
    ON DELETE SET NULL
);

-- =========================
-- TABLE: PRESCRIPTIONS
-- =========================

CREATE TABLE prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    medicine_name VARCHAR(100) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    notes TEXT,
    prescription_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_prescription_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients(patient_id)
);

-- =========================
-- SAMPLE ADMIN LOGIN
-- =========================

INSERT INTO users(username, password, role)
VALUES ('admin', 'admin123', 'admin');
```
