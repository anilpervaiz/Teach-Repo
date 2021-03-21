// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Colors {
    internal static let sapphireLightTranslucent = ColorAsset(name: "SapphireLightTranslucent")
    internal static let aquaMarine = ColorAsset(name: "aquaMarine")
    internal static let darkBlue = ColorAsset(name: "darkBlue")
    internal static let darkOverlay = ColorAsset(name: "darkOverlay")
    internal static let disableGray = ColorAsset(name: "disableGray")
    internal static let dullWhite = ColorAsset(name: "dullWhite")
    internal static let gray = ColorAsset(name: "gray")
    internal static let halfBaked = ColorAsset(name: "halfBaked")
    internal static let lightGray = ColorAsset(name: "lightGray")
    internal static let primary = ColorAsset(name: "primary")
    internal static let pureWhite = ColorAsset(name: "pureWhite")
    internal static let sapphireLight = ColorAsset(name: "sapphireLight")
    internal static let successGreen = ColorAsset(name: "successGreen")
    internal static let tomatoRed = ColorAsset(name: "tomatoRed")
  }
  internal enum Media {
    internal static let add = ImageAsset(name: "Add")
    internal static let checkedCircle = ImageAsset(name: "checkedCircle")
    internal static let uncheckedCircle = ImageAsset(name: "uncheckedCircle")
    internal static let onboardingPage1 = ImageAsset(name: "onboardingPage1")
    internal static let onboardingPage2 = ImageAsset(name: "onboardingPage2")
    internal static let onboardingPage3 = ImageAsset(name: "onboardingPage3")
    internal static let recording = ImageAsset(name: "Recording")
    internal static let facebookIcon = ImageAsset(name: "facebookIcon")
    internal static let googleIcon = ImageAsset(name: "googleIcon")
    internal static let backArrow = ImageAsset(name: "backArrow")
    internal static let camera = ImageAsset(name: "camera")
    internal static let circularAddIcon = ImageAsset(name: "circularAddIcon")
    internal static let crossIcon = ImageAsset(name: "crossIcon")
    internal static let downArrow = ImageAsset(name: "down-arrow")
    internal static let errorIcon = ImageAsset(name: "errorIcon")
    internal static let eyeIcon = ImageAsset(name: "eyeIcon")
    internal static let female = ImageAsset(name: "female")
    internal static let forwardArrow = ImageAsset(name: "forward-arrow")
    internal static let getStartedIllustration = ImageAsset(name: "getStartedIllustration")
    internal static let male = ImageAsset(name: "male")
    internal static let radioButtonEmpty = ImageAsset(name: "radioButtonEmpty")
    internal static let radioButtonSelected = ImageAsset(name: "radioButtonSelected")
    internal static let uploadFile = ImageAsset(name: "uploadFile")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
