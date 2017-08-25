//
//  MenuCell.swift
//  ams
//
//  Created by yangyuan on 2017/6/21.
//  Copyright © 2017年 coterjiesen. All rights reserved.
//

import UIKit

class BottonImageView: UIView{
    var lable: UILabel?
    var image: UIImageView?
    var button: UIButton?
    override init(frame : CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        button = UIButton()
        image = UIImageView()
        lable = UILabel()
        lable?.font = v2Font(14)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(white: 1, alpha: 0.5).cgColor;
        self.addSubview(button!)
        self.addSubview(image!)
        self.addSubview(lable!)

        self.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(self)
        }
        image!.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: SCREEN_WIDTH/16, bottom: SCREEN_WIDTH/8 - 4, right: SCREEN_WIDTH/16))
        }
        lable!.snp.makeConstraints { (make) in
            make.top.equalTo(self.image!.snp.bottom).offset(2)
            make.centerX.equalTo(self)
        }
        button!.snp.makeConstraints{ (	make) in
            make.left.top.right.bottom.equalTo(self)
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class MenuView: UIView{
    var consumingView :BottonImageView?
    var reportFaultView :BottonImageView?
    var restitutionView :BottonImageView?
    var reportView :BottonImageView?
    var allotView :BottonImageView?
    var unpackView :BottonImageView?
    var formsView :BottonImageView?
    var tellView :BottonImageView?
    override init(frame : CGRect){
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        self.backgroundColor = UIColor.white
        consumingView = BottonImageView()
        consumingView?.image?.image = UIImage(named: "s1")
        consumingView?.button?.addTarget(self, action: #selector(clickConsumingDevice), for: .touchUpInside)
        consumingView?.lable?.text = "设备领用"
        reportFaultView = BottonImageView()
        reportFaultView?.image?.image = UIImage(named: "s2")
        reportFaultView?.button?.addTarget(self, action: #selector(clickReportFault), for: .touchUpInside)
        reportFaultView?.lable?.text = "设备报障"
        restitutionView = BottonImageView()
        restitutionView?.image?.image = UIImage(named: "s3")
        restitutionView?.button?.addTarget(self, action: #selector(clickRestitution), for: .touchUpInside)
        restitutionView?.lable?.text = "设备返还"
        reportView = BottonImageView()
        reportView?.image?.image = UIImage(named: "s4")
        reportView?.button?.addTarget(self, action: #selector(clickCheckDevice), for: .touchUpInside)
        reportView?.lable?.text = "设备盘点"
        allotView = BottonImageView()
        allotView?.image?.image = UIImage(named: "s5")
        allotView?.button?.addTarget(self, action: #selector(clickConsumingDevice), for: .touchUpInside)
        allotView?.lable?.text = "设备调拨"
        unpackView = BottonImageView()
        unpackView?.image?.image = UIImage(named: "s6")
        unpackView?.button?.addTarget(self, action: #selector(clickReportFault), for: .touchUpInside)
        unpackView?.lable?.text = "设备拆机"
        formsView = BottonImageView()
        formsView?.image?.image = UIImage(named: "s7")
        formsView?.button?.addTarget(self, action: #selector(clickRestitution), for: .touchUpInside)
        formsView?.lable?.text = "智能报表"
        tellView = BottonImageView()
        tellView?.image?.image = UIImage(named: "s8")
        tellView?.button?.addTarget(self, action: #selector(clickCheckDevice), for: .touchUpInside)
        tellView?.lable?.text = "装维电话"
        self.addSubview(consumingView!)
        self.addSubview(reportFaultView!)
        self.addSubview(restitutionView!)
        self.addSubview(reportView!)
        self.addSubview(allotView!)
        self.addSubview(unpackView!)
        self.addSubview(formsView!)
        self.addSubview(tellView!)

        setupLayout()
    }

    func clickConsumingDevice(){
        let viewOutBin = ConsumingDeviceTabController()
        viewOutBin.hidesBottomBarWhenPushed = true
        CuClient.sharedInstance.centerViewController?.navigationController?.pushViewController(viewOutBin, animated: true)
    }
    
    func clickReportFault(){
        let vc = ReportFaultDeviceTabViewController()
        vc.hidesBottomBarWhenPushed = true
        CuClient.sharedInstance.centerViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    func clickRestitution(){
        let vc = RestitutionDeviceTabViewController()
        vc.hidesBottomBarWhenPushed = true
        CuClient.sharedInstance.centerViewController?.navigationController?.pushViewController(vc, animated: true)
    }
    func clickCheckDevice(){
        let vc = CheckDeviceViewController()
        vc.hidesBottomBarWhenPushed = true
        CuClient.sharedInstance.centerViewController?.navigationController?.pushViewController(vc, animated: true)
    }
   
    
    func setupLayout(){

        self.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self)
        }
        consumingView!.snp.makeConstraints { (make) in
            make.top.equalTo(2)
            make.left.equalTo(self)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        reportFaultView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.consumingView!)
            make.left.equalTo(self.consumingView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        restitutionView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.consumingView!)
            make.left.equalTo(self.reportFaultView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        reportView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.consumingView!)
            make.left.equalTo(self.restitutionView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }

        allotView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.consumingView!.snp.bottom).offset(2)
            make.left.equalTo(self)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        unpackView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.allotView!)
            make.left.equalTo(self.allotView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        formsView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.allotView!)
            make.left.equalTo(self.reportFaultView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
        tellView!.snp.makeConstraints { (make) in
            make.top.equalTo(self.allotView!)
            make.left.equalTo(self.formsView!.snp.right)
            make.width.height.equalTo(SCREEN_WIDTH/4)
        }
    }
}
