//
//  ViewController.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 18/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode> {
    
    private var posts: [Post] {
        return Post.generateDummyPosts()
    }
    
    private let storyNode: StoryNode
    private let postNode: PostNode

    init() {
        self.storyNode = StoryNode(stories: Story.generateDummyStory())
        self.postNode = PostNode(posts: Post.generateDummyPosts())
        
        super.init(node: ASDisplayNode())
        
        self.node.backgroundColor = .white
        self.node.automaticallyManagesSubnodes = true
        self.node.layoutSpecBlock = {_,_ in
            let storyNodeWithPadding = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 0), child: self.storyNode)
            
            let mainStack = ASStackLayoutSpec(direction: .vertical,
                                              spacing: 0,
                                              justifyContent: .start,
                                              alignItems: .stretch,
                                              children: [storyNodeWithPadding,
                                                         self.postNode])
            
            return mainStack
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
