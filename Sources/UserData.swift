import Foundation
import Vapor

struct UserData {
    let id: Int
    let name: String
    let note: String
}

extension UserData: JsonRepresentable {
    func makeJson() -> Json {
        return Json([
                     "id": id,
                     "name": name,
                     "note": note
                    ])
    }
}

extension UserData: StringInitializable {
    init?(from string: String) throws {
        let array = string.split(by: ",")
        if array.count != 3 {
            return nil
        }
        guard let id = Int(array[0]) else {
            return nil
        }
        self.init(id: id, name: array[1], note: array[2])
    }
}
