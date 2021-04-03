// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// And finally, can you also provide us a phone number?
  internal static let andFinallyCanYouAlsoProvideUsAPhoneNumber = L10n.tr("Localizable", "And finally, can you also provide us a phone number?")
  /// Can you briefly describe the job you need to get done?
  internal static let canYouBrieflyDescribeTheJobYouNeedToGetDone = L10n.tr("Localizable", "Can you briefly describe the job you need to get done?")
  /// Description
  internal static let description = L10n.tr("Localizable", "Description")
  /// Error
  internal static let error = L10n.tr("Localizable", "Error")
  /// Malformed network request
  internal static let malformedNetworkRequest = L10n.tr("Localizable", "Malformed network request")
  /// New quote request
  internal static let newQuoteRequest = L10n.tr("Localizable", "New quote request")
  /// Next
  internal static let next = L10n.tr("Localizable", "Next")
  /// Now, select the category that best fits what you are looking for
  internal static let nowSelectTheCategoryThatBestFitsWhatYouAreLookingFor = L10n.tr("Localizable", "Now, select the category that best fits what you are looking for")
  /// Ok
  internal static let ok = L10n.tr("Localizable", "Ok")
  /// Phone number
  internal static let phoneNumber = L10n.tr("Localizable", "Phone number")
  /// Please, tell us your name
  internal static let pleaseTellUsYourName = L10n.tr("Localizable", "Please, tell us your name")
  /// Save
  internal static let save = L10n.tr("Localizable", "Save")
  /// State or ZIP code
  internal static let stateOrZIPCode = L10n.tr("Localizable", "State or ZIP code")
  /// Unknown network error
  internal static let unknownNetworkError = L10n.tr("Localizable", "Unknown network error")
  /// Your name
  internal static let yourName = L10n.tr("Localizable", "Your name")

  internal enum LetSNarrowDownYourSearchByArea {
    /// Let's narrow down your search by area. You can either use names or ZIP codes
    internal static let youCanEitherUseNamesOrZIPCodes = L10n.tr("Localizable", "Let's narrow down your search by area. You can either use names or ZIP codes")
  }

  internal enum WeAreAlmostDone {
    /// We are almost done.. Please, provide a valid email
    internal static let pleaseProvideAValidEmail = L10n.tr("Localizable", "We are almost done.. Please, provide a valid email")
  }

  internal enum YouremailExample {
    /// youremail@example.com
    internal static let com = L10n.tr("Localizable", "youremail@example.com")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
