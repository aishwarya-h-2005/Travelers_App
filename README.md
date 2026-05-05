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

1. **AppColors ( `lib/utils/app_color.dart` ) :-** This is the primary script/code that manages the application color scheme. Therefore, the developer should stick with the pre-defined color scheme.
2. **AppRouter :-** We can declare all the screens with each data for what we need on this file to make it easy to implement the navigation.
3. **AppTypography :-** This is the primary script/code that manages the application typography. We used Poppins as a base font family.

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

## 🤝 How can I contribute?

Before you start making contribution make these things clear:

1. Don't make spam PR's like just add adding (,) and spaces in the file.
2. Make sure you add some value to the repository.
3. Spam PR's won't get merged.
4. Go click and check the link above "How can I contribute?" 👀

### NOTE:
* Make Sure you commit your changes in a new branch.
* Make Sure you Give proper name to your files describing the addition.
* Also Make Sure you comment your code wherever necessary.
* And last but not least, don't forget to read and keep updated with the documentation of the project **above** after you made your changes/modifications.

After a valid pull request, your code will be carefully reviewed and if it matches the rule then it will be accepted otherwise you need to generate a new file. This process may take some time but don't worry.

---

## 📊 REPO STATUS

![Pull Requests](https://img.shields.io/github/issues-pr/aishwarya-h-2005/Travelers_App?style=for-the-badge&color=blue)
![Closed Pull Requests](https://img.shields.io/github/issues-pr-closed/aishwarya-h-2005/Travelers_App?style=for-the-badge&color=green)
![Languages](https://img.shields.io/github/languages/count/aishwarya-h-2005/Travelers_App?style=for-the-badge&color=orange)

---

## 👥 Our Contributors

<a href="https://github.com/aishwarya-h-2005/Travelers_App/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=aishwarya-h-2005/Travelers_App" />
</a>

---
*Made with ❤️ for the traveling community.*
