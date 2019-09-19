//
//  PostCell.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class PostCell: ASCellNode {
    let post: Post
    
    // MARK: - Nodes
    
    let headerNode: HeaderNode
    let postImage: ASImageNode
    let actionNode: ActionNode
    let postLikes: ASTextNode
    let postDescription: ASTextNode
    
    init(post: Post) {
        self.post = post
        headerNode = HeaderNode(post: post)
        
        postImage = ASImageNode()
        postImage.contentMode = .scaleAspectFit
        postImage.style.width = ASDimension(unit: .fraction, value: 1)
        postImage.image = post.image
        
        actionNode = ActionNode()
        
        postLikes = ASTextNode()
        postLikes.attributedText = NSAttributedString.bold("\(post.likeCount) Likes")
        
        postDescription = ASTextNode()
        postDescription.maximumNumberOfLines = 0
        postDescription.attributedText = NSAttributedString.normal(post.description)
        
        super.init()
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let postImageWithRatio = ASRatioLayoutSpec(ratio: 1/1.5, child: postImage)
        
        let postLikesWithPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: self.postLikes)
        
        let postDescriptionWithPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 8), child: self.postDescription)
        
        let mainStack = ASStackLayoutSpec(direction: .vertical,
                                          spacing: 0,
                                          justifyContent: .start,
                                          alignItems: .start,
                                          children: [headerNode,
                                                     postImageWithRatio,
                                                     actionNode,
                                                     postLikesWithPadding,
                                                     postDescriptionWithPadding])
        
        return mainStack
    }
}
