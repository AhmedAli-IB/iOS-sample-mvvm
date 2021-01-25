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
  internal enum Assets {
    internal static let icon = ImageAsset(name: "Icon")
    internal static let icon1 = ImageAsset(name: "Icon_1")
    internal static let icon2 = ImageAsset(name: "Icon_2")
    internal static let icon3 = ImageAsset(name: "Icon_3")
    internal static let item2 = ImageAsset(name: "Item_2")
    internal static let item2Copy = ImageAsset(name: "Item_2_Copy")
    internal static let item3 = ImageAsset(name: "Item_3")
    internal static let item4 = ImageAsset(name: "Item_4")
    internal static let item5 = ImageAsset(name: "Item_5")
    internal static let active = ImageAsset(name: "active")
    internal static let bgHeaderShape = ImageAsset(name: "bg_header-shape")
    internal static let icSearch = ImageAsset(name: "ic_Search")
    internal static let icCancel = ImageAsset(name: "ic_cancel")
    internal static let icChat = ImageAsset(name: "ic_chat")
    internal static let icEmptyConsultations = ImageAsset(name: "ic_empty-consultations")
    internal static let icHomeActive = ImageAsset(name: "ic_home-active")
    internal static let icHomeDot = ImageAsset(name: "ic_home_dot")
    internal static let icInactiveProfile = ImageAsset(name: "ic_inactive-profile")
    internal static let icNotBooked = ImageAsset(name: "ic_not-booked")
    internal static let icNotificationActiveRed = ImageAsset(name: "ic_notification-active-red")
    internal static let icNotificationActive = ImageAsset(name: "ic_notification-active")
    internal static let icReadMore = ImageAsset(name: "ic_read-more")
    internal static let mainIconIcConsultancy = ImageAsset(name: "main-icon_ic_Consultancy")
    internal static let mainIconIcConsultancy1 = ImageAsset(name: "main-icon_ic_Consultancy_1")
    internal static let mainIconIcConsultancy2 = ImageAsset(name: "main-icon_ic_Consultancy_2")
    internal static let placeholder = ImageAsset(name: "placeholder")
  }
  internal enum ColorPalette {
    internal static let _13 = ColorAsset(name: "13")
    internal static let blue0 = ColorAsset(name: "Blue0")
    internal static let blue10 = ColorAsset(name: "Blue10")
    internal static let blue100 = ColorAsset(name: "Blue100")
    internal static let blue20 = ColorAsset(name: "Blue20")
    internal static let blue30 = ColorAsset(name: "Blue30")
    internal static let blue40 = ColorAsset(name: "Blue40")
    internal static let blue5 = ColorAsset(name: "Blue5")
    internal static let blue50 = ColorAsset(name: "Blue50")
    internal static let blue60 = ColorAsset(name: "Blue60")
    internal static let blue70 = ColorAsset(name: "Blue70")
    internal static let blue80 = ColorAsset(name: "Blue80")
    internal static let blue90 = ColorAsset(name: "Blue90")
    internal static let celadon0 = ColorAsset(name: "Celadon0")
    internal static let celadon10 = ColorAsset(name: "Celadon10")
    internal static let celadon100 = ColorAsset(name: "Celadon100")
    internal static let celadon20 = ColorAsset(name: "Celadon20")
    internal static let celadon30 = ColorAsset(name: "Celadon30")
    internal static let celadon40 = ColorAsset(name: "Celadon40")
    internal static let celadon5 = ColorAsset(name: "Celadon5")
    internal static let celadon50 = ColorAsset(name: "Celadon50")
    internal static let celadon60 = ColorAsset(name: "Celadon60")
    internal static let celadon70 = ColorAsset(name: "Celadon70")
    internal static let celadon80 = ColorAsset(name: "Celadon80")
    internal static let celadon90 = ColorAsset(name: "Celadon90")
    internal static let coolGrey = ColorAsset(name: "Cool grey")
    internal static let cyan0 = ColorAsset(name: "Cyan0")
    internal static let cyan10 = ColorAsset(name: "Cyan10")
    internal static let cyan100 = ColorAsset(name: "Cyan100")
    internal static let cyan20 = ColorAsset(name: "Cyan20")
    internal static let cyan30 = ColorAsset(name: "Cyan30")
    internal static let cyan40 = ColorAsset(name: "Cyan40")
    internal static let cyan5 = ColorAsset(name: "Cyan5")
    internal static let cyan50 = ColorAsset(name: "Cyan50")
    internal static let cyan60 = ColorAsset(name: "Cyan60")
    internal static let cyan70 = ColorAsset(name: "Cyan70")
    internal static let cyan80 = ColorAsset(name: "Cyan80")
    internal static let cyan90 = ColorAsset(name: "Cyan90")
    internal static let darkSlateGray = ColorAsset(name: "Dark slate gray")
    internal static let glitter = ColorAsset(name: "Glitter")
    internal static let gray0 = ColorAsset(name: "Gray0")
    internal static let gray10 = ColorAsset(name: "Gray10")
    internal static let gray100 = ColorAsset(name: "Gray100")
    internal static let gray20 = ColorAsset(name: "Gray20")
    internal static let gray30 = ColorAsset(name: "Gray30")
    internal static let gray40 = ColorAsset(name: "Gray40")
    internal static let gray5 = ColorAsset(name: "Gray5")
    internal static let gray50 = ColorAsset(name: "Gray50")
    internal static let gray60 = ColorAsset(name: "Gray60")
    internal static let gray70 = ColorAsset(name: "Gray70")
    internal static let gray80 = ColorAsset(name: "Gray80")
    internal static let gray90 = ColorAsset(name: "Gray90")
    internal static let green0 = ColorAsset(name: "Green0")
    internal static let green10 = ColorAsset(name: "Green10")
    internal static let green100 = ColorAsset(name: "Green100")
    internal static let green20 = ColorAsset(name: "Green20")
    internal static let green30 = ColorAsset(name: "Green30")
    internal static let green40 = ColorAsset(name: "Green40")
    internal static let green5 = ColorAsset(name: "Green5")
    internal static let green50 = ColorAsset(name: "Green50")
    internal static let green60 = ColorAsset(name: "Green60")
    internal static let green70 = ColorAsset(name: "Green70")
    internal static let green80 = ColorAsset(name: "Green80")
    internal static let green90 = ColorAsset(name: "Green90")
    internal static let jetpackGreen0 = ColorAsset(name: "JetpackGreen0")
    internal static let jetpackGreen10 = ColorAsset(name: "JetpackGreen10")
    internal static let jetpackGreen100 = ColorAsset(name: "JetpackGreen100")
    internal static let jetpackGreen20 = ColorAsset(name: "JetpackGreen20")
    internal static let jetpackGreen30 = ColorAsset(name: "JetpackGreen30")
    internal static let jetpackGreen40 = ColorAsset(name: "JetpackGreen40")
    internal static let jetpackGreen5 = ColorAsset(name: "JetpackGreen5")
    internal static let jetpackGreen50 = ColorAsset(name: "JetpackGreen50")
    internal static let jetpackGreen60 = ColorAsset(name: "JetpackGreen60")
    internal static let jetpackGreen70 = ColorAsset(name: "JetpackGreen70")
    internal static let jetpackGreen80 = ColorAsset(name: "JetpackGreen80")
    internal static let jetpackGreen90 = ColorAsset(name: "JetpackGreen90")
    internal static let mantis = ColorAsset(name: "Mantis")
    internal static let mikadoYellow = ColorAsset(name: "Mikado yellow")
    internal static let orange0 = ColorAsset(name: "Orange0")
    internal static let orange10 = ColorAsset(name: "Orange10")
    internal static let orange100 = ColorAsset(name: "Orange100")
    internal static let orange20 = ColorAsset(name: "Orange20")
    internal static let orange30 = ColorAsset(name: "Orange30")
    internal static let orange40 = ColorAsset(name: "Orange40")
    internal static let orange5 = ColorAsset(name: "Orange5")
    internal static let orange50 = ColorAsset(name: "Orange50")
    internal static let orange60 = ColorAsset(name: "Orange60")
    internal static let orange70 = ColorAsset(name: "Orange70")
    internal static let orange80 = ColorAsset(name: "Orange80")
    internal static let orange90 = ColorAsset(name: "Orange90")
    internal static let pacificBlue = ColorAsset(name: "Pacific Blue")
    internal static let persianOrange = ColorAsset(name: "Persian orange")
    internal static let pink0 = ColorAsset(name: "Pink0")
    internal static let pink10 = ColorAsset(name: "Pink10")
    internal static let pink100 = ColorAsset(name: "Pink100")
    internal static let pink20 = ColorAsset(name: "Pink20")
    internal static let pink30 = ColorAsset(name: "Pink30")
    internal static let pink40 = ColorAsset(name: "Pink40")
    internal static let pink5 = ColorAsset(name: "Pink5")
    internal static let pink50 = ColorAsset(name: "Pink50")
    internal static let pink60 = ColorAsset(name: "Pink60")
    internal static let pink70 = ColorAsset(name: "Pink70")
    internal static let pink80 = ColorAsset(name: "Pink80")
    internal static let pink90 = ColorAsset(name: "Pink90")
    internal static let purple0 = ColorAsset(name: "Purple0")
    internal static let purple10 = ColorAsset(name: "Purple10")
    internal static let purple100 = ColorAsset(name: "Purple100")
    internal static let purple20 = ColorAsset(name: "Purple20")
    internal static let purple30 = ColorAsset(name: "Purple30")
    internal static let purple40 = ColorAsset(name: "Purple40")
    internal static let purple5 = ColorAsset(name: "Purple5")
    internal static let purple50 = ColorAsset(name: "Purple50")
    internal static let purple60 = ColorAsset(name: "Purple60")
    internal static let purple70 = ColorAsset(name: "Purple70")
    internal static let purple80 = ColorAsset(name: "Purple80")
    internal static let purple90 = ColorAsset(name: "Purple90")
    internal static let red0 = ColorAsset(name: "Red0")
    internal static let red10 = ColorAsset(name: "Red10")
    internal static let red100 = ColorAsset(name: "Red100")
    internal static let red20 = ColorAsset(name: "Red20")
    internal static let red30 = ColorAsset(name: "Red30")
    internal static let red40 = ColorAsset(name: "Red40")
    internal static let red5 = ColorAsset(name: "Red5")
    internal static let red50 = ColorAsset(name: "Red50")
    internal static let red60 = ColorAsset(name: "Red60")
    internal static let red70 = ColorAsset(name: "Red70")
    internal static let red80 = ColorAsset(name: "Red80")
    internal static let red90 = ColorAsset(name: "Red90")
    internal static let steelBlue = ColorAsset(name: "Steel blue")
    internal static let whiteSmoke = ColorAsset(name: "White smoke")
    internal static let yellow0 = ColorAsset(name: "Yellow0")
    internal static let yellow10 = ColorAsset(name: "Yellow10")
    internal static let yellow100 = ColorAsset(name: "Yellow100")
    internal static let yellow20 = ColorAsset(name: "Yellow20")
    internal static let yellow30 = ColorAsset(name: "Yellow30")
    internal static let yellow40 = ColorAsset(name: "Yellow40")
    internal static let yellow5 = ColorAsset(name: "Yellow5")
    internal static let yellow50 = ColorAsset(name: "Yellow50")
    internal static let yellow60 = ColorAsset(name: "Yellow60")
    internal static let yellow70 = ColorAsset(name: "Yellow70")
    internal static let yellow80 = ColorAsset(name: "Yellow80")
    internal static let yellow90 = ColorAsset(name: "Yellow90")
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
