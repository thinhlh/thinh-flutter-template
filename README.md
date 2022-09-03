# Thinh Flutter Clean Architecture Template

> This Flutter template is written to cater on developers who are familiar with Clean Architecture as well as Test Driven Development process.

## Documentation

[1. Installation](#installation)
[2. Folder structure](#folder-structure)
[3. How to use](#how-to-use)
[4. Application configuration](#application-configuration)
[5. Dependencies](#application-dependencies)
[6. License](#license)

## Installation

1. Clone the project
2. Change all the package name appeared in the project

## Folder Structure

> The project folder structures is splited using folder-by-structure method.

**1. App**
This folder contains all the features in the application. Each child folder of this directory is a distinct feature with [common directory](./lib/app/common/) is universial that can be shared by the others.

**2. Base**
This directory contains all the base classes with essential functionality that could be implemented during developing process.

**3. Config**
This folder acts as a resource of the project, containning routes configuration, colors, dimensions, styles and constants...

**4. Core**

The core folder contains all the environment variables as well as platform-specific and errors configurations.

**5. Generated**

> **WARNING!!!** Do NOT modify this folder as it will be automatically generated during running the application.

**6. Services**

Contains all the service of the application, this including dialog services, localstore services, rest services...

**7. Utils**

Contains all the helper that can be shared and resuable in others projects. This also including the [dependency initializer file](./lib/utils/dependency_initializer.dart) where we inject dependency through out the application.

## How to use

### Prequesties

This template follow the **Test Driven Development** process and **Clean Architecture**. Hence it is essential to have fundamental knowledge about 2 above concepts.

### Implementing features

> All the feature of the application are placed in **app** folder. Each feature is spliited into 3 different folder named domain, data, presentation with different usages.

1.  Domain
    Containing 3 child directories named **entities, usecases,repositories:**

        - Entities: The core entity of the feature, used to display to view.
        - Usecases: Functionalities of the feature.
        - Repository: A contract to communicate between domain and data.

2.  Data
    Containing 3 child directories named **repositories, models, datasources:**

        - Repositories: The implementation of repository specified in the domain folder.
        - Models: A model that is returned from application's boundary such as from API, local storage
        - Datasource: The sources where the application start communicating with other interfaces.

3.  Presentation
    Containing 3 child directories named **pages, business-logic-handler, widgets:**

        - pages: Contains pages of the features
        - business-logic-handler: This is the component communicates with domain layer and depends on the state managment, whether it could be a bloc, provider, controller, etc...
        - widgets (optional):  contains widgets used in pages

4.  Injection Container

    This file is usally placed at the root of the feature folder and instantiate at the [dependency_initializer file](./lib/utils/dependency_initializer.dart). Etc: [home_injection_container.dart](./lib/app/home/home_injection_container.dart)

## Application configuration

> Depends on the application specification, you will need to modify several values and configuration in order to match the requirements.

### Modify the environment variables

- Depends on the DEV and PRODUCTION stages, you will need to update the [env](./lib/core/env/env.dart)
- To switch between stages, go to the [app_runner.dart](./lib/utils/app_runner.dart) and update this line.

```
AppConfig.initialize(env: Env.dev());
```

- To add more environment, just add it to env folder follow the structure.

### Configurate localization

1. To add more localization (languages, resources), go to translation folder and add new `[language-code].json` file or modify the existed resouces. etc: [en.json](./assets/translations/en.json)

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

The application RestAPI service depends on the return Base model defined. You can override this model by modifying [response_model.dart](./lib/base/models/response_model.dart). Also server error will also be parsed to [model](./lib/services/rest_api/models/base_error.dart).

## Application Dependencies

```
Flutter 3.3.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision db747aa133 (3 weeks ago) • 2022-02-09 13:57:35 -0600
Engine • revision ab46186b24
Tools • Dart 2.16.1 • DevTools 2.9.2
```

```
flutter_screenutil: ^5.2.0
responsive_framework: ^0.1.7
easy_localization: ^3.0.0
dio: ^4.0.4
provider: ^6.0.2
dartz: ^0.10.1
equatable: ^2.0.3
get_it: ^7.2.0
intl: ^0.17.0
logger: ^1.1.0
```

## License

The MIT License

Copyright © 2022 Le Hoang Thinh

> This project is free-to-use and available for commercial usage, howerver, please add the license and asked me before applying this template to production applications.
