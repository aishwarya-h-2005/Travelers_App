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

## 🛠️ Tech Stack

* **Frontend:** [Flutter](https://flutter.dev/) (Dart) - Cross-platform UI development.
* **Database:** [Firebase Firestore](https://firebase.google.com/docs/firestore) - Real-time NoSQL database.
* **Storage:** [Firebase Storage](https://firebase.google.com/docs/storage) - Media hosting for travel photos.
* **Backend Services:** Firebase Auth & Cloud Functions.

---

## 📂 Project Structure

This is the directory structure for the Travelers App, organized for high scalability and maintainability.

```text
lib/
├── ui/
│   ├── pages/
│   │   ├── login_page.dart
│   │   ├── home_page.dart
│   │   ├── post_upload_page.dart
│   │   └── profile_page.dart
│   ├── widgets/
│   │   ├── app_button.dart
│   │   └── travel_card.dart
├── utils/
│   ├── app_color.dart
│   ├── app_router.dart
│   └── app_typography.dart
└── main.dart
