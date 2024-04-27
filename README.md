# New York Times Top Stories App

This Flutter application allows users to browse the top stories from the New York Times. Users can search for stories by title or author, filter stories by section, and view details of each story.

## Features

- **Search**: Search for stories by title or author.
- **Filtering**: Filter stories by section.
- **View Options**: Switch between list and card view for displaying stories.
- **Detail View**: View detailed information about each story, including title, description, author, and image.
- **Article Web View**: Open and preview the full article in a WebView.

## Architecture

The app follows basic architecture principles and is structured using Dart/Flutter best practices. It includes:

- **Data Layer**: Implemented with DataSource and Repository for fetching New York Times stories.
- **Network Communication**: Integrated Retrofit for handling API requests.
- **Dependency Injection**: Utilizes a DI library for managing dependencies.
- **Testing**: Comprehensive test coverage for all app functionalities.
- **Error Handling**: Handles various error scenarios such as no internet connection and API request errors.
- **Responsive Design**: Supports both portrait and landscape mode.

## Installation

To run the app locally, follow these steps:

1. Clone the repository: `git clone git@github.com:AhmedZein1996/bab_alomda_assessment.git`
3. Create a `.env` file in the root directory and add your New York Times API key:

    ```
    API_KEY="BfuaADX2WzlOGpes2QfNFvYSFepkFhfj"
    ```

4. Install dependencies: `flutter pub get`
5. Run the app: `flutter run`

## Video Demo

A video demonstration of the app's functionality is available in the repository. To watch the demo, download the file `babalomda_assessment.mp4` from the repository.

## Contributors

- [Ahmed Zein](mailto:hr@babalomda.com)
