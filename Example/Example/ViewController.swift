//
//  ViewController.swift
//  Example
//
//  Created by taisuke fujita on 2017/06/21.
//  Copyright © 2017年 Taisuke Fujita. All rights reserved.
//

import UIKit
import RxStoreKit
import StoreKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let disposeBag = DisposeBag()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        let receiptRefreshRequest = SKReceiptRefreshRequest()
        receiptRefreshRequest.rx.request
            .subscribe(onCompleted: {
                // Refreshed receipt is available
            }, onError: { error in
                print(error)
            }).disposed(by: disposeBag)
        
        let productRequest = SKProductsRequest(productIdentifiers: Set(["xxx.xxx.xxx"]))
        productRequest.rx.productsRequest
            .flatMap { response -> Observable<SKProduct> in
                return Observable.from(response.products)
            }
            .flatMap { product -> Observable<SKPaymentTransaction> in
                return SKPaymentQueue.default().rx.add(product: product, shouldVerify: false)
            }
            .flatMap { transaction -> Observable<SKDownload> in
                return SKPaymentQueue.default().rx.start(downloads: transaction.downloads)
            }
            .subscribe(onNext: { download in
                print(download)
            }).disposed(by: disposeBag)
        productRequest.start()
        receiptRefreshRequest.start()
    }


}

