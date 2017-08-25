extension String {

    struct Carbrito {
        static let title = "🐐"
    }

    struct CarForm {
        static let chooseBrand = "Escolha uma marca"
        static let chooseCar = "Escolha um carro"
        static let showCar = "Veja o carro"
    }

    struct ChooseBrandView {
        static let empty = "Não foi possível mostrar nenhuma marca"
    }

    struct ChooseCarByBrandView {
        static let empty = "Não foi possível mostrar nenhum carro"
    }

    struct ShowCarView {
        static let empty = "Não foi possível mostrar o carro"
    }

    struct Navigation {
        struct Title { //swiftlint:disable:this nesting
            static let chooseBrand = "Escolha uma marca"
            static let chooseCarBrand = "Escolha um carro"
        }
    }

    struct CarsError {
        static let cast = "Erro ao receber os dados 😯"
        static let offline = "Você está offline 😢"
        static let other = "Shiiiii! Moio ☹️"
    }
}
