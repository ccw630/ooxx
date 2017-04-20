//
//  ViewController.swift
//  tictactoe
//
//  Created by Xin ZHANG on 14/12/16.
//  Copyright © 2016年 Xin ZHANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    var f:Bool = true
    var cnt:Int = 0
    @IBOutlet weak var player: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player.text="Player Now:X"
        clear()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clear(){
        button1.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button2.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button3.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button4.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button5.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button6.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button7.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button8.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        button9.setBackgroundImage(UIImage(named:"white.png"), for: UIControlState.normal)
        cnt = 0
    }
    
    @IBAction func replay(_ sender:UIButton){
        clear();
    }
    
    let red=UIImage(named : "red.png")!
    let black=UIImage(named:"black.png")!
    let white=UIImage(named:"white.png")!
    
    func check(btn1:UIButton,btn2:UIButton,btn3:UIButton)->Bool{
        let b1=btn1.backgroundImage(for: UIControlState.normal)!
        let b2=btn2.backgroundImage(for: UIControlState.normal)!
        let b3=btn3.backgroundImage(for: UIControlState.normal)!
        if (b1==b2&&b2==b3){
            if (b1==red){
                alert(t:"X wins!")
                return true
            }
            else if (b1==black){
                alert(t:"O wins!")
                return true
            }
        }
        return false
    }
    
    func checkreport(){
        if (check(btn1:button1,btn2:button2,btn3:button3)){
            
        }
        if (check(btn1:button4,btn2:button5,btn3:button6)){
        
        }
        if (check(btn1:button7,btn2:button8,btn3:button9)){
          
        }
        if (check(btn1:button1,btn2:button4,btn3:button7)){
          
        }
        if (check(btn1:button2,btn2:button5,btn3:button8)){
         
        }
        if (check(btn1:button3,btn2:button6,btn3:button9)){
           
        }
        if (check(btn1:button1,btn2:button5,btn3:button9)){
            
        }
        if (check(btn1:button3,btn2:button5,btn3:button7)){
            
        }
        if (cnt==9){
            alert(t: "Ties")
        }
    }
    
    func alert(t:String){
        let alertView:UIAlertController = UIAlertController(title:t,message:"Replay?",preferredStyle:.alert)
        alertView.addAction(UIAlertAction(title: "OK",style:UIAlertActionStyle.default){(action:UIAlertAction!)->Void in
            self.clear()
        })
        present(alertView,animated:true,completion:nil)
    }
    
    @IBAction func pressed(_ sender:UIButton){
        if (f) {
            if sender.backgroundImage(for: UIControlState.normal) == white{
                sender.setBackgroundImage( red , for: UIControlState.normal)
                cnt+=1
                checkreport()
                f = !f
                player.text="Player Now:O"
            }
        }
        else {
            if sender.backgroundImage(for: UIControlState.normal) == white{
                sender.setBackgroundImage(black , for : UIControlState.normal)
                cnt+=1
                checkreport()
                f = !f
                player.text="Player Now:X"
            }
        }
    }
    
}

