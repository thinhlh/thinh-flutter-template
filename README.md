# Thinh Flutter Template 2.0

> This Flutter template is written to reduce the development process, effort and initial time. This template also provides a rich external features, clean and readable structure.

## Documentation

1. [Installation](#installation)
2. [Folder structure](#folder-structure)
3. [How to use](#how-to-use)
4. [Application configuration](#application-configuration)
5. [Dependencies](#application-dependencies)
6. [License](#license)


## Installation

1. Clone the project (consider using template).
2. Change all the package name appeared in the project.
3. Update app's resources.

## Folder Structure

> The project folder structures is splited using folder-by-structure method.

**1. App**
This folder contains all the features in the application. Each child folder of this directory is a distinct feature with [common directory](./lib/app/common/) is universial that can be shared by the others.

**2. Base**
This directory contains all the base classes with essential functionality that could be implemented during developing process.

**3. Config**
This folder acts as a resource of the project, containing:
1. Routing
2. Colors
3. Sizes
4. Themes
5. Languages
6. Environments
7. Constants
8. Etc..

**4. Generated**

> **WARNING!!!** Do NOT modify this folder as it will be automatically generated during running the application.

**6. Services**

Contains all the service of the application including but not limited to:
1. Dialog service
2. Shared preference
3. REST API service

**7. Utils**

Contains all the helpers classes that can be shared and resuable in others projects.

**8. App Runner**
The [app_runner.dart](./lib/app_runner.dart) is the root of the application. It contains blocks to instantiate the app with it's dependencies.

## How to use

### Prequesties

This template follow the **Test Driven Development** process and **MVP architecture**. Hence it is essential to have fundamental knowledge about 2 above concepts.

### Implementing features

> All the feature of the application are placed in **app** folder. Each feature is spliited into 3 different folder named domain, data, presentation with different usages.

1.  Domain - *where business layer placed*
    Containing 2 child directories named **entities and services:**

        - Entities: The core entity of the feature, used to display to view.
        - Services: A contract to communicate between domain layer and data layer.

2.  Data - *datasources of the feature*
    Containing 2 child directories named **services, models and dto (optional):**

        - Services: The implementation of service specified in the domain folder.
        - Models: A model that is returned from application's boundary such as from API, local storage

3.  Presentation - *views of the features*
    Containing 3 child directories named **pages, business-logic-handler, widgets:**

        - pages: Contains pages of the features
        - business-logic-handler: This is the component communicates with domain layer and depends on the state managment, whether it could be a bloc, provider, controller, etc...
        - widgets (optional):  contains widgets used accross pages

<!-- 4.  Injection Container

    This file is usally placed at the root of the feature folder and instantiate at the [dependency_initializer file](./lib/utils/dependency_initializer.dart). Etc: [home_injection_container.dart](./lib/app/home/home_injection_container.dart) -->

### Dealing with API / Data handler
> Usually, while using Provider, we often faces with the situation when need to navigating before/after an api is executed (etc: show loading, show dialog...). By default, provider package only support UI reload when state changes, NOT navigating when a new state is exposed (similar to BlocListener). Hence using `apiCallSafety` will avoid this issue.

1. Wrap the api calling function from UI with `apiCallSafety` method (inside [ApiError](./lib/services/rest_api/api/api_error.dart) mixin)
2. Handling call flow by submitting the implementation to these callbacks:
    1. `Future<void> Function()? onStart`
        Called before executing API.

    2. `Future<void> Function()? onCompleted`
        Called right after executing API completed.
    3. `Future<void> Function(T? res)? onSuccess`
        Called after `onCompleted` if success.
    4. `Future<void> Function(dynamic error)? onError` Called after `onCompleted` if error.
    
    5. `Future<void> Function()? onFinally` Called finally where success of failed.
    
    6. `Future<bool> Function()? unauthorized` Called when API return with 401 - Unauthorized. Return `true` if want to forward to *app auth failed handler*, `false` will ignore.
3. Implementing API error handler by status if needed.
## Application configuration

> Depends on the application specification, you will need to modify several values and configuration in order to match the requirements.

### Modify the environment variables

- Depends on the DEV and PRODUCTION stages, you will need to update the [env](./lib/config/env/env.dart)
- To switch between stages, create a new environment main file like this [example](./lib/main_dev.dart).

```
AppConfig(env: Env.dev());
```

- To add more environment, just add it to env folder follow the structure and update [env_type.dart](./lib/config/env/env_type.dart) with specified a new `main_env.dart` file

### Running application from environment
To run app in dev environment consider:
```
flutter run --release -t lib/main_prod.dart
```

### Configurate localization

1. To add more localization (languages, resources), go to translation folder and add new `language-code.json` file or modify the existed resouces. etc: [en.json](./assets/translations/en.json)

2. Generate keys using this command

```
flutter pub run easy_localization:generate -S assets/translations -o locale_keys.g.dart -f keys 
```

3. Transform from keys to string resource

```
tr(LocaleKeys.key_name)
```

### Routing

Because the application follow feature-by-folder structure, each page will contains a different business-logic-handler. For this project, we instantiate it in the [routes.dart](./lib/config/routes.dart)

To add named route to the application, modify the `rooutes.dart` file inside the function `onGenerateRoute`

### Base API response model.

The application RestAPI service depends on the return Base model defined. You can override this model by modifying [base_response.dart](./lib/services/rest_api/models/base_response.dart). Also server error will also be parsed to [model](./lib/services/rest_api/models/base_error.dart).

## Application Dependencies

```
Flutter 3.3.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ffccd96b62 (5 days ago) • 2022-08-29 17:28:57 -0700
Engine • revision 5e9e0e0aa8
Tools • Dart 2.18.0 • DevTools 2.15.0
```

```
flutter_screenutil: ^5.5.4
responsive_framework: ^0.2.0
easy_localization: ^3.0.0
dio: ^4.0.6
provider: ^6.0.2
get_it: ^7.2.0
intl: ^0.17.0
google_fonts: ^3.0.1
shared_preferences: ^2.0.15
logger: ^1.1.0
```

## License

The MIT License

Copyright © 2022 Le Hoang Thinh

> This project is free-to-use and available for commercial usage, howerver, please add the license and asked me before applying this template to production applications.
