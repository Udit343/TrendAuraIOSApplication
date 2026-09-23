//  UserProfileViewController.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 05/08/26.


import UIKit

class UserProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var backgroundImageView : UIImageView!
    @IBOutlet weak var  backgroundHeaderView : UIImageView!
    @IBOutlet weak var  bellButton : UIButton!
    @IBOutlet weak var  settingButton : UIButton!
    @IBOutlet weak var  mediaStackView : UIStackView!
    @IBOutlet weak var  nameView : UIView!
    @IBOutlet weak var  nameLabel : UILabel!
    @IBOutlet weak var  nameImage : UIImageView!
    @IBOutlet weak var  subNameLabel : UILabel!
    @IBOutlet weak var  titleView : UIView!
    @IBOutlet weak var  likesView : UIView!
    @IBOutlet weak var  likesCountLabel : UILabel!
    @IBOutlet weak var  likeLabel : UILabel!
    @IBOutlet weak var  cartView : UIView!
    @IBOutlet weak var  cartCount : UILabel!
    @IBOutlet weak var  cartLabel : UILabel!
    @IBOutlet weak var  followerView : UIView!
    @IBOutlet weak var  followersCount : UILabel!
    @IBOutlet weak var  FollowLabel : UILabel!
    @IBOutlet weak var  followingView : UIView!
    @IBOutlet weak var  followingCount : UILabel!
    @IBOutlet weak var  followingLabel : UILabel!
    @IBOutlet weak var  descriptionLabel : UILabel!
    @IBOutlet weak var  mycartOuterView : UIView!
    @IBOutlet weak var  mycartInnerView : UIView!
    @IBOutlet weak var  mycartLabel : UILabel!
    @IBOutlet weak var  mycartImage : UIImageView!
    @IBOutlet weak var  myStoreOuterView : UIView!
    @IBOutlet weak var  myStoteInnerView : UIView!
    @IBOutlet weak var  myStoreImageView : UIImageView!
    @IBOutlet weak var  myStoreLabel : UILabel!
    @IBOutlet weak var  verticalLine1 : UIView!
    @IBOutlet weak var verticalLine2 : UIView!
    @IBOutlet weak var  verticalLine3 : UIView!
    @IBOutlet weak var  containerView : UIView!
    
    @IBOutlet weak var tabelView : UITableView!
    
    var removeCard : (()->Void)?
    
    let viewModel = UserProfileViewModel()
    
    private var reels: [FavouriteReelItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myStoreOuterView.layer.cornerRadius = screenHeightFactor * 19
        mycartOuterView.layer.borderWidth = 1
        mycartOuterView.layer.borderColor = UIColor.white.cgColor
        mycartOuterView.layer.cornerRadius =  20
        
        nameLabel.font = UIFont.Outfit_SemiBold(size: 22)
        subNameLabel.font = UIFont.Outfit_Medium(size: 14)
        
        likesCountLabel.font = UIFont.Manrope_Bold(size: 14)
        likeLabel.font = UIFont.Manrope_Bold(size: 10)
        
        cartCount.font = UIFont.Manrope_Bold(size: 14)
        cartLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        followersCount.font = UIFont.Manrope_Bold(size: 14)
        FollowLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        followingCount.font = UIFont.Manrope_Bold(size: 14)
        followingLabel.font =  UIFont.Manrope_Bold(size: 10)
        
        descriptionLabel.font = UIFont.Outfit_Light(size: 11)
        
        mycartLabel.font = UIFont.Outfit_Medium(size: 12)
        
        myStoreLabel.font = UIFont.Outfit_Medium(size: 12)
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
//        tabelView.rowHeight = UITableView.automaticDimension
//        tabelView.estimatedRowHeight = 500
        
        viewModel.onError = {[weak self] message in
            self?.show_Alert(message: message)
        }
        
        viewModel.onProfileLoaded = {[weak self] in
            self?.updateUI()
        }
        
        viewModel.onCartLoaded = { [weak self] in
                 guard let self = self else { return }
            
                self.reels = self.viewModel.cartReels
                self.tabelView.reloadData()
        }
        
//        viewModel.fetchProfile()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
             viewModel.fetchProfile()
             viewModel.fetchCartReels()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myStoreOuterView.applyGradientBorder(
            colors: [
                
                UIColor(hex: "FFCC70"),
                UIColor(hex: "C850C0"),
                UIColor(hex: "4C57CF")
            ],
            borderWidth: 2,
            startPoint: CGPoint(x: 1, y: 0),
            endPoint: CGPoint(x: 0, y: 1)
        )
        
        mycartOuterView.applyGradientBackground(colors: [
            UIColor(hex: "FFCC70"),
            UIColor(hex: "C850C0"),
            UIColor(hex: "4C57CF"),
        ],
        startPoint: CGPoint(x: 1, y: 0),
        endPoint: CGPoint(x: 0, y: 1)
        )
    }
    
    
    func updateUI(){
        
        guard let profile = viewModel.profile else {return}
        
        nameLabel.text = profile.name
        subNameLabel.text = profile.userName
        descriptionLabel.text = profile.about.isEmpty ? "No bio Added yet" : profile.about
        
        likesCountLabel.text = "\(profile.totalLikes)"
        followersCount.text = "\(profile.totalFollowers)"
        followingCount.text = "\(profile.totalFollowing)"
        cartCount.text = "\(profile.totalReelCart)"
        
        
        
        //Photo
        if !profile.profilePic.isEmpty , let url = URL(string: profile.profilePic){
            loadImage(from : url , into : nameImage)
        }
        
        func loadImage(from url : URL , into imageView : UIImageView){
            URLSession.shared.dataTask(with: url) { data, _, _ in
                        guard let data = data, let image = UIImage(data: data) else { return }
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }.resume()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileTableViewCell", for: indexPath) as! UserProfileTableViewCell
    
        cell.layoutIfNeeded()
        
        cell.configure(with: reels )
        
        cell.removeCard = { [weak self] reelId in
            self?.confirmRemove(reelId: reelId)
        }
        
        
        return cell
    }
    
    
    func confirmRemove(reelId: Int) {
        guard let reel = viewModel.cartReels.first(where: { $0.reelId == reelId }) else { return }
        
        let cartVC = storyboard?.instantiateViewController(withIdentifier: "MyCartViewController") as! MyCartViewController
        cartVC.favouriteReel = reel
        
        cartVC.OnRemoveTapped = { [weak self, weak cartVC] in
            self?.viewModel.removeFromCart(reelId: reelId) { success, message in
                DispatchQueue.main.async {
                    cartVC?.dismiss(animated: true) {
                        self?.show_Alert(message: message)
                        if success {
                            self?.tabelView.reloadData()
                        }
                    }
                }
            }
        }
        
        let nav = UINavigationController(rootViewController: cartVC)
        nav.modalPresentationStyle = .overFullScreen
        nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true)
        
    }
    
    @IBAction func settingPage(_ sender : UIButton){
        
        let settingPage  = storyboard?.instantiateViewController(withIdentifier: "ProfilePageViewController") as! ProfilePageViewController
        
        let nav = UINavigationController(rootViewController: settingPage)
        
        nav.modalPresentationStyle = .overFullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        present(nav, animated: true)
    }
    
    func myCard(){
        
        let settingPage  = storyboard?.instantiateViewController(withIdentifier: "MyCartViewController") as! MyCartViewController
        
        let nav = UINavigationController(rootViewController: settingPage)
        
        nav.modalPresentationStyle = .overFullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        present(nav, animated: true)
        
    }
    
    @IBAction func notificationCheck(_ sender : UIButton){
              
        let notificationPage = storyboard?.instantiateViewController(identifier: "NotificationViewController") as! NotificationViewController
        
        navigationController?.pushViewController(notificationPage, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let rows = ceil(Double(reels.count) / 2.0)

        let rowHeight = 270 * screenHeightFactor
        let rowSpacing = 6 * screenHeightFactor

        return CGFloat(rows) * rowHeight
               + CGFloat(max(0, Int(rows) - 1)) * rowSpacing
        
    }
    
    
}

