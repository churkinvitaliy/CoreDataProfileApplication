import UIKit

final class UserDetailsViewController: UIViewController {

    // MARK: - UI

    private lazy var buttonEdit: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "number")
        image.layer.masksToBounds = true
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.systemGray.cgColor
        image.layer.cornerRadius = 125
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Cell"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Actions

    @objc
    private func editButtonTapped() { }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonEdit)
    }

    private func setupHierarchy() {
        [buttonEdit, image, labelName].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            buttonEdit.heightAnchor.constraint(equalToConstant: 30),
            buttonEdit.widthAnchor.constraint(equalToConstant: 70),

            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 250),
            image.widthAnchor.constraint(equalToConstant: 250),

            labelName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            labelName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
