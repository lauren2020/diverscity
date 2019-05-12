//
//  BaseViewModel.swift
//  diverCity
//
//  Created by Lauren Shultz on 5/11/19.
//  Copyright © 2019 Lauren Shultz. All rights reserved.
//

import Foundation

class BaseViewModel {
    var startActivityEvent: ActionEvent = ActionEvent<()>()
    var stopActivityEvent: ActionEvent = ActionEvent<()>()
}
