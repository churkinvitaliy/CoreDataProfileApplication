import Foundation
import CoreData

protocol UserListViewProtocol: AnyObject {
    func reloadData()
}

protocol UserListPresenterProtocol: AnyObject {
    var numbersOfUsers: Int { get }
    func getUser(at index: Int) -> User?
    func setupUserList()
    func addUser(name: String, surname: String)
    func deleteUser(at index: Int)
}

class UserListPresenter: UserListPresenterProtocol {

    weak var view: UserListViewProtocol?
    private let coreDataManager: CoreDataManager

    init(view: UserListViewProtocol, coreDataManager: CoreDataManager) {
        self.view = view
        self.coreDataManager = coreDataManager
    }

    var numbersOfUsers: Int {
        return coreDataManager.savedEntities.count
    }

    func getUser(at index: Int) -> User? {
        guard index >= 0 && index < coreDataManager.savedEntities.count else {
            return nil
        }
        return coreDataManager.savedEntities[index]
    }

    func setupUserList() {
        coreDataManager.onChanged = { [weak self] in
            self?.view?.reloadData()
        }
        coreDataManager.fetchUsers()
    }

    func addUser(name: String, surname: String) {
        coreDataManager.addUser(name: name, surname: surname)
    }

    func deleteUser(at index: Int) {
        guard let user = getUser(at: index) else {
            return
        }
        coreDataManager.deleteUser(user: user)
    }
}
