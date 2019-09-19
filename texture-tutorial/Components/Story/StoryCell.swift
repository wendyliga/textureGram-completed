//
//  StoryCell.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class StoryCell: ASCellNode {
    private let story: Story
    
    // MARK: - Nodes
    private let userPicture: ASImageNode
    private let userName: ASTextNode
    
    init(story: Story) {
        self.story = story
        
        userPicture = ASImageNode()
        userPicture.image = story.user.userPhoto
        userPicture.style.preferredSize = CGSize(width: 55, height: 55)
        userPicture.cornerRadius = 55/2
        
        userName = ASTextNode()
        userName.attributedText = NSAttributedString.subtitle(story.user.username)
        userName.maximumNumberOfLines = 1
        
        super.init()
        
        self.automaticallyManagesSubnodes = true
        
        self.style.width = ASDimension(unit: .points, value: 55)
        self.style.height = ASDimension(unit: .fraction, value: 1)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainStack = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 8,
                                          justifyContent: .center,
                                          alignItems: .center,
                                          children: [userPicture, userName])
        
        return mainStack
    }
}
