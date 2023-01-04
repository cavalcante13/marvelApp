# MarvelApp

MarvelApp is an iPhone app that presents characters, comics and stories from MarvelApi (https://gateway.marvel.com:443).

# MarvelApp Scope

  - Character List Screen that presents information through a infinite list fetching new information after reaching bottom of screen.
  - Detail Screen presents comics and stories of a specific Character after a selection in Home List Screen

# Features

  - iPhone support
  - Infinite Fetching Data for Characters
  - VoiceOver and Dynamic Font Type Accessibility
  - Multi language support - EN, PT-BR
  - Swiftlint to style and conventions
  - Multi Screen and Multi Orientation Support (portrait and landscape)

# Technical Stack

MarvelApp is built using Swift and iOS SDK xCode 14.0.

  - MarvelApp follow the Clean Architecture and MVVM pattern in presentation Layer
  - Layers integration and asynchronous operations is structure upon Combine (https://developer.apple.com/documentation/combine)
  - Image Downloading is made using Kingfisher (https://github.com/onevcat/Kingfisher)
  - To show a custom loading indicator (https://github.com/krimpedance/KRProgressHUD)
  - Modular Project to separate the requests api's from the main App target (MarvelApi)

> Third-Party Dependencies are obtained via Swift Package Manager (SPM).

# Quality

MarvelApp project contains Unit Tests

# Screenshot

<img src="https://github.com/cavalcante13/marvelApp/blob/main/assets/marvel_screens.png" alt="drawing"/>

# Future Improvements

- Layout design
- Specific error handling
- Add UI tests
- Add ViewControllers tests
