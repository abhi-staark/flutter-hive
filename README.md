Got it ✅ — here’s a **README.md** you can drop into your GitHub repo that covers both blog posts in a combined, clean format.

---

````markdown
# 🐝 Hive in Flutter — Complete Guide

This repository contains example code from my **two-part Medium series** on **Hive**, the blazing-fast, lightweight, NoSQL database for Flutter.

---

## 📚 Blog Series

### **Part 1 — Simple Key-Value Storage**
Learn the fundamentals of Hive by storing and retrieving simple values like `String` and `int`.  
We’ll build a small app that stores a **random name** and **strength** in Hive.

🔗 Read here → [Part 1: Hive Basics — Simple Key-Value Storage](https://medium.com/YOUR_MEDIUM_LINK_PART1)

---

### **Part 2 — Storing Complex Data Models**
Go beyond strings! Learn how to create **Hive models** with `@HiveType` and `@HiveField` annotations,  
generate **TypeAdapters**, and store/retrieve **custom Dart objects**.

🔗 Read here → [Part 2: Hive Advanced — Models & TypeAdapters](https://medium.com/YOUR_MEDIUM_LINK_PART2)

---

## 📦 Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  hive_flutter: ^1.1.0
  path_provider: ^2.1.5

dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.13
````

Run:

```sh
flutter pub get
```

---

## 🚀 How to Run the Examples

1. **Clone this repo**

```sh
git clone https://github.com/YOUR_USERNAME/hive_flutter_examples.git
cd hive_flutter_examples
```

2. **Get dependencies**

```sh
flutter pub get
```

3. **Generate adapters** (for the model example)

```sh
dart run build_runner build
```

4. **Run the app**

```sh
flutter run
```

---

## 🧪 Included Examples

### 1. `example_one.dart`

Simple key-value store example using:

```dart
Hive.openBox('test_one');
box.put('name', 'Alice');
box.get('name');
```

### 2. `notes_example.dart`

Complex data storage example using:

* Custom model `NotesModel`
* Hive TypeAdapters
* CRUD operations (`add`, `get`, `delete`)

---

## 💡 Why Use Hive?

* ⚡ **Blazing fast** — pure Dart implementation, no native dependencies
* 📦 **Offline-first** — perfect for apps without constant internet access
* 🔑 **Key-value simplicity** + **Model support**
* 🛠 **Strongly typed** when using adapters
* 📱 Ideal for:

  * To-do apps
  * Notes apps
  * Chat history
  * Offline-first dashboards
  * Finance tracking

---

## 📎 Links

* 🔗 [LinkedIn](https://github.com/abhi-staark/flutter-hive)
* 📝 Medium Articles:

  * [Part 1](https://medium.com/YOUR_MEDIUM_LINK_PART1)
  * [Part 2](https://medium.com/YOUR_MEDIUM_LINK_PART2)

---

Happy coding! 🚀🐝

```
