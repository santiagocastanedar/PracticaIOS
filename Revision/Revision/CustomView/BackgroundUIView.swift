//
//  BackgroundUIView.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 29/12/21.
//

import UIKit

class BackgroundUIView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet var customView: UIView!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit(){
        let bundle = Bundle.init(for: BackgroundUIView.self)
        if let viewToAdd = bundle.loadNibNamed("BackgroundCustomView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView{
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
        
    }

}
