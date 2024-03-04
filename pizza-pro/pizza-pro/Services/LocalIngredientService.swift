
import Foundation

struct LocalIngredientService {
    let ingredient: [Ingredient] = [
        Ingredient(image: "001", name: "Моцарелла", price: 79),
        Ingredient(image: "002", name: "Чеддер и пармезан", price: 79),
        Ingredient(image: "003", name: "Острый хлапеньо", price: 39),
        Ingredient(image: "004", name: "Цыпленок", price: 79),
        Ingredient(image: "005", name: "Ветчина", price: 139),
        Ingredient(image: "006", name: "Шампиньоны", price: 39),
        Ingredient(image: "007", name: "Маринованные огурчики", price: 39),
        Ingredient(image: "008", name: "Томаты", price: 59),
        Ingredient(image: "009", name: "Острая чоризо", price: 59),
        Ingredient(image: "0010", name: "Брынза", price: 79),
        Ingredient(image: "0011", name: "Блю чиз", price: 79),
        Ingredient(image: "0012", name: "Красный лук", price: 39),
        Ingredient(image: "0013", name: "Итальянские травы", price: 39),
        Ingredient(image: "0014", name: "Ананас", price: 99),
        Ingredient(image: "0015", name: "Сладкий перец", price: 39),
        Ingredient(image: "0016", name: "Маслины", price: 59),
        Ingredient(image: "0017", name: "Митболы", price: 139),
        Ingredient(image: "0018", name: "Пастрами из индейки", price: 159),
        Ingredient(image: "0019", name: "Острый цыпленок", price: 129)
    ]
    
    func fetchIngredient() -> [Ingredient] {
        return ingredient
    }
}
