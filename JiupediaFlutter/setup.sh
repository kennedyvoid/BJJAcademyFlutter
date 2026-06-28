#!/usr/bin/env bash
set -e
flutter create .
flutter pub get
dart run flutter_launcher_icons
flutter run
