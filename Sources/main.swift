import Foundation
import Vapor

let app = Application()

app.get("greetings", String.self) { request, username in
    return Json(["greeting": username])
}

app.get("users", UserData.self) { request, user in
    return user.makeJson()
}

app.start(port: 8080)
