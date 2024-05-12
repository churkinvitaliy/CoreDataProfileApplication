import UIKit

final class ModuleBuilder {
    static func createUserListViewController() -> UIViewController {
        let view = UserListViewController()
        let coreDataManager = CoreDataManager()
        let presenter = UserListPresenter(view: view, coreDataManager: coreDataManager)
        view.presenter = presenter
        return view
    }

    static func createUserDetailViewController(user: User) -> UIViewController {
        let view = UserDetailsViewController()
        let coreDataManager = CoreDataManager()
        let presenter = UserDetailPresenter(view: view, coreDataManager: coreDataManager)
        view.presenter = presenter
        presenter.user = user
        return view
    }
}
