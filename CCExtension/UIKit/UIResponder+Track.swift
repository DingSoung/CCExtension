//  Created by Songwen Ding on 10/28/16.
//  Copyright © 2016 Alex. All rights reserved.

import UIKit

public extension UIResponder {
    
    //object_setClass(self, UIResponderEx.self);
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.self)
        //self.touchesBegan(touches, with: event)
    }
}

/*
private class UIResponderEx: UIResponder {
    fileprivate override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(self.self)
        super.touchesBegan(touches, with: event)
    }
}*/





 



