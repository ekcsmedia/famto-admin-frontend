# famto_admin_app

A new Flutter project.
//Firebase login
firebase login 

//flutterfire config
flutterfire config

//SHA Key - in android folder
cd android
./gradlew signingReport

// CORS Issue
flutter run -d chrome --web-browser-flag "--disable-web-security"
flutter run -d chrome --web-renderer html

// Rename APP
flutter pub global run rename --appname YourAppName --target android

//Activate rename
flutter pub global activate rename

//delete-conflicting-outputs
flutter packages pub run build_runner build --delete-conflicting-outputs

//run project in specific host and port
flutter run -d chrome --web-hostname 127.0.0.1  --web-port 9999

// Upgrade pub
flutter pub upgrade