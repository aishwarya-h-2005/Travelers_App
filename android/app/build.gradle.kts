plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // --- ADDED THIS FOR FIREBASE ---
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.travel_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // This matches your Firebase Package Name
        applicationId = "com.example.travel_app"
        
        // --- UPDATED THIS TO 21 FOR FIREBASE SUPPORT ---
        minSdk = flutter.minSdkVersion 
        
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // --- ADDED THIS TO PREVENT "TOO MANY FUNCTIONS" ERRORS ---
        multiDexEnabled = true
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.1.0"))
    
    // Firebase Libraries
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-firestore") // ADDED THIS FOR DATABASE
    
    // MultiDex Support
    implementation("androidx.multidex:multidex:2.0.1")
}
