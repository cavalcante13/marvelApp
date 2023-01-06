// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {
  public enum Accessibility {
    public enum App {
      public enum Navigation {
        /// Back
        public static let backButton = Strings.tr("Accessibility", "App.Navigation.BackButton")
      }
    }
    public enum Detail {
      public enum Characters {
        public enum Comics {
          /// Comic book
          public static let label = Strings.tr("Accessibility", "Detail.Characters.Comics.label")
          /// %d of %d
          public static func value(_ p1: Int, _ p2: Int) -> String {
            return Strings.tr("Accessibility", "Detail.Characters.Comics.value", p1, p2)
          }
        }
        public enum Stories {
          /// Story %@
          public static func label(_ p1: Any) -> String {
            return Strings.tr("Accessibility", "Detail.Characters.Stories.label", String(describing: p1))
          }
          /// %d of %d
          public static func value(_ p1: Int, _ p2: Int) -> String {
            return Strings.tr("Accessibility", "Detail.Characters.Stories.value", p1, p2)
          }
        }
      }
    }
    public enum Home {
      public enum Characters {
        /// Character %@
        public static func label(_ p1: Any) -> String {
          return Strings.tr("Accessibility", "Home.Characters.label", String(describing: p1))
        }
        /// Section %@
        public static func section(_ p1: Any) -> String {
          return Strings.tr("Accessibility", "Home.Characters.section", String(describing: p1))
        }
        /// %d of %d
        public static func value(_ p1: Int, _ p2: Int) -> String {
          return Strings.tr("Accessibility", "Home.Characters.value", p1, p2)
        }
      }
    }
  }
  public enum Localizable {
    public enum ErrorView {
      public enum TryAgain {
        public enum Button {
          /// Try again
          public static let title = Strings.tr("Localizable", "ErrorView.TryAgain.Button.Title")
        }
      }
    }
    public enum Home {
      public enum Navigation {
        /// Marvel App
        public static let title = Strings.tr("Localizable", "Home.Navigation.Title")
      }
    }
    public enum Layout {
      public enum Sections {
        public enum Comics {
          /// Comics
          public static let title = Strings.tr("Localizable", "Layout.Sections.Comics.Title")
        }
        public enum Populars {
          /// Populars
          public static let title = Strings.tr("Localizable", "Layout.Sections.Populars.Title")
        }
        public enum Releases {
          /// Releases
          public static let title = Strings.tr("Localizable", "Layout.Sections.Releases.Title")
        }
        public enum Stories {
          /// Stories
          public static let title = Strings.tr("Localizable", "Layout.Sections.Stories.Title")
        }
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
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
