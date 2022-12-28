// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  public enum ErrorView {
    public enum TryAgain {
      public enum Button {
        /// Try again
        public static let title = Strings.tr("Localizable", "ErrorView.TryAgain.Button.Title", fallback: "Try again")
      }
    }
  }
  public enum Home {
    public enum Navigation {
      /// Localizable.strings
      ///   MarvelApp
      /// 
      ///   Created by Diego Costa on 28/12/22.
      public static let title = Strings.tr("Localizable", "Home.Navigation.Title", fallback: "Marvel App")
    }
  }
  public enum Layout {
    public enum Sections {
      public enum Comics {
        /// Comics
        public static let title = Strings.tr("Localizable", "Layout.Sections.Comics.Title", fallback: "Comics")
      }
      public enum Populars {
        /// Populars
        public static let title = Strings.tr("Localizable", "Layout.Sections.Populars.Title", fallback: "Populars")
      }
      public enum Releases {
        /// Releases
        public static let title = Strings.tr("Localizable", "Layout.Sections.Releases.Title", fallback: "Releases")
      }
      public enum Stories {
        /// Stories
        public static let title = Strings.tr("Localizable", "Layout.Sections.Stories.Title", fallback: "Stories")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
