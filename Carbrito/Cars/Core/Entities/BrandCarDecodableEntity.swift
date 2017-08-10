struct BrandCarDecodableEntity: Decodable {
    let name: String
    let code: String
    let year: String

    enum CodingKeys: String, CodingKey {
        case name = "modelo", code = "codigo_fipe", year = "ano"
    }
}
