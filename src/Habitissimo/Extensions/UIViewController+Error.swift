//
//  UIViewController+Error.swift
//  Habitissimo
//
//  Created by Borja on 1/4/21.
//

import UIKit

extension UIViewController {
    func displayErrorOnMainThread(_ error: Error) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: NSLocalizedString("Error", comment: "Generic title for error message"),
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""),
                                                    style: .default,
                                                    handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }
    }
}
