import Foundation

// MARK: - Model Definitions
struct MealResponse: Decodable {
    let mealServiceDietInfo: [MealInfo]
}

struct MealInfo: Decodable {
    let row: [MealRow]?
}

struct MealRow: Decodable {
    let DDISH_NM: String
    let CAL_INFO: String
}

extension MealResponse {
    func toEntity() -> (
        breakfast: String,
        lunch: String,
        dinner: String
    ) {
        guard let row = mealServiceDietInfo.last?.row
        else { return ("", "", "")}
        let breakfast = row[0].DDISH_NM.replacingOccurrences(of: "<br/>", with: "\n")

        let lunch = row[1].DDISH_NM.replacingOccurrences(of: "<br/>", with: "\n")

        let dinner = row[2].DDISH_NM.replacingOccurrences(of: "<br/>", with: "\n")

        return (breakfast, lunch, dinner)
    }

    func toCal() -> (
        breakfast: String,
        lunch: String,
        dinner: String
    ) {
        guard let row = mealServiceDietInfo.last?.row
        else { return ("", "", "")}
        let breakfast = row[0].CAL_INFO

        let lunch = row[1].CAL_INFO

        let dinner = row[2].CAL_INFO

        return (breakfast, lunch, dinner)
    }
}
