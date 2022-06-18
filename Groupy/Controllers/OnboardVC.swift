//
//  ViewController.swift
//  Groupy
//
//  Created by Develop on 5/8/22.
//  Copyright © 2022 Develop. All rights reserved.
//

import UIKit

class OnboardVC: UIViewController {
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    var slide = [SlideModel]()
    var timer = Timer()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slide.count - 1 {
                skipButton.isHidden = true
                nextButton.setTitle("إنهاء", for: .normal)
            }else {
                skipButton.isHidden = false
                nextButton.setTitle("التالي", for: .normal)
            }
        }
    }
   
   

    
    let constant3 = "سهولة أداء إمتحاناتك والرجوع إليها في أي  وقت مع حلولها الصحيحة"
    let constant1 = "سجل حضورك بمجرد اظهار الكود الخاص بك"
    let constan2 = " متابعة شروحات المستر أول بأول من خلال  تحديثات قائمة الفيديوهات في كل مادة  "

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad(){
        super.viewDidLoad()
              
        if let image1 = UIImage(named: "onboard1"),let image2 = UIImage(named: "onboard2"),let image3 = UIImage(named: "onboard3")  {
            slide = [SlideModel(image: image1, description:constant1 ),SlideModel(image: image2, description:constan2 ),SlideModel(image: image3, description:constant3 )]
                  }
        
        print(slide.count)
        pageControl.numberOfPages = slide.count
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.autoSlide), userInfo: nil, repeats: true)
        }
        
    
    }
    func presentLoginVC() {
       // let vc = UIViewController(nibName: "LoginVC", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
   

    @IBAction func skipClickedButton(_ sender: Any) {
        presentLoginVC()

        
    }
    
    @IBAction func NextClickedButton(_ sender: Any) {
        if currentPage == slide.count - 1 {
            presentLoginVC()
        }else {
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
       
    }
    
    @objc func autoSlide(){
        
        if(pageControl.currentPage < (slide.count - 1)){
             currentPage += 1
            let index = IndexPath.init(item: currentPage, section: 0)
           
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
            	
        }else {
            currentPage = 0
            let index = IndexPath.init(item: currentPage, section: 0)
            //collectionView.layoutIfNeeded()
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
            
        }
    }
}
extension OnboardVC : UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slide.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardCell
            cell.setUp(slide[indexPath.row])
            return cell
        
       
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(collectionView.frame.width)
    }
    
    



}

