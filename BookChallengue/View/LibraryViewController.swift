import UIKit


class LibraryViewController: UIViewController {
    var headerInit = initializerUI()
    var headerImage: UIImageView?
    var backLabel: UIButton?
    var backButton: UIButton?
    var formView: UIView?
    var stackb1: UIButton?
    var stackb2: UIButton?
    var stackb3: UIButton?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var userController = userDB()
    var currentUserLabel: UILabel?
    var currentUser: nuevoUsuario?
    var holaLabel: UILabel?
    var morePopular: UILabel?
    var dataSource: LibraryDB?
    var stackView: UIStackView?
    var indexSection:Int?
    var tableView : UITableView?
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
         currentUser = userController.currentUserGetter()
        dataSource = LibraryDB()
        uiInit()
        
        view.backgroundColor = .white
       
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
        holaLabel = headerInit.uiLabelSetter(labelString: ("Hola"), labelSize: 25, textaligment: .center, isBold: true, isHighLighted: false)
        view.addSubview(holaLabel!)
        holaLabel?.addAnchors(left: nil, top: -45, right: 30, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        
        
        currentUserLabel = headerInit.uiLabelSetter(labelString: (currentUser?.usuario)!, labelSize: 30, textaligment: .center, isBold: true, isHighLighted: true)
        view.addSubview(currentUserLabel!)
        currentUserLabel?.addAnchors(left: nil, top:-5, right: 10, bottom: nil, withAnchor: .top, relativeToView: holaLabel)
        
        
        //MARK: back text button
        backLabel = headerInit.uiButtonSetter(uiButtonNmae: "Back", textAligments: .left, cornerRadius: 0, isBackgroundClear: true, isUnderlined: false)
        view.addSubview(backLabel!)
        backLabel?.addAnchors(left: nil, top: -33, right: nil, bottom: nil, withAnchor: .top, relativeToView: headerImage)
        backLabel?.addAnchors(left: -7, top: nil,      right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
        backLabel?.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    
        morePopular = headerInit.uiLabelSetter(labelString: ("Most Popular"), labelSize: 20, textaligment: .center, isBold: true, isHighLighted: false)
        view.addSubview(morePopular!)
        morePopular?.addAnchors(left: width/4, top:45, right: width/4, bottom: nil, withAnchor: .top, relativeToView: headerImage)
    //MARK: CollectionView Carrousell
        LibraryCollectionView.delegate = self
        LibraryCollectionView.dataSource = self
        view.addSubview(LibraryCollectionView)
        LibraryCollectionView.addAnchorsAndSize(width: (width/4)*3, height: (height/4)*1, left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: morePopular)
        LibraryCollectionView.scrollToItem(at:IndexPath(item: indexSection ?? 0, section: 0), at: .right, animated: false)
        LibraryCollectionView.reloadData()
        
    //MARK: STACKVIEW
        
        stackb1 = headerInit.uiButtonSetter(uiButtonNmae: "Libro", textAligments: .center, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
        stackb1?.addTarget(self, action: #selector(stackb1Action), for: .touchUpInside)
        stackb1?.setTitleColor(.white, for: .normal)
        
        stackb2 = headerInit.uiButtonSetter(uiButtonNmae: "Categorias", textAligments: .center, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
        stackb2?.addTarget(self, action: #selector(stackb2Action), for: .touchUpInside)
        stackb2?.setTitleColor(.white, for: .normal)
        
        stackb3 = headerInit.uiButtonSetter(uiButtonNmae: "Autores", textAligments: .center, cornerRadius: 0.10, isBackgroundClear: true, isUnderlined: false)
        stackb3?.addTarget(self, action: #selector(stackb3Action), for: .touchUpInside)
        stackb3?.setTitleColor(.white, for: .normal)
        //stackview
        stackView = headerInit.stackViewSetter()
        stackView?.addArrangedSubview(stackb1!)
        
        let separator1 = UIView()
        separator1.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator1.backgroundColor = .black
        stackView?.addArrangedSubview(separator1)
        separator1.heightAnchor.constraint(equalTo: stackView!.heightAnchor, multiplier: 0.6).isActive = true
        
        stackView?.addArrangedSubview(stackb2!)
        let separator2 = UIView()
        separator2.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator2.backgroundColor = .black
        stackView?.addArrangedSubview(separator2)
        separator2.heightAnchor.constraint(equalTo: stackView!.heightAnchor, multiplier: 0.6).isActive = true
        
        stackView?.addArrangedSubview(stackb3!)

        
        view.addSubview(stackView!)
        stackView?.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: LibraryCollectionView)
        
        tableView = UITableView()
        tableView?.backgroundColor = .gray
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
        
    }
}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.libreria?.categorias?[section].libro?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = dataSource?.libreria?.categorias?[indexPath.?[indexPath.row]
        let cell = MenuTableViewCell(producto: product!)
        return cell
    }
    

    
    
    @objc  func dismissView(){
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        indexSection = dataSource?.libreria?.categorias?[section].libro?.count
        
        return dataSource?.libreria?.categorias?[section].libro?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (dataSource?.libreria?.categorias?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LibraryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LibraryCollectionCell
        
        let libro = dataSource?.libreria?.categorias?[indexPath.section].libro?[indexPath.item]


       cell.setData(libro: libro!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: width / 2 - 40, height: height / 4)
      //  return ((indexPath.item % 2) != 0) ? CGSize(width: width / 2 - 40, height: height / 4) : CGSize(width: width / 2 - 40, height: height / 5)
    }
    
    @objc func stackb1Action (){
        print("me toco boton1")
    }
    
    @objc func stackb2Action (){
        print("me toco boton2")
    }
    
    @objc func stackb3Action (){
        print("me toco boton3")
    }
     
}
    
   