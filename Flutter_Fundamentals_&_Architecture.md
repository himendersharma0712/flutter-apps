# Flutter Fundamentals

## What is Flutter?

* Flutter apps use **Material Design** by Google.
* Material Design is a flexible design system for building modern UIs.

```dart
return MaterialApp(
  
);
```

### Flutter Compilation Process

```text
Dart Code
    ↓
Dart & Flutter Tools
    ↓
Native Machine Code
(iOS, Android, Web, Desktop)
```

### Important Project Files

| File/Folder     | Purpose                                 |
| --------------- | --------------------------------------- |
| `lib/main.dart` | Entry point of the application          |
| `pubspec.yaml`  | Defines project dependencies and assets |

---

# Widgets & UI

## Widgets

Flutter uses widgets to build the UI.

* Widgets are combined and nested together.
* This creates a **Widget Tree**.

```text
MaterialApp
 └── Scaffold
      └── Column
           ├── Text
           └── Button
```

### Best Practice

Break large widget trees into smaller reusable custom widgets to:

* Improve readability
* Reduce code complexity
* Encourage reusability

---

# Dart Basics

## Type Safety

Dart is a **type-safe language**.

```dart
String name = "John";
int age = 25;
```

Type safety helps catch errors at compile time.

---

# Stateless vs Stateful Widgets

## StatelessWidget

Use when:

* No internal state is needed.
* UI depends entirely on external data.

Characteristics:

* Doesn't manage internal data.
* Rebuilds only when parent widgets rebuild.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello');
  }
}
```

---

## StatefulWidget

Use when:

* Data changes over time.
* UI should react to state changes.

Characteristics:

* Maintains internal state.
* Calls `setState()` when data changes.
* UI gets rebuilt after state updates.

```dart
setState(() {
  counter++;
});
```

### Rebuild Process

```text
State Changes
      ↓
setState()
      ↓
build() Called Again
      ↓
UI Updated
```

---

# Widget Lifecycle

For Stateful Widgets:

## initState()

Called once when the State object is created.

```dart
@override
void initState() {
  super.initState();
}
```

### Purpose

* Initialize data
* Start API calls
* Configure controllers

---

## build()

Called:

* First time widget is created
* Every time `setState()` runs

```dart
@override
Widget build(BuildContext context) {
  return Container();
}
```

---

## dispose()

Called right before widget removal.

```dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

### Purpose

* Cleanup resources
* Dispose controllers
* Cancel subscriptions

---

# Conditional Rendering

Flutter allows dynamic UI updates using `setState()`.

```dart
setState(() {
  isVisible = true;
});
```

Flutter detects changes and updates the UI.

---

## Conditional Elements Inside Lists

```dart
final myList = [
  1,
  2,
  if (condition)
    3
  else
    4
];
```

---

# Layout System

## Column

Displays widgets vertically.

### Axes

```text
Column

Main Axis  → Vertical
Cross Axis → Horizontal
```

---

## Row

Displays widgets horizontally.

### Axes

```text
Row

Main Axis  → Horizontal
Cross Axis → Vertical
```

---

# Scrollable Content

## SingleChildScrollView

Makes its child widget scrollable.

```dart
SingleChildScrollView(
  child: Column(
    children: [],
  ),
)
```

Useful when content exceeds screen size.

---

# Lists, map() & Spread Operator

## map()

Transforms every element and returns a new iterable.

```dart
final widgets = items.map((item) {
  return Text(item);
}).toList();
```

---

## Spread Operator (`...`)

Extracts all elements from another list.

```dart
children: [
  Text('Header'),
  ...buttons,
]
```

Equivalent to manually inserting each element.

---

# State Management Pattern

## Simple Explanation (Restaurant Analogy)

Imagine your app is a restaurant.

### Parent Widget (Quiz)

* Head Chef
* Owns the application state
* Controls updates

### Child Widget (ResultScreen)

* Waiter
* Stateless
* Displays data
* Cannot modify state directly

The parent passes a callback:

```dart
ResultScreen(
  onRestart: restartQuiz,
)
```

When the button is pressed:

```dart
onRestart();
```

The child simply triggers the callback.

The parent receives the event and performs:

```dart
setState(() {
  ...
});
```

---

## Technical Explanation

### 1. First-Class Functions & Closures

Functions in Dart are first-class citizens.

They can be:

* Stored in variables
* Passed to constructors
* Returned from functions

```dart
ResultScreen(
  restartQuiz,
)
```

A closure retains access to the scope where it was created.

---

### 2. State Hoisting

State is lifted up to a common ancestor.

Benefits:

* Single source of truth
* Better maintainability
* Easier debugging

```text
Parent
 ├── State
 ├── Child A
 └── Child B
```

Children receive data via constructors.

---

### 3. Unidirectional Data Flow

```text
Data
 ↓
Parent
 ↓
Child

User Action
 ↑
Callback
 ↑
Parent
```

#### Rules

* Data flows down.
* Events flow up.

This creates predictable state management.

---

# Flutter DevTools

Useful for:

* Widget inspection
* Performance analysis
* Memory debugging
* Network debugging

Open via:

```text
Ctrl + Shift + P
→ Flutter: Open DevTools
```

---

# Material Theme Builder

Design Flutter themes using Figma:

* Material Theme Builder Plugin

Website:

[Material Theme Builder (Figma)](https://www.figma.com/community/plugin/1034969338659738588/material-theme-builder?utm_source=chatgpt.com)

---

# Build Context

## What is Context?

```dart
BuildContext context
```

Context represents the location of a widget within the widget tree.

It allows Flutter to:

* Find parent widgets
* Access inherited data
* Navigate routes
* Retrieve themes

---

# Futures & Asynchronous Programming

A future (lowercase "f") is an instance of the `Future` class.

A Future represents the result of an asynchronous operation.

---

## States of a Future

### 1. Uncompleted

```dart
Future<String> data = fetchData();
```

The operation is still running.

---

### 2. Completed

The operation finishes:

#### Success

```dart
Future completes with value
```

#### Failure

```dart
Future completes with error
```

---

# Widget Sizing & Constraints

Flutter layouts are constraint-based.

Widgets are sized according to:

1. Parent constraints
2. Child size preferences

---

## Example: Column

A `Column` naturally wants as much height as possible.

```dart
Column(
  children: [],
)
```

Wrapping it in a `Scaffold` constrains it to screen dimensions.

---

## Expanded Widget

Without Expanded:

```dart
Container(
  width: double.infinity,
)
```

The widget requests as much space as possible.

With Expanded:

```dart
Expanded(
  child: Container(),
)
```

The child receives the remaining available space from the parent.

---

# Flutter Rendering Architecture

Flutter maintains three trees.

---

## Widget Tree

Blueprint/configuration of UI.

```text
Widget Tree
```

---

## Element Tree

In-memory representation of widgets.

Responsibilities:

* Tracks widget locations
* Reuses elements when possible
* Determines necessary updates

```text
Element Tree
```

---

## Render Tree

Responsible for actual drawing on screen.

```text
Render Tree
```

Contains visual rendering objects.

---

## Update Flow

```text
build()
    ↓
Widget Tree Updated
    ↓
Element Tree Compared
    ↓
Render Tree Updated
    ↓
UI Changes Visible
```

---

# Performance Best Practices

## Keep Stateful Widgets Small

Reason:

* Only affected widget subtrees rebuild.
* Smaller rebuild regions improve performance.

### Recommended

```text
Page
 ├── Stateless Widgets
 └── Small Stateful Widget
```

### Avoid

```text
Entire Page
    ↓
One Huge Stateful Widget
```

This minimizes unnecessary UI updates and rendering costs.
