struct BrandDecodableEntity: Decodable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "marca"
    }
}
