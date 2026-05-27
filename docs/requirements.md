# 📋 Requirements

This document describes the main requirements of the **WasteManagement** academic project.

---

# 📌 Scope

The system is a web application designed to support community waste management through digital tools.

The application allows users to:

- Register and log in
- Report waste-related issues
- Request special waste collection
- View recycling points and environmental locations
- Access educational content
- Participate in a community ranking system

---

# ✅ Functional Requirements

## FR-01: User Registration

The system shall allow users to create an account.

User registration should collect basic user information required to identify the person and their community.

---

## FR-02: User Login

The system shall allow registered users to log in.

The login process should validate the user credentials stored in the database.

---

## FR-03: User Session Management

The system shall keep an active user session after login.

The session allows the user to access protected sections of the application.

---

## FR-04: Environmental Report Creation

The system shall allow users to create reports about waste-related problems.

Reports may include community issues such as:

- Accumulated waste
- Collection problems
- Improper waste disposal
- Environmental incidents

---

## FR-05: Report Storage

The system shall store submitted reports in the database.

Each report should be associated with the user who created it.

---

## FR-06: Waste Collection Request

The system shall allow users to request special waste collection.

The request should include information such as:

- Waste type
- Address
- Requested date
- Request status

---

## FR-07: Collection Request Storage

The system shall store collection requests in the database.

Each request should be linked to the user who created it.

---

## FR-08: Interactive Map

The system shall display an interactive map with environmental points of interest.

The map may include:

- Recycling points
- Biodigesters
- Environmental events

---

## FR-09: Map Location Categories

The system shall classify map locations by type.

Supported categories include:

- Recycling
- Biodigester
- Event

---

## FR-10: Educational Content

The system shall provide educational content related to waste management and sustainability.

Content may include:

- Recycling information
- Environmental guides
- Sustainability resources

---

## FR-11: Community Ranking

The system shall display a ranking of active users.

The ranking supports the project goal of encouraging participation and environmental engagement.

---

## FR-12: Incentive System

The system shall include a basic incentive concept based on user participation.

The incentive system is intended to promote continuous community involvement.

---

## FR-13: Website Navigation

The system shall provide navigation between the main modules.

Main sections include:

- Home
- Login/Register
- Reports
- Collection Requests
- Map
- Education
- Ranking

---

# 🧪 Non-Functional Requirements

## NFR-01: Web-Based Access

The system shall run as a web application accessible from a browser.

---

## NFR-02: Local Development Environment

The system shall support local execution using:

- XAMPP
- Apache
- MySQL
- phpMyAdmin

---

## NFR-03: Responsive Interface

The user interface should be accessible from different screen sizes.

---

## NFR-04: Data Persistence

The system shall store user, report, collection, and map data in a MySQL database.

---

## NFR-05: Basic Usability

The system should provide simple navigation and clear forms for user interaction.

---

## NFR-06: Maintainability

The project structure should separate main concerns using folders for:

- CSS
- JavaScript
- Database files
- User logic
- Reports
- Map module

---

# ⚠️ Academic Scope

This project was developed as an academic prototype.

The requirements listed here describe the implemented and proposed behavior within the scope of the course project.
