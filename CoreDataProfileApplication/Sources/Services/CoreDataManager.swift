import Foundation
import CoreData

typealias EmptyClosure = () -> ()

final class CoreDataManager {
    let container: NSPersistentContainer
    var savedEntities = [User]()
    var onChanged: EmptyClosure?

    init() {
        container = NSPersistentContainer(name: "UserModel")
        container.loadPersistentStores { description, error in
            if error != nil {
                print("Не возможно загрузить базу данных. Ошибка: \(String(describing: error?.localizedDescription))")
            }
        }
        fetchUsers()
    }

    func fetchUsers() {
        let request = NSFetchRequest<User>(entityName: "User")

        do {
            savedEntities = try container.viewContext.fetch(request)
            onChanged?()
        } catch let error {
            print("Не удалось получить данныз из базы данных! Ошибка: \(error.localizedDescription))")
        }
    }

    func addUser(name: String, surname: String) {
        let newUser = User(context: container.viewContext)
        newUser.name = name
        newUser.surname = surname
        saveData()
    }

    func updateUser(user: User, name: String, surname: String) {
        user.name = name
        user.surname = surname
        saveData()
    }

    func deleteUser(user: User) {
        container.viewContext.delete(user)
        saveData()
    }

    func saveData() {
        do {
            try container.viewContext.save()
            fetchUsers()
        } catch let error {
            print("Не удается сохранить данные! Ошибка: \(error.localizedDescription)")
        }
    }
}
