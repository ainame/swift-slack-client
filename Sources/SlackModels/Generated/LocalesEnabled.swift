#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/LocalesEnabled`.
public struct LocalesEnabled: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/de-DE`.
    public var deDE: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/en-GB`.
    public var enGB: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/en-US`.
    public var enUS: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/es-ES`.
    public var esES: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/es-LA`.
    public var esLA: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/fr-FR`.
    public var frFR: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/it-IT`.
    public var itIT: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/pt-BR`.
    public var ptBR: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/ru-RU`.
    public var ruRU: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/ja-JP`.
    public var jaJP: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/zh-CN`.
    public var zhCN: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/zh-TW`.
    public var zhTW: Swift.String?
    /// - Remark: Generated from `#/components/schemas/LocalesEnabled/ko-KR`.
    public var koKR: Swift.String?
    /// Creates a new `LocalesEnabled`.
    ///
    /// - Parameters:
    ///   - deDE:
    ///   - enGB:
    ///   - enUS:
    ///   - esES:
    ///   - esLA:
    ///   - frFR:
    ///   - itIT:
    ///   - ptBR:
    ///   - ruRU:
    ///   - jaJP:
    ///   - zhCN:
    ///   - zhTW:
    ///   - koKR:
    public init(
        deDE: Swift.String? = nil,
        enGB: Swift.String? = nil,
        enUS: Swift.String? = nil,
        esES: Swift.String? = nil,
        esLA: Swift.String? = nil,
        frFR: Swift.String? = nil,
        itIT: Swift.String? = nil,
        ptBR: Swift.String? = nil,
        ruRU: Swift.String? = nil,
        jaJP: Swift.String? = nil,
        zhCN: Swift.String? = nil,
        zhTW: Swift.String? = nil,
        koKR: Swift.String? = nil
    ) {
        self.deDE = deDE
        self.enGB = enGB
        self.enUS = enUS
        self.esES = esES
        self.esLA = esLA
        self.frFR = frFR
        self.itIT = itIT
        self.ptBR = ptBR
        self.ruRU = ruRU
        self.jaJP = jaJP
        self.zhCN = zhCN
        self.zhTW = zhTW
        self.koKR = koKR
    }
}
