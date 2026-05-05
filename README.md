# 🌍 Travelers - Full Stack Social App

A professional, feature-rich community platform for travelers to discover global destinations and share their journeys. Built with high performance in mind using **Flutter** and **Firebase**.

---

## 📸 App Showcase

<p align="center">
<img src="home.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="app.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="flutter.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="login.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;
</p>

<p align="center">
<img src="homepaje_insideflutter.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="top_paces.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="inside_bali.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="inside_france.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;
</p>

<p align="center">
<img src="upload_post.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="destination.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="comment.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;  <img src="like.png" width="180"> &nbsp; &nbsp; &nbsp; &nbsp;
</p>

---

## 🚀 Key Features

* **Firebase Authentication:** Secure user identity management with optimized login/signup flows.
* **Real-time Travel Feed:** Instant updates for global travel stories using Cloud Firestore.
* **Dynamic Post Creation:** Upload high-quality travel memories with descriptions and locations.
* **Global Search & Discovery:** Find the best-rated destinations around the world.
* **Social Interactions:** Like posts and engage with other travelers via comments.
* **Responsive UI:** Fully optimized for different screen sizes using Flutter's flexible layout system.

---

## 📂 Project Structure

This is a brief explanation about the folder structure used in this project:

| Directory | Description |
|:---|:---|
| **lib/** | Application core scripts |
| **lib/ui** | Application UI screens/pages and widgets |
| **lib/ui/pages** | All UI screens/pages widgets |
| **lib/ui/widgets** | All reusable UI widgets |
| **lib/utils** | Application styles, router, and miscellaneous utility scripts |

---

## 🛠️ Utility

In this project, we try to organize all the base sources like color, routes, and typography as well as we can. So we can easily use them for any screen widgets or widgets we want. The developer should follow the below-mentioned instruction when developing a new widget or modifying any part of the Travelers App.

1. **AppColors ( `lib/utils/app_color.dart` ) :-** This is the primary script/code that manages the application color scheme. Therefore, the developer should stick with the pre-defined color scheme. If there is a need to introduce a new color, it must be handled through this script. We can declare a new color in this file.

2. **AppRouter :-** We can declare all the screens with each data for what we need on this file to make it easy to implement the navigation.

3. **AppTypography :-** This is the primary script/code that manages the application typography. We used Poppins as a base font family. If there is a need to introduce a new font family or font size and color to easily use it, it must be handled through this script.

---

## 📦 Project Dependencies

We use dependencies/packages from any source such as [pub.dev](https://pub.dev). This is a list of packages that currently work on the project:

| Dependency | Description |
|:---|:---|
| **cupertino_icons** | iOS style icons (Dependency packaged with flutter sdk) |
| **google_fonts** | A Flutter package to use fonts from fonts.google.com |
| **firebase_core** | Essential package to initialize Firebase services |
| **cloud_firestore** | Flutter plugin for Cloud Firestore, a cloud-based NoSQL database |

---

## 🗺️ Application Routing

All apps will use routing for navigating to some screen or page. This is our routes on the project:

| Route | Key | Screen | Related screen |
|:---|:---|:---|:---|
| **loginPage** | `login_page` | LoginPage | Initial screen for user authentication |
| **homePage** | `home_page` | HomePage | Main Page screen or we can call it home screen |
| **postUpload** | `upload_page` | PostUploadPage | Screen for sharing new travel memories |

---

## ⚙️ Getting Started

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/aishwarya-h-2005/Travelers_App.git](https://github.com/aishwarya-h-2005/Travelers_App.git)
