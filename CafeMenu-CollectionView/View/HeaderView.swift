import UIKit

class HeaderView: UICollectionReusableView {
    
    static let identifier = "ProductHeader"
    
    var headerName: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: headerName)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 14, range: NSRange(location: 0, length: attributedString.length))
            headerLabel.attributedText = attributedString
        }
    }
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   private var bottomLineView: UIView = {
       let line = UIView()
       line.backgroundColor = UIColor(named:"Navy")
       line.translatesAutoresizingMaskIntoConstraints = false
       return line
   }()
    private let emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:"Cream")
        return view
    }()
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
         self.backgroundColor = UIColor(named:"Cream")
         self.addSubview(headerLabel)
         self.addSubview(bottomLineView)
         
     }
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            headerLabel.bottomAnchor.constraint(equalTo: bottomLineView.topAnchor, constant: -12),

            bottomLineView.leadingAnchor.constraint(equalTo: headerLabel.leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: 1),
            bottomLineView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

