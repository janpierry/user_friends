<h1 align="center">
  User Friends App
</h1>

## About

This is a simple monorepo app made with Flutter through Test Driven Development and following Clean Architecture.

### How is the state management done?

The app was built using Bloc for state management.

> https://pub.dev/packages/flutter_bloc

### What kind of tests are in it?

There are only unit tests, and they were written using mocktail.

> https://pub.dev/packages/mocktail

### Are there some CI/CD process in the project?

There are just CI automation through Bitrise. The app was built following GitFlow, so the branches main and develop are protected. To merge into them it's necessary to create pull requests and to merge the pull requests the changes must pass the tests.

> https://www.bitrise.io/

### Where the data come from?

It access a public api for generating random user data through http package.

Api
> https://randomuser.me/

Http
> https://pub.dev/packages/http

### How

## Getting Started

Like a normal Flutter app, to install it you just need to clone the repository and execute the main function inside of main.dart file.