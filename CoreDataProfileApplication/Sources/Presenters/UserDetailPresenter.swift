import Foundation
import CoreData

protocol UserDetailViewProtocol: AnyObject {
    func showUserInfo(user: User)
}

protocol UserDetailPresenterProtocol: AnyObject {
    var user: User? { get set }
    func getUserInfo()
    func updateUser(name: String, surname: String)
}

final class UserDetailPresenter: UserDetailPresenterProtocol {

    var user: User?
    weak var view: UserDetailViewProtocol?
    private let coreDataManager: CoreDataManager

    init(view: UserDetailViewProtocol, coreDataManager: CoreDataManager) {
        self.view = view
        self.coreDataManager = coreDataManager
    }

    func getUserInfo() {
        guard let user = user else {
            return
        }
        view?.showUserInfo(user: user)
    }

    func updateUser(name: String, surname: String) {
        guard let user = user else {
            return
        }
        coreDataManager.updateUser(user: user, name: name, surname: surname)
    }
}
