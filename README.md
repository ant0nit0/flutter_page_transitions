# Page Transitions Examples

This Flutter project provides examples of various page transition animations.
The main focus of this project is to demonstrate the usage of the `PageRouteBuilder` class, which allows you to create custom page transitions.

## Features

For now, only the slides transitions are implemented.

- **Slide Transitions**: The project includes a `SlidePageRouteBuilder` class that allows you to create slide-based page transitions with various customization options, such as:

  - Specifying the direction of the slide (e.g., bottom-to-top, top-to-bottom, left-to-right, right-to-left, etc.)
  - Defining the beginning and ending offsets of the slide animation
  - Adjusting the duration and curve of the animation
  - Enabling or disabling the fade effect during the transition

- **Extensibility**: The `SlidePageRouteBuilder` class is designed to be easily extensible, allowing you to add more features or create variations of the slide transition as needed.

- **Flexible Routing**: The project uses a custom `RouteGenerator` class to handle the routing and navigation between different screens, making it easy to integrate the slide transitions into your own Flutter application.

## Getting Started

To use the slide transition examples in this project, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/your-username/page-transitions-examples.git
```

2. Navigate to the project directory:

```bash
cd page-transitions-examples
```

3. Open the project in your preferred Flutter IDE (e.g., Android Studio, Visual Studio Code).

4. Run the app on your desired device or emulator:

```bash
flutter run
```

## Usage

The main entry point of the project is the `HomeScreen`, which provides links to the different page transition examples.
To navigate between the screens,the app uses the `RouteGenerator` class, which defines the routes and transitions between the screens.
Each of the routes are declared as static strings in the `Routes` class.

Here's an example of how to use the `SlidePageRouteBuilder`:

```dart
// router.dart
static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case Routes.slideScreen:
        return SlidePageRouteBuilder(const SlideTransitionsScreen());
      case Routes.slideSecondScreen:
        try {
          final args = settings.arguments as SlidePageRouteBuilderArgs;
          return SlidePageRouteBuilder(const SecondScreen(), args: args);
        } catch (e) {
          return SlidePageRouteBuilder(const SecondScreen());
        }
      default:
        return _errorRoute(settings.name ?? '', settings);
    }
  }
```

This allow us to be able to customize the transition between screens.

## Customization

You can customize the behavior of the `SlidePageRouteBuilder` by modifying the `SlidePageRouteBuilderArgs` class. The available options are:

- `beginOffset`: The starting offset of the slide animation.
- `endOffset`: The ending offset of the slide animation.
- `curve`: The animation curve used for the slide transition.
- `direction`: The direction of the slide transition.
- `duration`: The duration of the slide transition.
- `fade`: Whether to include a fade effect during the transition.

Additionally, the `SlidePageRouteBuilder` class exposes several other parameters that are passed to the underlying `PageRouteBuilder` class,
allowing you to further customize the route's behavior, such as setting the barrier color, maintaining state, and more.

## Contributing

If you find any issues or have ideas for improvements, feel free to open an issue or submit a pull request. Contributions are always welcome!
