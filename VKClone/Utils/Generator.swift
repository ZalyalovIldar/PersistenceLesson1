//
//  Generator.swift
//  VKClone
//
//  Created by Петр on 04/11/2018.
//  Copyright © 2018 DreamTeam. All rights reserved.
//

import Foundation

// This class contains features that generate news and user
final class Generator {
        
    // MARK: - Generators
    
    /// Generate random user
    ///
    /// - Returns: random user
    func generateAndSaveRandomUser() {
        
        let names = ["Володя", "Сергей", "Анатолий", "Евдаким", "Владос"]
        let surnames = ["Белый", "Иванов", "Петров", "Ротенберг", "Круглый"]
        let ages = [10, 5, 54, 12, 34, 67]
        let cities = ["Москва", "Оренбург", "Набережные Челны", "Грозный", "Анапа"]
        let statuses = ["online", "был в сети 25 минут назад"]
        let avatars = ["avatar1", "avatar2", "avatar3"]
        let phones = ["+79990005673", "+79942006573", "+3425679709"]
        let schools = ["Ле Рози, Ролл, Швейцария", "колледж Итон, Виндзор, Англия", "Технический техникум, Ульяновск, Россия"]
        
        let user = User.init(
            name: names[Int(arc4random_uniform(UInt32(names.count)))],
            surname: surnames[Int(arc4random_uniform(UInt32(surnames.count)))],
            age: ages[Int(arc4random_uniform(UInt32(ages.count)))],
            status: "",
            city: cities[Int(arc4random_uniform(UInt32(cities.count)))],
            pageStatus: statuses[Int(arc4random_uniform(UInt32(statuses.count)))],
            avatar: avatars[Int(arc4random_uniform(UInt32(avatars.count)))],
            phone: phones[Int(arc4random_uniform(UInt32(phones.count)))],
            school: schools[Int(arc4random_uniform(UInt32(schools.count)))]
        )

        let archiver = NSKeyedArchiver.archivedData(withRootObject: user)
        UserDefaults.standard.set(archiver, forKey: DataManager.userDataKey)
        UserDefaults.standard.synchronize()
    }
    
    
    /// Generate random collection of posts
    ///
    /// - Returns: return array of 20 random news posts
    func generateAndSaveRandomPosts() {
        
        let postsCount = 30
        
        let groupNames = ["Лентач", "ИНДЭ", "РГ"]
        let groupAvatars = ["groupAvatar1", "groupAvatar2"]
        let postDates = ["Вчера в 18:01", "Вчера в 20:00", "Сегодня в 9:15"]
        let postTexts = ["",
                         "iPhone XS в три раза быстрее любого Android-смартфона",
                         "Полиции не понравился Telegram на моём смартфоне. Серьёзно?",
                         "Через 19 лет производство нефти в России сильно сократится, если не исчезнет совсем, с ее 10 миллионами баррелей», — пояснил Аль Сауд. Помимо этого, саудовский принц предрек уход Китая с мирового рынка нефти примерно через пять лет.",
                         "Свыше 270 авиарейсов, запланированных на субботу, отменены в Южной Корее из-за тайфуна Конг-рей. Об этом сообщило агентство Yonhap со ссылкой на министерство государственных территорий, инфраструктуры и транспорта страны.",
                         "Последние модели iPhone имеют не только усовершенствованные камеры, но и защиту от влаги. Так что фотографировать на телефон можно даже под водой. Вот доказательство — 5 октября в Музее Москвы в рамках третьей экспозиции проекта re:Store digital art выставят снимки Зены Холлоуэй, сделанные под водой на iPhone. Фотограф известна своими подводными работами, и некоторые из них можно увидеть в этой статье. Если вы хотите повторить подводный эксперимент, вот несколько полезных советов от практикующего фотографа.",
                         "Ежемесячно в России регистрируется около 100 тысяч юридических лиц и частных предпринимателей. Но спустя первые три года остается лишь 3–4% из них. Вместо развития бизнеса предприниматели вынуждены тратить время на бюрократию. Обычный выход — нанимать для решения каждой задачи, то есть ведения бухгалтерии, документооборота и финансовой аналитики, отдельных сотрудников. Все это трудозатратно и почти всегда дорого, потому что хороший специалист скорее предпочтет работать в крупной компании с именем, а в малое предприятие пойдет только за большую зарплату. Решить эти проблемы помогают сервисы цифрового банка для бизнеса «Сфера», созданного финансовой группой БКС.",
                         "Чтобы получить доступ к услугам, нужно открыть счет в «Сфере». Это легко, бесплатно и происходит онлайн. Достаточно указать телефон и номер ОГРН, заполнить анкету — и готово. Останется только подписать документы, которые курьер доставит в любое удобное время и место. Чтобы принимать платежи от контрагентов, ждать выпуска карты не нужно: реквизиты счета будут готовы в течение 5 минут после заявки.\nТем, кто еще не зарегистрировался как ИП или не получил статус ООО, «Сфера» поможет и с этим: документы будут готовы за день, система сама отправит их в налоговую, никуда ходить и стоять в очередях не придется.\nВносить деньги на счет можно через банкоматы и терминалы «БКС Банка», «Росбанка» и «Бинбанка» — это бесплатно. Снимать деньги можно в банкоматах любых банков и переводом на личную карту «БКС Банка» — комиссия и лимит будут рассчитаны по вашему тарифу. При этом выпуск корпоративной карты и СМС-информирование у банка бесплатное."
            
        ]
        let postImageLinks = ["postImage1", "PostImage2", "postImage3", ""]
        
        let randomRange = 5000
        var posts: [Post] = []
        
        for _ in 0...postsCount {
            posts.append(Post(
                id: UUID().uuidString,
                groupName: groupNames[Int(arc4random_uniform(UInt32(groupNames.count)))],
                groupAvatar: groupAvatars[Int(arc4random_uniform(UInt32(groupAvatars.count)))],
                postDate: postDates[Int(arc4random_uniform(UInt32(postDates.count)))],
                postText: postTexts[Int(arc4random_uniform(UInt32(postTexts.count)))],
                postImageLink: postImageLinks[Int(arc4random_uniform(UInt32(postImageLinks.count)))],
                likesCount: Int(arc4random_uniform(UInt32(randomRange))),
                commentsCount: Int(arc4random_uniform(UInt32(randomRange))),
                viewsCount: Int(arc4random_uniform(UInt32(randomRange)))
            ))
        }
        
        let resultPosts = posts.filter { (post) in !(post.postImageLink == "" && post.postText == "") }
        let archiver = NSKeyedArchiver.archivedData(withRootObject: resultPosts)
        UserDefaults.standard.set(archiver, forKey: DataManager.postsDataKey)
        UserDefaults.standard.synchronize()
    }
  
    
    /// Generate random collection of posts
    ///
    /// - Returns: return array of 20 random news posts
    func generateRandomPost() -> Post {
        
        let groupNames = ["Лентач", "ИНДЭ", "РГ"]
        let groupAvatars = ["groupAvatar1", "groupAvatar2"]
        let postDates = ["Вчера в 18:01", "Вчера в 20:00", "Сегодня в 9:15"]
        let postTexts = [
                         "iPhone XS в три раза быстрее любого Android-смартфона",
                         "Полиции не понравился Telegram на моём смартфоне. Серьёзно?",
                         "Через 19 лет производство нефти в России сильно сократится, если не исчезнет совсем, с ее 10 миллионами баррелей», — пояснил Аль Сауд. Помимо этого, саудовский принц предрек уход Китая с мирового рынка нефти примерно через пять лет.",
                         "Свыше 270 авиарейсов, запланированных на субботу, отменены в Южной Корее из-за тайфуна Конг-рей. Об этом сообщило агентство Yonhap со ссылкой на министерство государственных территорий, инфраструктуры и транспорта страны.",
                         "Последние модели iPhone имеют не только усовершенствованные камеры, но и защиту от влаги. Так что фотографировать на телефон можно даже под водой. Вот доказательство — 5 октября в Музее Москвы в рамках третьей экспозиции проекта re:Store digital art выставят снимки Зены Холлоуэй, сделанные под водой на iPhone. Фотограф известна своими подводными работами, и некоторые из них можно увидеть в этой статье. Если вы хотите повторить подводный эксперимент, вот несколько полезных советов от практикующего фотографа.",
                         "Ежемесячно в России регистрируется около 100 тысяч юридических лиц и частных предпринимателей. Но спустя первые три года остается лишь 3–4% из них. Вместо развития бизнеса предприниматели вынуждены тратить время на бюрократию. Обычный выход — нанимать для решения каждой задачи, то есть ведения бухгалтерии, документооборота и финансовой аналитики, отдельных сотрудников. Все это трудозатратно и почти всегда дорого, потому что хороший специалист скорее предпочтет работать в крупной компании с именем, а в малое предприятие пойдет только за большую зарплату. Решить эти проблемы помогают сервисы цифрового банка для бизнеса «Сфера», созданного финансовой группой БКС.",
                         "Чтобы получить доступ к услугам, нужно открыть счет в «Сфере». Это легко, бесплатно и происходит онлайн. Достаточно указать телефон и номер ОГРН, заполнить анкету — и готово. Останется только подписать документы, которые курьер доставит в любое удобное время и место. Чтобы принимать платежи от контрагентов, ждать выпуска карты не нужно: реквизиты счета будут готовы в течение 5 минут после заявки.\nТем, кто еще не зарегистрировался как ИП или не получил статус ООО, «Сфера» поможет и с этим: документы будут готовы за день, система сама отправит их в налоговую, никуда ходить и стоять в очередях не придется.\nВносить деньги на счет можно через банкоматы и терминалы «БКС Банка», «Росбанка» и «Бинбанка» — это бесплатно. Снимать деньги можно в банкоматах любых банков и переводом на личную карту «БКС Банка» — комиссия и лимит будут рассчитаны по вашему тарифу. При этом выпуск корпоративной карты и СМС-информирование у банка бесплатное."
            
        ]
        let postImageLinks = ["postImage1", "PostImage2", "postImage3", ""]
        
        let randomRange = 5000
        
        return Post(
                id: UUID().uuidString,
                groupName: groupNames[Int(arc4random_uniform(UInt32(groupNames.count)))],
                groupAvatar: groupAvatars[Int(arc4random_uniform(UInt32(groupAvatars.count)))],
                postDate: postDates[Int(arc4random_uniform(UInt32(postDates.count)))],
                postText: postTexts[Int(arc4random_uniform(UInt32(postTexts.count)))],
                postImageLink: postImageLinks[Int(arc4random_uniform(UInt32(postImageLinks.count)))],
                likesCount: Int(arc4random_uniform(UInt32(randomRange))),
                commentsCount: Int(arc4random_uniform(UInt32(randomRange))),
                viewsCount: Int(arc4random_uniform(UInt32(randomRange)))
        )
        
    }

}
