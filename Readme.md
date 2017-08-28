# Car 🐐
[![codebeat badge](https://codebeat.co/badges/40a7d80d-a468-42d6-8061-9ca01e426aeb)](https://codebeat.co/projects/github-com-ronanrodrigo-carbrito-master) [![Build Status](https://www.bitrise.io/app/6e4614b5869bfc76/status.svg?token=_Qi9Zsdhv-akGBa0PPg4Eg&branch=master)](https://www.bitrise.io/app/6e4614b5869bfc76) [![codecov](https://codecov.io/gh/ronanrodrigo/carbrito/branch/master/graph/badge.svg)](https://codecov.io/gh/ronanrodrigo/carbrito)

## Built with enviroment
- Xcode 9.0 bet 6
- Swift 4.0

## Setup
1. If you does not have Cocoapod: `gem install cocoapod`
1. Install pods: `pod install`
1. Open `open Carbrito.xcworkspace`
1. To use fastlane: https://github.com/ronanrodrigo/carbrito/tree/master/Fastlane

## Structure
```
┌── <Module Name>
│   ├── Core            → Itens without third party dependencies;
│   │   ├── Entities    → Entities from Clean Architecture. Is where all domain logic lives;
│   │   ├── Gateways    → Gateways protocols. Used to get data from anywhere;
│   │   ├── Presenters  → Presenter protocols. Used to present data from anywhere;
│   │   ├── Routers     → Routers protocols. Used to navigate to anywhere;
│   │   └── Usecases    → Usecase from Clean Architecture. Is where all app logic lives;
│   ├── Factories       → Agnostic to Architecture. Is used to symplify D.I. and object constructions;
│   ├── Controllers     → Simple controllers. Does not know about UI stufss like events and elements;
│   ├── Gateways        → Concrete implementation of gateways. Like network gateway or database gateway;
│   ├── Routers         → Concrete implementation of routers;
│   └── Views           → UI elements and events are placed here;
├── Common              → Shared stuffs accros modules;
└── Essentials          → Essential stuffs for the UIAppliction.
```

🐐 Goat in Brazil is called by Cabrito.
