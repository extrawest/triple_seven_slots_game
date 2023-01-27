# Triple seven slots game
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)]()
[![Maintaner](https://img.shields.io/static/v1?label=Roman%20Ovsepian&message=Maintainer&color=red)](mailto:roman.ovsepian@extrawest.com)
[![Ask Me Anything !](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)]()
![GitHub license](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)
![GitHub release](https://img.shields.io/badge/release-v1.0.0-blue)

## PROJECT INFO

- **Triple seven slots game based on Flutter v3.3.9**
- **Game is properly working on Android, iOS and WEB**


## Features

- Slot machine (flutter_roll_slot_machine package)
- Ability to make bet, user balance is locally stored
- Spin wheel each 8 hours
- Different lotties for prizes and balance increasing

## Demo

[Slot Machine Game](https://lucky-slot-machine-game.web.app)

### Installing:

**1) Clone this repo to your folder:**

```
git clone https://gitlab.extrawest.com/i-training/flutter/slot_machine_game
```

**2. Change current directory to the cloned folder:**

```
cd slot_machine_game
```

**3) Get packages**

```
flutter pub get
```

## Firebase hosting

1. In order to add new build to Firebase hosting, follow these commands

```shell
firebase login
```
```shell
firebase init
```
2. Choose account, then choose Hosting as an option
3. Select Firebase project
4. Run:
```shell
flutter build web
```
```shell
firebase deploy
```

### Integration test
In order to run integration test you have to:
1. Use test_driver located at `test_driver/integration_test.dart`.
2. Add enviromental variables API_KEY(for google maps) and IS_TESTING through --dart-define
3. (Optional) Use shader warming up to collect shaders to `flutter_01.sksl.json`

So, to run integration test, run the following command:

Without shaders warming up
```shell
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```

With shaders warming up

```shell
flutter drive --profile --cache-sksl --write-sksl-on-exit flutter_01.sksl.json --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```
<br>

### To build release version with shaders warming up use the following:
Android
```shell
flutter build apk --bundle-sksl-path flutter_01.sksl.json
```
iOS
```shell
flutter build ios --bundle-sksl-path flutter_01.sksl.json
```
<br>



Created by Roman Ovsepian

[Extrawest.com](https://www.extrawest.com), 2022

---