import UIKit

final class ModuleBuilder {
    static func createUserListViewController() -> UIViewController {
        let view = UserListViewController()
        let coreDataManager = CoreDataManager()
        let presenter = UserListPresenter(view: view, coreDataManager: coreDataManager)
        view.presenter = presenter
        return view
    }
}
