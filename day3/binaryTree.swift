class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int, left: TreeNode? = nil, right: TreeNode? = nil){
        self.val = val
        self.left = left
        self.right = right
    }
}

func preorder(cur: TreeNode?) {
    guard cur != nil else {
        return
    }
    
    print(cur!.val)
    preorder(cur: cur?.left)
    preorder(cur: cur?.right)
}

func inorder(cur: TreeNode?) {
    guard cur != nil else {
        return
    }
    
    preorder(cur: cur?.left)
    print(cur!.val)
    preorder(cur: cur?.right)
}

func postorder(cur: TreeNode?) {
    guard cur != nil else {
        return
    }
    
    preorder(cur: cur?.left)
    preorder(cur: cur?.right)
    print(cur!.val)
}

let l = TreeNode(val: 3)
let r = TreeNode(val: 6)
let root = TreeNode(val: 10, left: l, right: r)

inorder(cur: root)
