//
//  MUAppHelper.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import SVProgressHUD

class MUAppHelper {
    func showSpinner() {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(UIColor.muGreen())
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.show()
    }
    
    func hideSpinner() {
        SVProgressHUD.dismiss()
    }
}
