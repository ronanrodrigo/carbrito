struct CarDecodableEntity: Decodable {
    let name: String
    let code: String
    let year: String
    let brand: String
    let price: Float
    let tax: Float

    enum CodingKeys: String, CodingKey {
        case name = "modelo", code = "codigo_fipe", year = "ano", brand = "marca", price = "valor", tax = "taxa"
    }
}
