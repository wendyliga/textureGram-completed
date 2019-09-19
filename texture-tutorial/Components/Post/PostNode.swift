//
//  PostNode.swift
//  textureOnboarding
//
//  Created by Wendy Liga on 19/09/19.
//  Copyright © 2019 Tokopedia. All rights reserved.
//

import AsyncDisplayKit

class PostNode: ASTableNode {
    private let posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
        
        super.init(style: .plain)
        
        self.delegate = self
        self.dataSource = self
        
        self.view.separatorStyle = .none
        
        self.style.width = ASDimension(unit: .fraction, value: 1)
        self.style.height = ASDimension(unit: .fraction, value: 1)
        self.style.flexShrink = 1
    }
}

extension PostNode: ASTableDataSource, ASTableDelegate{
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        guard posts.count > indexPath.row else { return { ASCellNode() } }
        
        let post = posts[indexPath.row]
        
        // this may be executed on a background thread - it is important to make sure it is thread safe
        let cellNodeBlock = { () -> ASCellNode in
            return PostCell(post: post)
        }
        
        return cellNodeBlock
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
    }
}
