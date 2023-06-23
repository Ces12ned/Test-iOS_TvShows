//
//  IMDbViewController.swift
//  Test-iOS_TvShows
//
//  Created by Edgar Cisneros on 23/06/23.
//

import UIKit
import WebKit

class IMDbViewController: UIViewController, WKNavigationDelegate{

    //MARK: - Properties
    
    
    private let activityIndicator = UIActivityIndicatorView()
    
    var webView: WKWebView?
    
    var imdb: String
    
    init(imdb: String) {
        self.imdb = imdb
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        webView!.navigationDelegate = self
        view = webView
    }
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goToWeb()
        navigationItemsSettings()
    
}
    
    override func viewWillAppear(_ animated: Bool) {
        title = "IMDb"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 28) as Any]
    }
    
    
    //MARK: - Methods
    
    
    private func goToWeb(){
        
        
        if let url = URL(string: getSafeURL()){
            DispatchQueue.main.async {
                self.webView?.load(URLRequest(url: url))
                self.webView?.allowsBackForwardNavigationGestures = true
            }
        }
    }
    
    
    private func getSafeURL() -> String{
                
        let url = "https://www.imdb.com/title/\(imdb)/"

        return url
        
    }

    //MARK: - NavigationItemsSettings

    
    private func navigationItemsSettings(){
        
        //Navigation Items
        
        //Left
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "return"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(returnToDetailShow))
        
        navigationItem.leftBarButtonItem?.tintColor = .white
        
      
    }
    
    @objc func returnToDetailShow(){

        navigationController?.popViewController(animated: true)
    }
    
}
