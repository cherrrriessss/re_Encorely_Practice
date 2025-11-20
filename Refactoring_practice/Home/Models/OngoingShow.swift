

struct OngoingShow: Identifiable, Equatable {
    
    let id: Int
    let imageUrl: String
    let showName: String
    let hallId: Int?
    let hallName: String
    let startDate: String
    let endDate: String
}
