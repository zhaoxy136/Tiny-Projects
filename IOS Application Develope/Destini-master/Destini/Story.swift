//
//  Story.swift
//  Destini
//
//  Created by Zhao Xiangyu on 7/4/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    var storyText : String
    var answerA : String
    var answerB : String
    
    init (story : String, firstAnswer : String, secondAnswer : String) {
        storyText = story
        answerA = firstAnswer
        answerB = secondAnswer
    }
}
