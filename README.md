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

[Triple Seven Slots Game](https://triple-seven-slots.web.app)

### Installing:

**1. Clone this repo to your folder:**

```
git clone https://gitlab.extrawest.com/i-training/flutter/triple_seven_slots_game.git
```

**2. Change current directory to the cloned folder:**

```
cd triple_seven_slots_game
```

**3. Get packages**

```
flutter pub get
```

## Testing
### Unit tests
To run unit test run the following command in the terminal
```shell
flutter test test/unit_test/<select_file>
```

### Widget test
To run widget test run the following command in the terminal

```shell
flutter test test/widget_test/<select_file> --dart-define IS_TESTING=true
```
If you are testing slot machine and want to specify prize, run:

```shell
flutter test test/widget_test/<select_file> --dart-define IS_TESTING=true --dart-define MOCK_SLOT_MACHINE_PRIZE_INDEX=<choose prize index>
```

### Integration test
In order to run integration test you have to run the following command:

```shell
flutter test integration_test/app_test.dart --dart-define IS_TESTING=true --dart-define MOCK_SLOT_MACHINE_VALUES=<choose prize index>
```

### BDD testing
To create new BDD tests, follow next steps

**1. Create new <file_name>.feature file(only if you want to test new features, otherwise, open .feature file of existing feature)**

**2. Add all scenarios you need**

**3. Save file and run:**

```
flutter packages pub run build_runner build watch --delete-conflicting-outputs
```

**4. Review the generated code, and modify files, if there is some errors(don't modify main test file of the feature, update only steps files)**


## Setup code coverage preview

macOS or Linux:

All you have to do is to run these three commands
```shell
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
# MacOS
open coverage/html/index.html
# Linux
xdg-open coverage/html/index.html
```

>The generated HTML report will create a lot of files. To avoid checking them in to git, add `coverage`/ to your `.gitignore` file.

Windows:
Now create a file called `genhtml.perl` inside your flutter project root directory. (Make sure to .gitignore it) Then in the file, copy and paste the content this: https://raw.githubusercontent.com/linux-test-project/lcov/master/bin/genhtml

Finally open git bash and run `$ ./genhtml.perl ./coverage/lcov.info -o coverage/html`

Check You are done html files at `coverage/html`.

On android studio, select index.html then CTRL+SHIFT+C to copy the file path.

Open Chrome and on the url bar add `file:///+CTRL+V`. Tap enter. You are done.

### Source:
https://stackoverflow.com/questions/62184806/how-to-view-code-coverage-as-html-in-windows
<br>


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


Created by Roman Ovsepian

[Extrawest.com](https://www.extrawest.com), 2022

---