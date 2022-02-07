import UIKit


class BookViewController: UIViewController {
    var headerInit = initializerUI()
    var headerImage: UIImageView?
    var backLabel: UIButton?
    var backButton: UIButton?
    var formView: UIView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var viewBook: UIView?
    var viewBook1: UIView?
    var viewBook2: UIView?
    var viewBook3: UIView?
    var libro : setNewLibro?
    var imageLibro: UIImageView?
    var tituloLibro: UILabel?
    var autorLibro: UILabel?
    var labelwithtext: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiInit()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func uiInit(){
        
        //MARK: Header
        headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage2")
        view.addSubview(headerImage!)
        headerImage?.addAnchorsAndSize(width: width, height: height/8, left: 0, top: 31, right: 0, bottom: height/0.2)
        
        //MARK: BackButton
        backButton = UIButton()
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        view.addSubview(backButton!)
        backButton?.addAnchorsAndSize(width: width/10, height: height/30,left: 7, top: -30, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        backButton?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        //MARK: CurrentUserLabel
        
        
        
        //MARK: back text button
        backLabel = headerInit.uiButtonSetter(uiButtonNmae: "Back", textAligments: .left, cornerRadius: 0, isBackgroundClear: true, isUnderlined: false)
       view.addSubview(backLabel!)
        backLabel?.addAnchors(left: nil, top: -33, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        backLabel?.addAnchors(left: -7, top: nil,      right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
        backLabel?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        viewBook = headerInit.uiViewSetter()
       view.addSubview(viewBook!)
        viewBook?.backgroundColor = .clear
        viewBook?.layer.borderWidth = 0
        viewBook?.addAnchorsAndSize(width: nil, height: (height/6)+20, left: 20, top: 150, right: 20, bottom: nil)
        
        viewBook1 = headerInit.uiViewSetter()
        viewBook?.addSubview(viewBook1!)
        viewBook1?.addAnchorsAndSize(width: nil, height: 50, left: 0, top: 50, right: 0, bottom: 0)
        
        imageLibro = headerInit.uiImageViewSetter(uiImageName: (libro?.image)!)
        imageLibro?.layer.cornerRadius = 10
        //  imageProduct?.contentMode = .scaleAspectFit
        imageLibro?.layer.masksToBounds = true
        viewBook?.addSubview(imageLibro!)
        imageLibro?.addAnchorsAndSize(width: width/4, height: nil, left: 20, top: 0, right: nil, bottom: 10)
        
        let tituloLabel = headerInit.uiLabelSetter(labelString: "Tittle", labelSize: 15, textaligment: .center, isBold: true, isHighLighted: true)
        viewBook1?.addSubview(tituloLabel)
        tituloLabel.addAnchors(left: 5, top: 5, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        
        tituloLibro = headerInit.uiLabelSetter(labelString: (libro?.titulo)!, labelSize: 13, textaligment: .center, isBold: false, isHighLighted: false)
        tituloLibro?.numberOfLines = 0
        viewBook1?.addSubview(tituloLibro!)
        
        tituloLibro?.addAnchors(left: 10, top: nil, right: 55, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        tituloLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLabel)
        
        let byAutor = headerInit.uiLabelSetter(labelString: "by Autor", labelSize: 12, textaligment: .center, isBold: true, isHighLighted: true)
        viewBook1?.addSubview(byAutor)
        byAutor.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        byAutor.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLibro)
        
        autorLibro = headerInit.uiLabelSetter(labelString: (libro?.autor)!, labelSize: 11, textaligment: .center, isBold: false, isHighLighted: false)
        autorLibro?.numberOfLines = 0
        viewBook1?.addSubview(autorLibro!)
        
        autorLibro?.addAnchors(left: 10, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
        autorLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: byAutor)
        
        
        viewBook2 = headerInit.uiViewSetter()
       view.addSubview(viewBook2!)
        viewBook2?.addAnchorsAndSize(width: nil, height: (height/6)+100, left: 20, top: 30, right: 20, bottom: nil,withAnchor: .top,relativeToView: viewBook)
        //stackView
        let stackb1 = headerInit.uiButtonSetter(uiButtonNmae: "Libro", textAligments: .right, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
        stackb1.addTarget(self, action: #selector(stackb1Action), for: .touchUpInside)
        stackb1.setTitleColor(headerInit.textColor, for: .normal)
        
        let stackb2 = headerInit.uiButtonSetter(uiButtonNmae: "Categorias", textAligments: .center, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
        stackb2.addTarget(self, action: #selector(stackb2Action), for: .touchUpInside)
        stackb2.setTitleColor(headerInit.textColor, for: .normal)
        
        let stackView = headerInit.stackViewSetter()
        stackView.backgroundColor = .clear
        stackView.addArrangedSubview(stackb1)
        
        let separator1 = UIView()
        separator1.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator1.backgroundColor = headerInit.backgroundButtoncolor
        stackView.addArrangedSubview(separator1)
        separator1.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.7).isActive = true
        stackView.addArrangedSubview(stackb2)
        
        viewBook2!.addSubview(stackView)
        stackView.addAnchors(left: 20, top: 10, right: 20, bottom: nil)
        
        labelwithtext = headerInit.uiLabelSetter(labelString: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
        labelwithtext?.numberOfLines = 0
        labelwithtext?.textAlignment = .justified
        viewBook2?.addSubview(labelwithtext!)
        labelwithtext!.addAnchors(left: 15, top: 0, right: 15, bottom: 5, withAnchor: .top, relativeToView: stackView)
        
        viewBook3 = headerInit.uiViewSetter()
       view.addSubview(viewBook3!)
        viewBook3?.addAnchorsAndSize(width: nil, height: (height/6)+100, left: 20, top: 30, right: 20, bottom: nil,withAnchor: .top,relativeToView: viewBook2)
        let autorimage = headerInit.uiImageViewSetter(uiImageName: "login")
        viewBook3?.addSubview(autorimage)
        autorimage.addAnchorsAndSize(width: 100, height: 100, left: 10, top: 10, right: nil, bottom: nil)
        
        let aboutAutor = headerInit.uiLabelSetter(labelString: "About the Autor", labelSize: 13, textaligment: .left, isBold: true, isHighLighted: true)
        viewBook3!.addSubview(aboutAutor)
        aboutAutor.addAnchors(left: 20, top: 30, right: nil, bottom: nil, withAnchor: .left, relativeToView: autorimage)
        
        let autorName = headerInit.uiLabelSetter(labelString: (libro?.autor)!, labelSize: 20, textaligment: .left, isBold: false, isHighLighted: false)
        viewBook3!.addSubview(autorName)
        autorName.addAnchors(left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: aboutAutor)
        autorName.addAnchors(left: 20, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: autorimage)
        
        let labelautor = headerInit.uiLabelSetter(labelString: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
        labelautor.numberOfLines = 0
        labelautor.textAlignment = .justified
        viewBook3?.addSubview(labelautor)
        labelautor.addAnchors(left: 15, top: 20, right: 15, bottom: 5, withAnchor: .top, relativeToView: autorName)
        
    }
}

extension BookViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @objc  func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc  func stackb1Action(){
        
        labelwithtext?.text = "Description text Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
    }
    
    @objc  func stackb2Action(){
        
        labelwithtext?.text = "Detalles text Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
    }
        
        
        
    }
