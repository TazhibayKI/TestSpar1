//
//  Product.swift
//  TestSpar
//
//  Created by Александра Тажибай on 06.02.2024.
//

import Foundation

struct Product: Identifiable, Hashable {
    
    let id = UUID().uuidString
    let name: String
    let price: Double
    let oldPrice: Double
    let weight: Int
    let country: String
    let countryImage: String
    let image: String
    let description: String
    let isDiscount: Bool
    let discount: Int
    let characteristics: Characteristics
    let reviews: Reviews
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }
    
    static func mockData() -> [Product] {
        [
            Product(
                name: "Добавка \"Липа\" к чаю",
                price: 55.9,
                oldPrice: 130.2,
                weight: 200,
                country: "Россия",
                countryImage: "russia",
                image: "100788801",
                description: "Флавоноиды липового цвета обладают противовоспалительным действием, способтвуют укреплению стенки сосудов.",
                isDiscount: true,
                discount: 5,
                characteristics:
                    Characteristics(production: "Россия, Краснодарский край", energyValue: [25, 105], fats: 0.1, squirrels: 1.3, carbohydrates: 3.3),
                reviews:
                    Reviews(raiting: 4.1, count: 19, review:
                                [
                                    Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 4),
                                    Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 2),
                                    Review(name: "Ирина М.", date: "22 мая 2021", description: "Спасибо, что добавка произведена в России! Очень довольна", raiting: 5),
                                    Review(name: "Екатерина С.", date: "15 мая 2021", description: "Отличная добавка, эффективно помогает", raiting: 4),
                                    Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 4),
                                    Review(name: "Александр В.", date: "8 мая 2021", description: "Еще один отличный отзыв!", raiting: 5),
                                    Review(name: "Ирина М.", date: "22 мая 2021", description: "Спасибо, что добавка произведена в России! Очень довольна", raiting: 5),
                                    Review(name: "Екатерина С.", date: "15 мая 2021", description: "Отличная добавка, эффективно помогает", raiting: 4),
                                    Review(name: "Марина П.", date: "10 июня 2021", description: "Пользуюсь несколько месяцев, результаты порадовали!", raiting: 5),
                                    Review(name: "Наталья К.", date: "5 июля 2021", description: "Очень довольна покупкой, рекомендую", raiting: 5),
                                    Review(name: "Владимир С.", date: "20 июля 2021", description: "Эффективность на высоте!", raiting: 4),
                                    Review(name: "Ольга Б.", date: "3 августа 2021", description: "Необходимая вещь для поддержания здоровья", raiting: 5),
                                    Review(name: "Андрей Г.", date: "12 сентября 2021", description: "Приятный вкус, полезная добавка", raiting: 4),
                                    Review(name: "Татьяна Л.", date: "25 сентября 2021", description: "Отличное сочетание цены и качества", raiting: 5),
                                    Review(name: "Сергей Д.", date: "8 октября 2021", description: "Покупаю не первый раз, всегда доволен", raiting: 4),
                                    Review(name: "Елена М.", date: "15 октября 2021", description: "Рекомендую всем, кто заботится о своем здоровье", raiting: 5),
                                ])
            ),
            
            Product(
                name: "Протеиновый порошок",
                price: 340.99,
                oldPrice: 550.32,
                weight: 500,
                country: "США, Калифорния",
                countryImage: "usa",
                image: "101198685",
                description: "Высококачественный протеиновый порошок для поддержания мышечной массы и восстановления после тренировок.",
                isDiscount: false,
                discount: 42,
                characteristics: Characteristics(production: "США, Лос-Анджелес", energyValue: [20, 90], fats: 0.5, squirrels: 20.0, carbohydrates: 3.0),
                reviews:
                    Reviews(raiting: 4.5, count: 25, review:
                                [
                                    Review(name: "Алексей П.", date: "7 апреля 2021", description: "Отличная добавка, приятно удивлен результатами! Желаю, чтобы все продукты были так эффективными", raiting: 4),
                                    Review(name: "Надежда И.", date: "12 мая 2021", description: "Благодарю за качественную добавку из России! Очень довольна результатами", raiting: 5),
                                    Review(name: "Анна К.", date: "25 мая 2021", description: "Прекрасная добавка, заметно улучшает состояние. Рекомендую", raiting: 4),
                                    Review(name: "Михаил С.", date: "18 июня 2021", description: "Использую несколько месяцев, результаты приятно удивили!", raiting: 5),
                                    Review(name: "Евгения Г.", date: "3 июля 2021", description: "Покупка превзошла ожидания, полностью удовлетворена", raiting: 5),
                                    Review(name: "Дмитрий Н.", date: "10 июля 2021", description: "Отличная эффективность, добавка стоит своих денег", raiting: 4),
                                    Review(name: "Олеся М.", date: "5 августа 2021", description: "Необходимый продукт для поддержания здоровья, в восторге", raiting: 5),
                                    Review(name: "Артем Б.", date: "20 августа 2021", description: "Приятный вкус, отличная добавка для заботы о себе", raiting: 4),
                                    Review(name: "Екатерина С.", date: "12 сентября 2021", description: "Сбалансированное сочетание цены и качества, полностью удовлетворена", raiting: 5),
                                    Review(name: "Сергей В.", date: "5 октября 2021", description: "Покупаю не первый раз, всегда радует результат", raiting: 4),
                                    Review(name: "Ирина Л.", date: "18 октября 2021", description: "Рекомендую всем, кто ценит свое здоровье и качество продукции", raiting: 5),
                                ])
            ),
            Product(
                name: "Чай Lipton Холодный Зеленый Чай",
                price: 129.99,
                oldPrice: 230.2,
                weight: 1,
                country: "Япония",
                countryImage: "japan",
                image: "165300",
                description: "Высококачественный зеленый чай 'Сенча' с нежным вкусом и ароматом.",
                isDiscount: false,
                discount: 12,
                characteristics: Characteristics(production: "Япония, Киото", energyValue: [5, 20], fats: 0.2, squirrels: 1.0, carbohydrates: 3.5),
                reviews: Reviews(raiting: 4.8, count: 32, review:
                                    [
                                        Review(name: "Мария К.", date: "3 мая 2021", description: "Отличный зеленый чай, пьем с удовольствием каждый день.", raiting: 3),
                                        Review(name: "Андрей Б.", date: "10 мая 2021", description: "Очень свежий и ароматный чай.", raiting: 5),
                                        Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 4),
                                        Review(name: "Александр В.", date: "8 мая 2021", description: "Еще один отличный отзыв!", raiting: 4),
                                        Review(name: "Ирина М.", date: "22 мая 2021", description: "Спасибо, что добавка произведена в России! Очень довольна", raiting: 5),
                                        Review(name: "Екатерина С.", date: "15 мая 2021", description: "Отличная добавка, эффективно помогает", raiting: 4),
                                        Review(name: "Марина П.", date: "10 июня 2021", description: "Пользуюсь несколько месяцев, результаты порадовали!", raiting: 5),
                                        Review(name: "Наталья К.", date: "5 июля 2021", description: "Очень довольна покупкой, рекомендую", raiting: 5),
                                        Review(name: "Владимир С.", date: "20 июля 2021", description: "Эффективность на высоте!", raiting: 4),
                                        Review(name: "Ольга Б.", date: "3 августа 2021", description: "Необходимая вещь для поддержания здоровья", raiting: 5),
                                        Review(name: "Андрей Г.", date: "12 сентября 2021", description: "Приятный вкус, полезная добавка", raiting: 4),
                                        Review(name: "Татьяна Л.", date: "25 сентября 2021", description: "Отличное сочетание цены и качества", raiting: 5),
                                        Review(name: "Сергей Д.", date: "8 октября 2021", description: "Покупаю не первый раз, всегда доволен", raiting: 4),
                                        Review(name: "Елена М.", date: "15 октября 2021", description: "Рекомендую всем, кто заботится о своем здоровье", raiting: 5),
                                    ])
            ),
            Product(
                name: "Конфеты Трюфель Особый",
                price: 19.99,
                oldPrice: 240.1,
                weight: 300,
                country: "Германия",
                countryImage: "germany",
                image: "101045638",
                description: "Удобные мультивитаминные таблетки с фруктовым вкусом для поддержания здоровья.",
                isDiscount: true,
                discount: 23,
                characteristics: Characteristics(production: "Германия, Берлин", energyValue: [10, 40], fats: 0.3, squirrels: 0.5, carbohydrates: 9.0),
                reviews: Reviews(raiting: 4.3, count: 18, review:
                                    [
                                        Review(name: "Ольга Д.", date: "5 апреля 2021", description: "Отличные витаминки, вкусные и полезные.", raiting: 4),
                                        Review(name: "Сергей М.", date: "12 апреля 2021", description: "Мои дети обожают их.", raiting: 1),
                                        Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 4),
                                        Review(name: "Александр В.", date: "8 мая 2021", description: "Еще один отличный отзыв!", raiting: 5),
                                        Review(name: "Ирина М.", date: "22 мая 2021", description: "Спасибо, что добавка произведена в России! Очень довольна", raiting: 1),
                                        Review(name: "Екатерина С.", date: "15 мая 2021", description: "Отличная добавка, эффективно помогает", raiting: 4),
                                        Review(name: "Марина П.", date: "10 июня 2021", description: "Пользуюсь несколько месяцев, результаты порадовали!", raiting: 5),
                                        Review(name: "Наталья К.", date: "5 июля 2021", description: "Очень довольна покупкой, рекомендую", raiting: 5),
                                        Review(name: "Владимир С.", date: "20 июля 2021", description: "Эффективность на высоте!", raiting: 4),
                                        Review(name: "Ольга Б.", date: "3 августа 2021", description: "Необходимая вещь для поддержания здоровья", raiting: 2),
                                        Review(name: "Андрей Г.", date: "12 сентября 2021", description: "Приятный вкус, полезная добавка", raiting: 4),
                                        Review(name: "Татьяна Л.", date: "25 сентября 2021", description: "Отличное сочетание цены и качества", raiting: 5),
                                        Review(name: "Сергей Д.", date: "8 октября 2021", description: "Покупаю не первый раз, всегда доволен", raiting: 4),
                                        Review(name: "Елена М.", date: "15 октября 2021", description: "Рекомендую всем, кто заботится о своем здоровье", raiting: 5),
                                    ])
            ),
            Product(
                name: "Органические овсянные хлопья",
                price: 22.49,
                oldPrice: 120,
                weight: 120,
                country: "Канада",
                countryImage: "canada",
                image: "100759428",
                description: "Натуральные органические овсянные хлопья для здорового завтрака.",
                isDiscount: true,
                discount: 30,
                characteristics: Characteristics(production: "Канада, Торонто", energyValue: [15, 60], fats: 1.0, squirrels: 2.5, carbohydrates: 11.0),
                reviews: Reviews(raiting: 4.6, count: 22, review:
                                    [
                                        Review(name: "Дмитрий Н.", date: "8 мая 2021", description: "Отличные хлопья, всегда покупаю только этот бренд.", raiting: 5),
                                        Review(name: "Наталья Р.", date: "14 мая 2021", description: "Очень вкусные и полезные.", raiting: 4),
                                        Review(name: "Александр В.", date: "7 мая 2021", description: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими", raiting: 1),
                                        Review(name: "Александр В.", date: "8 мая 2021", description: "Еще один отличный отзыв!", raiting: 3),
                                        Review(name: "Ирина М.", date: "22 мая 2021", description: "Спасибо, что добавка произведена в России! Очень довольна", raiting: 5),
                                        Review(name: "Екатерина С.", date: "15 мая 2021", description: "Отличная добавка, эффективно помогает", raiting: 4),
                                        Review(name: "Марина П.", date: "10 июня 2021", description: "Пользуюсь несколько месяцев, результаты порадовали!", raiting: 1),
                                        Review(name: "Наталья К.", date: "5 июля 2021", description: "Очень довольна покупкой, рекомендую", raiting: 5),
                                        Review(name: "Владимир С.", date: "20 июля 2021", description: "Эффективность на высоте!", raiting: 4),
                                        Review(name: "Ольга Б.", date: "3 августа 2021", description: "Необходимая вещь для поддержания здоровья", raiting: 5),
                                        Review(name: "Андрей Г.", date: "12 сентября 2021", description: "Приятный вкус, полезная добавка", raiting: 4),
                                        Review(name: "Татьяна Л.", date: "25 сентября 2021", description: "Отличное сочетание цены и качества", raiting: 2),
                                        Review(name: "Сергей Д.", date: "8 октября 2021", description: "Покупаю не первый раз, всегда доволен", raiting: 4),
                                        Review(name: "Елена М.", date: "15 октября 2021", description: "Рекомендую всем, кто заботится о своем здоровье", raiting: 5),
                                    ])
            )
        ]
    }
}

struct Characteristics {
    let production: String
    let energyValue: [Int]
    let fats: Double
    let squirrels: Double
    let carbohydrates: Double
}

struct Reviews {
    let raiting: Double
    let count: Int
    let review: [Review]
}

struct Review: Identifiable {
    let id = UUID().uuidString
    let name: String
    let date: String
    let description: String
    let raiting: Int
}
