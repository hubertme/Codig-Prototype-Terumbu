//
//  GlobalVariables.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 12/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import Foundation
import FirebaseAuth

var currentUser: User? = Auth.auth().currentUser
var newsList: Array<News> = []
