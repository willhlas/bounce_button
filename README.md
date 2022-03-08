# bounce_button

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Flutter package for creating a widget that adds bounce animation to its child.

---

## Features

TODO: Example gifs

---

## Usage

To use this plugin, add `bounce_button` as a dependency in your pubspec.yaml from git like so:

```yaml
bounce_button:
    git:
      url: https://github.com/willhlas/bounce_button.git
      ref: main
```

---

## Example

Import the library

```dart
import 'package:bounce_button/bounce_button.dart';
```

`onTap`, and `child` is required in the widget. 

```dart
BounceButton(
  onTap: () {},
  child: // Widget
)
```

---

[coverage_badge]: coverage_badge.svg
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis