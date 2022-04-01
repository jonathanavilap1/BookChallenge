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
   var libro : BookModel?
   var imageLibro: UIImageView?
   var tituloLibro: UILabel?
   var autorLibro: UIButton?
   var labelwithtext: UILabel?
   var previewButton: UIButton?
   
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
      
      imageLibro = UIImageView(image: UIImage(data: (libro?.imageWithData)!))
      imageLibro?.layer.cornerRadius = 10
      //  imageProduct?.contentMode = .scaleAspectFit
      imageLibro?.layer.masksToBounds = true
      viewBook?.addSubview(imageLibro!)
      imageLibro?.addAnchorsAndSize(width: width/4, height: nil, left: 20, top: 0, right: nil, bottom: 10)
      
      let tituloLabel = headerInit.uiLabelSetter(labelString: "Tittle", labelSize: 15, textaligment: .center, isBold: true, isHighLighted: true)
      viewBook1?.addSubview(tituloLabel)
      tituloLabel.addAnchors(left: 5, top: 5, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
      
      tituloLibro = headerInit.uiLabelSetter(labelString: (libro?.title)!, labelSize: 13, textaligment: .center, isBold: false, isHighLighted: false)
      tituloLibro?.numberOfLines = 0
      viewBook1?.addSubview(tituloLibro!)
      
      tituloLibro?.addAnchors(left: 10, top: nil, right: 55, bottom: 50, withAnchor: .left, relativeToView: imageLibro)
      tituloLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLabel)
      
      let byAutor = headerInit.uiLabelSetter(labelString: "by Autor", labelSize: 12, textaligment: .center, isBold: true, isHighLighted: true)
      viewBook1?.addSubview(byAutor)
      byAutor.addAnchors(left: 5, top: nil, right: 40, bottom: nil, withAnchor: .left, relativeToView: imageLibro)
      byAutor.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: tituloLibro)
      
      autorLibro = headerInit.uiButtonSetter(uiButtonNmae: (libro?.authors?[0]) ?? "J.K. Rolling", textAligments: .center, cornerRadius: 0, isBackgroundClear: true, isUnderlined: true)
      viewBook1?.addSubview(autorLibro!)
      autorLibro?.addTarget(self, action: #selector(stackb2Action), for: .touchUpInside)
      
      
      autorLibro?.addAnchors(left: 10, top: nil, right: 40, bottom: 7, withAnchor: .left, relativeToView: imageLibro)
      autorLibro?.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: byAutor)
      
      
      viewBook2 = headerInit.uiViewSetter()
      view.addSubview(viewBook2!)
      viewBook2?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 30, right: 20, bottom: 30,withAnchor: .top,relativeToView: viewBook)
      
      let description = headerInit.uiLabelSetter(labelString: "Book Description", labelSize: 20, textaligment: .center, isBold: true, isHighLighted: true)
      viewBook2?.addSubview(description)
      description.addAnchors(left: 40, top: 20, right: 40, bottom: nil)
      
      // PreviewButton
      
      
      
      //tex
      labelwithtext = headerInit.uiLabelSetter(labelString: libro?.description ?? "", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      labelwithtext?.numberOfLines = 0
      labelwithtext?.textAlignment = .justified
      viewBook2?.addSubview(labelwithtext!)
      labelwithtext?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 20, right: 20, bottom: 100, withAnchor: .top, relativeToView: description)
      
      previewButton = headerInit.uiButtonSetter(uiButtonNmae: "Click to read a preview of the book", textAligments: .center, cornerRadius: 0, isBackgroundClear: false, isUnderlined: false)
      view.addSubview(previewButton!)
      previewButton?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: labelwithtext)
      previewButton?.addTarget(self, action: #selector(stackb1Action), for: .touchUpInside)
      
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
      if let url = URL(string: (libro?.previewLink)!) {
         UIApplication.shared.open(url)
      }
   }
   
   @objc  func stackb2Action(){
      
      let vc = author()
      vc.libro = libro
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true, completion: nil)
      
   }
   
   
   
}
