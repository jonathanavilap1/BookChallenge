import UIKit
import Firebase

class LibraryViewController: UIViewController {
   var headerInit = initializerUI()
   var headerImage: UIImageView?
   var backLabel: UIButton?
   var backButton: UIButton?
   var formView: UIView?
   var stackb1: UIButton?
   var stackb2: UIButton?
   var stackb3: UIButton?
   var hpManager = HPManager()
   //    var houseManager = HouseManager()
   var width = UIScreen.main.bounds.width
   var height = UIScreen.main.bounds.height
   var currentUserLabel: UILabel?
   var currentUser: String = ""
   var holaLabel: UILabel?
   var morePopular: UILabel?
   var stackView: UIStackView?
   var indexSection:Int?
   var tableView : UITableView?
   var dataSource: BookArray?
   var dataSource2: characterArray?
   var dataSource3: houseMode?
   var realDataSource: Int?
   var numberofsection: Int?
   let defaults = UserDefaults.standard
   
   
   
   
   var LibraryCollectionView : UICollectionView
   = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.minimumLineSpacing = 10
      
      let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collection.register(LibraryCollectionCell.self, forCellWithReuseIdentifier: "cell")
      collection.isPagingEnabled = true
      collection.translatesAutoresizingMaskIntoConstraints = false
      collection.backgroundColor = .clear
      collection.showsHorizontalScrollIndicator = true
      return collection
   }()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      uiInit()
      view.backgroundColor = .white
      
   }
   
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .darkContent
   }
   
   func uiInit(){
      
      //MARK: Header
      headerImage = headerInit.uiImageViewSetter(uiImageName: "headerimage")
      view.addSubview(headerImage!)
      headerImage?.addAnchorsAndSize(width: width, height: height/6, left: 5, top: 35, right: 5, bottom: nil)
      
      //MARK: BackButton
      backButton = UIButton()
      backButton?.setImage(UIImage(named: "backButton"), for: .normal)
      view.addSubview(backButton!)
      backButton?.addAnchorsAndSize(width: width/10, height: height/30,left: 0, top: -130, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      backButton?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
      //MARK: CurrentUserLabel
      holaLabel = headerInit.uiLabelSetter(labelString: ("Hello"), labelSize: 25, textaligment: .center, isBold: true, isHighLighted: false)
      view.addSubview(holaLabel!)
      holaLabel?.addAnchors(left: width/4, top: -25, right: width/4, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      
      
      currentUserLabel = headerInit.uiLabelSetter(labelString: (currentUser), labelSize: 25, textaligment: .center, isBold: true, isHighLighted: true)
      view.addSubview(currentUserLabel!)
      currentUserLabel?.addAnchors(left: width/8, top: -8, right: width/8, bottom: nil, withAnchor: .top, relativeToView: holaLabel)
      
      
      //MARK: back text button
      backLabel = headerInit.uiButtonSetter(uiButtonNmae: "LogOut", textAligments: .left, cornerRadius: 0, isBackgroundClear: true, isUnderlined: false)
      view.addSubview(backLabel!)
      backLabel?.addAnchors(left: nil, top: -133, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      backLabel?.addAnchors(left: -13, top: nil,      right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
      backLabel?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
      
      morePopular = headerInit.uiLabelSetter(labelString: ("Most Popular"), labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
      view.addSubview(morePopular!)
      morePopular?.addAnchors(left: width/4, top:40, right: width/4, bottom: nil, withAnchor: .top, relativeToView: headerImage)
      // MARK: CollectionView Carrousell
      LibraryCollectionView.delegate = self
      LibraryCollectionView.dataSource = self
      view.addSubview(LibraryCollectionView)
      LibraryCollectionView.scrollToItem(at:IndexPath(item: 4, section: 1), at: .right, animated: true)
      LibraryCollectionView.addAnchorsAndSize(width: (width/4)*3, height: (height/4)*1, left: 0, top: 4, right: 0, bottom: nil, withAnchor: .top, relativeToView: morePopular)
      
      
      
      
      //MARK: STACKVIEW
      
      stackb1 = headerInit.uiButtonSetter(uiButtonNmae: "           Books", textAligments: .right, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
      stackb1?.addTarget(self, action: #selector(stackb1Action), for: .touchUpInside)
      stackb1?.setTitleColor(.white, for: .normal)
      
      stackb2 = headerInit.uiButtonSetter(uiButtonNmae: "Characters     ", textAligments: .left, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
      stackb2?.addTarget(self, action: #selector(stackb2Action), for: .touchUpInside)
      stackb2?.setTitleColor(.white, for: .normal)
      
      stackView = headerInit.stackViewSetter()
      stackView?.addArrangedSubview(stackb1!)
      
      let separator1 = UIView()
      separator1.widthAnchor.constraint(equalToConstant: 1).isActive = true
      separator1.backgroundColor = .white
      stackView?.addArrangedSubview(separator1)
      separator1.heightAnchor.constraint(equalTo: stackView!.heightAnchor, multiplier: 0.6).isActive = true
      
      stackView?.addArrangedSubview(stackb2!)
      
      
      view.addSubview(stackView!)
      stackView?.addAnchors(left: 20, top: 4, right: 20, bottom: nil, withAnchor: .top, relativeToView: LibraryCollectionView)
      
      // tableView
      tableView = UITableView()
      tableView?.backgroundColor = .clear
      tableView?.delegate = self
      tableView?.dataSource = self
      
      view.addSubview(tableView!)
      tableView?.addAnchorsAndSize(width: nil, height: nil, left: 20, top: 10, right: 20, bottom: 20, withAnchor: .top, relativeToView: stackView)
      numberofsection = dataSource?.bookArray.count
   }
   
   
}

extension LibraryViewController: UITableViewDataSource,UITableViewDelegate{
   
   // tableview config
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
      return numberofsection ?? 0
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell: UIView?
      switch realDataSource {
      case 1:
         let libro = dataSource?.bookArray[indexPath.row]
         cell = CategoriasCell(libro: libro!)
      case 2:
         let libro = dataSource2?.chArray[indexPath.row]
         cell = charactersCell(libro: libro!)
         
      default:
         let libro = dataSource?.bookArray[indexPath.row]
         cell = CategoriasCell(libro: libro!)
         
         
      }
      
      return cell! as! UITableViewCell
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return height / 5
   }
   // tablewviewdelegate
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let view = UIView()
      switch realDataSource {
      case 1:
         let header = headerInit.uiLabelSetter(labelString: "Recent Added", labelSize: 15, textaligment: .left, isBold: true, isHighLighted: true)
         header.backgroundColor = .white
         view.addSubview(header)
         header.addAnchors(left: 0, top: 0, right: nil, bottom: nil)
      case 2:
         print("case2")
         
      default:
         
         let header = headerInit.uiLabelSetter(labelString: "Recent Added", labelSize: 15, textaligment: .left, isBold: true, isHighLighted: true)
         header.backgroundColor = .white
         view.addSubview(header)
         header.addAnchors(left: 0, top: 0, right: nil, bottom: nil)
         
         
      }
      
      return view
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
      switch realDataSource {
      case 1:
         let libro = dataSource?.bookArray[indexPath.section]
         let vc = BookViewController()
         vc.libro = libro
         vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true, completion: nil)
      case 2:
         print("case2")
      case 3:
         print("case3")
         
      default:
         let libro = dataSource?.bookArray[indexPath.section]
         let vc = BookViewController()
         vc.libro = libro
         vc.modalPresentationStyle = .fullScreen
         present(vc, animated: true, completion: nil)
         
         
      }
      
      
   }
   
   
}


extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   // Collection View Config
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      indexSection = dataSource?.bookArray.count ?? 0
      
      return indexSection!
   }
   
   func numberOfSections(in collectionView: UICollectionView) -> Int {
      return dataSource?.bookArray.count ?? 0
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = LibraryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LibraryCollectionCell
      
      let libro = dataSource?.bookArray[indexPath.row]
      
      
      cell.setData(libro: libro!)
      
      return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: width / 2 - 40, height: height / 4)
   }
   
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
      let libro = dataSource?.bookArray[indexPath.row]
      let vc = BookViewController()
      vc.libro = libro
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true, completion: nil)
      
   }
   
   
}


extension LibraryViewController{
   
   //objc functions
   @objc func stackb1Action (){
      
      numberofsection = dataSource?.bookArray.count
      realDataSource = 1
      self.tableView?.reloadData()
   }
   
   @objc func stackb2Action (){
      numberofsection = dataSource2?.chArray.count
      realDataSource = 2
      self.tableView?.reloadData()
      
   }
   
   @objc func stackb3Action (){
      numberofsection = dataSource2?.chArray.count
      realDataSource = 3
      self.tableView?.reloadData()
   }
   @objc  func dismissView(){
      
      self.dismiss(animated: true, completion: {
         let loginVC = ViewController()
         self.defaults.removeObject(forKey: "loggedin")
         
         let firebaseAuth = Auth.auth()
         do {
            try firebaseAuth.signOut()
         } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
         }
         loginVC.viewDidLoad()
         
      })
      
      
   }
}
