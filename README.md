# Modern Blog Platform

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Ruby](https://img.shields.io/badge/Ruby-3.3.1-red.svg)
![Rails](https://img.shields.io/badge/Rails-7.2.1-green.svg)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Demo](#demo)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Overview

**Modern Blog Platform** is a dynamic and responsive blog application built with Ruby on Rails. It offers a robust user authentication system, role-based access control, and a sleek user interface designed for both administrators and regular users. Administrators have full control over blog articles, while regular users can seamlessly browse and read content without modification privileges.

## Features

### User Authentication & Authorization

- **Devise Integration**: Secure user authentication system allowing users to sign up, log in, and manage their accounts.
- **Role-Based Access Control**:
  - **Admin Users**: Can create, edit, delete, and manage blog articles.
  - **Regular Users**: Can view and browse blog articles without modification rights.

### Blog Management

- **CRUD Operations**: Administrators can perform Create, Read, Update, and Delete operations on blog articles.
- **QR Code Generation**: Each article has associated QR codes (PNG and SVG) for easy sharing and access.
- **Categories**: Organize articles into categories for better navigation and filtering.

### User Interface

- **Responsive Design**: Ensures optimal viewing experience across various devices and screen sizes.
- **Sidebar Navigation**: Intuitive sidebar for easy navigation between different sections of the platform.
- **Animations**: Smooth animations implemented using GSAP for enhanced user experience.
- **Search Functionality**: Allows users to search for articles efficiently.
- **Bookmark Feature**: Users can bookmark their favorite articles for quick access.

### Security

- **Access Protection**: Ensures that only authorized users can access specific parts of the application.
- **CSRF Protection**: Prevents cross-site request forgery attacks.
- **Data Validation**: Ensures that all user inputs are properly validated and sanitized.

### Additional Features

- **Turbolinks**: Enhances navigation speed by making use of Turbolinks.
- **Turbo Streams**: Enables real-time updates and dynamic content rendering without full page reloads.
- **Modern CSS Practices**: Utilizes CSS variables and transitions for a modern and maintainable stylesheet.

## Demo

![Dashboard Screenshot](https://github.com/Abo5/modern-blog-platform/path_to_dashboard_screenshot.png)
*Dashboard view for administrators.*

![User View Screenshot](https://github.com/Abo5/modern-blog-platform/path_to_user_view_screenshot.png)
*User interface for regular users.*

*Note: Replace `path_to_dashboard_screenshot.png` and `path_to_user_view_screenshot.png` with actual paths to your screenshots.*

## Technologies Used

- **Backend**:
  - Ruby on Rails
  - Devise (Authentication)
  - Pundit / CanCanCan (Authorization)
  - RQRCode (QR Code Generation)

- **Frontend**:
  - HTML5 & CSS3
  - JavaScript (ES6)
  - GSAP (Animations)
  - Turbo Streams (Real-Time Updates)

- **Database**:
  - PostgreSQL (or your preferred database)

## Installation

Follow these steps to set up the project locally:

### Prerequisites

- **Ruby**: Version 2.7.0 or higher
- **Rails**: Version 6.1.4 or higher
- **Bundler**: For managing Ruby gems
- **Node.js & Yarn**: For managing JavaScript dependencies
- **PostgreSQL**: (Or another database supported by Rails)

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Abo5/modern-blog-platform.git
   cd modern-blog-platform
   ```

2. **Install Ruby Gems**

   Ensure you have the required Ruby version installed. You can use [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv) to manage Ruby versions.

   ```bash
   bundle install
   ```

3. **Install JavaScript Dependencies**

   ```bash
   yarn install
   ```

4. **Set Up the Database**

   Ensure PostgreSQL is running on your machine. Create the database and run migrations:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed # If you have seed data
   ```

5. **Run the Rails Server**

   ```bash
   rails server
   ```

   Navigate to `http://localhost:3000` in your browser to view the application.

## Usage

### User Roles

- **Admin User**:
  - Can access the admin dashboard.
  - Can create, edit, and delete blog articles.
  - Can manage categories and other administrative tasks.

- **Regular User**:
  - Can view and browse blog articles.
  - Can search for articles.
  - Can bookmark favorite articles.

### Creating an Admin User

By default, users can sign up as regular users. To create an admin user:

1. **Via Rails Console**

   ```bash
   rails console
   ```

   ```ruby
   user = User.find_by(email: 'admin@admin.com')
   user.update(admin: true)
   ```

   Replace `'admin@example.com'` with the actual admin user's email.

2. **Using Seed Data**

   You can add seed data in `db/seeds.rb` to create an admin user:

   ```ruby
   User.create!(
     email: 'admin@example.com',
     password: 'password',
     password_confirmation: 'password',
     admin: true,
     fullname: 'Admin Demo',
     firstname: 'Admin',
     lastname: 'Demo'
   )
   ```

   Then run:

   ```bash
   rails db:seed
   ```

## Contributing

Contributions are welcome! Please follow these steps to contribute to the project:

1. **Fork the Repository**

   Click the "Fork" button at the top right of this page to fork the repository.

2. **Clone Your Fork**

   ```bash
   git clone https://github.com/Abo5/modern-blog-platform.git
   cd modern-blog-platform
   ```

3. **Create a New Branch**

   ```bash
   git checkout -b feature/YourFeatureName
   ```

4. **Make Your Changes**

   Implement your feature or fix.

5. **Commit Your Changes**

   ```bash
   git commit -m "Add feature: YourFeatureName"
   ```

6. **Push to Your Fork**

   ```bash
   git push origin feature/YourFeatureName
   ```

7. **Create a Pull Request**

   Go to the original repository and click "Compare & pull request" to submit your changes.

## License

This project is licensed under the [MIT License](https://github.com/Abo5/modern-blog-platform/LICENSE). You are free to use, modify, and distribute this software as per the terms of the license.

## Contact

For any inquiries or support, please contact:

- **Name**: Maven
- **Email**: aszda44@gmail.com
- **GitHub**: [my_username](https://github.com/Abo5)
- **LinkedIn**: [my LinkedIn Profile](https://www.linkedin.com/in/abdullah-saleh-424bb9307)

# modern-blog-platform-ruby-on-rails
