import UIKit

final class UserDetailsViewController: UIViewController {

    // MARK: - Properties

    private var isEditingProfile = false

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

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var textFieldName: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.indent(size: 20)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldSurname: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.indent(size: 20)
        textField.isUserInteractionEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var buttonSaved: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Actions

    @objc
    private func editButtonTapped() { 
        if isEditingProfile {
            buttonEdit.setTitle("Back", for: .normal)
            updateEditingUI(isEditing: true)
        } else {
            buttonEdit.setTitle("Edit", for: .normal)
            updateEditingUI(isEditing: false)
        }
    }

    @objc
    private func saveButtonTapped() {
        updateEditingUI(isEditing: false)
        if isEditingProfile {
            buttonEdit.setTitle("Edit", for: .normal)
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        updateEditingUI(isEditing: false)
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonEdit)
    }

    private func setupHierarchy() {
        [buttonEdit, label, textFieldName, textFieldSurname, buttonSaved]
            .forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            buttonEdit.heightAnchor.constraint(equalToConstant: 30),
            buttonEdit.widthAnchor.constraint(equalToConstant: 70),

            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            textFieldName.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textFieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldName.heightAnchor.constraint(equalToConstant: 52),

            textFieldSurname.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            textFieldSurname.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldSurname.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldSurname.heightAnchor.constraint(equalToConstant: 52),

            buttonSaved.topAnchor.constraint(equalTo: textFieldSurname.bottomAnchor, constant: 50),
            buttonSaved.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonSaved.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonSaved.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

    // MARK: - Func

    private func updateEditingUI(isEditing: Bool) {
        isEditingProfile = !isEditing
        buttonSaved.isHidden = !isEditing
        textFieldName.isUserInteractionEnabled = isEditing
        textFieldSurname.isUserInteractionEnabled = isEditing
    }
}
