import UIKit


class author: UIViewController {
   var headerInit = initializerUI()
   var headerImage: UIImageView?
   var backLabel: UIButton?
   var backButton: UIButton?
   var formView: UIView?
   var width = UIScreen.main.bounds.width
   var height = UIScreen.main.bounds.height
   var viewBook: UIView?
   var viewBook1: UIView?
   var libro : BookModel?
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
      // first layer
      viewBook = headerInit.uiViewSetter()
      view.addSubview(viewBook!)
      viewBook?.backgroundColor = .clear
      viewBook?.layer.borderWidth = 0
      viewBook?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 150, right: 20, bottom: 30)
      
      viewBook1 = headerInit.uiViewSetter()
      viewBook?.addSubview(viewBook1!)
      viewBook1?.addAnchorsAndSize(width: nil, height: 50, left: 0, top: 50, right: 0, bottom: 0)
      
      let autorimage = headerInit.uiImageViewSetter(uiImageName: "JK")
      autorimage.layer.cornerRadius = 10
      //  imageProduct?.contentMode = .scaleAspectFit
      autorimage.layer.masksToBounds = true
      viewBook?.addSubview(autorimage)
      autorimage.addAnchorsAndSize(width: nil, height: 180, left: 60 , top: -10, right: 60, bottom: nil)
      
      let aboutAutor = headerInit.uiLabelSetter(labelString: "About the Autor", labelSize: 17, textaligment: .center, isBold: true, isHighLighted: true)
      viewBook1!.addSubview(aboutAutor)
      aboutAutor.addAnchors(left: 20, top: 30, right: 20, bottom: nil, withAnchor: .top, relativeToView: autorimage)
      
      let autorName = headerInit.uiLabelSetter(labelString: (libro?.authors![0])!, labelSize: 20, textaligment: .center, isBold: false, isHighLighted: false)
      viewBook1!.addSubview(autorName)
      autorName.addAnchors(left: 20, top: 20, right: 20, bottom: nil, withAnchor: .top, relativeToView: aboutAutor)
      
      
      let labelautor = headerInit.uiLabelSetter(labelString: "J. K. Rowling, is a British author, philanthropist, film producer, and screenwriter. She is the author of the Harry Potter series, which has won multiple awards and sold more than 500 million copies as of 2018,[2] and in 2008 became the best-selling book children's series in history.[3] The books are the basis of a popular film series. She also writes crime fiction under the pen name Robert Galbraith. /nBorn in Yate, Gloucestershire, Rowling was working as a researcher and bilingual secretary for Amnesty International in 1990 when she conceived the idea for the Harry Potter series while on a delayed train from Manchester to London. The seven-year period that followed saw the death of her mother, birth of her first child, divorce from her first husband, and relative poverty until the first novel in the series, Harry Potter and the Philosopher's Stone, was published in 1997. There were six sequels, of which the last was released in 2007.", labelSize: 15, textaligment: .center, isBold: false, isHighLighted: false)
      labelautor.numberOfLines = 0
      labelautor.textAlignment = .justified
      viewBook1?.addSubview(labelautor)
      labelautor.addAnchors(left: 15, top: 20, right: 15, bottom: 5, withAnchor: .top, relativeToView: autorName)
      //        
   }
}

extension author{
   
   @objc  func dismissView(){
      dismiss(animated: true, completion: nil)
   }
   
   
   
}
