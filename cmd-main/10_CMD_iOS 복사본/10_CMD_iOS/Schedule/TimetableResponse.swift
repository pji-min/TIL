import Foundation

// MARK: - Welcome
struct TimetableResponse: Decodable {
    let hisTimetable: [HisTimetable]
}

// MARK: - HisTimetable
struct HisTimetable: Decodable {
    let row: [Row]?
}
// MARK: - Row
struct Row: Codable {
    let perio, itrtCntnt: String

    enum CodingKeys: String, CodingKey {
        case perio = "PERIO"
        case itrtCntnt = "ITRT_CNTNT"
    }
}

extension TimetableResponse {
    func toEntity() -> [(String, String)] {
        guard let row = hisTimetable.last?.row else { return [] }
        return row.map { ($0.perio, $0.itrtCntnt) }
    }
}
