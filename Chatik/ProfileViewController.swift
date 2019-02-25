//
//  ProfileViewController.swift
//  Chatik
//
//  Created by Hiii Power on 08.02.19.
//  Copyright © 2019 Hiii Power. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UIActionSheetDelegate {

    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var chooseImageButton: UIButton!
    @IBOutlet private weak var changeProfileButton: UIButton!
    let defaultImage = UIImage(named:"placeholder-user")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //print(changeProfileButton.layer.frame)
        //Stored properties cannot be left in an indeterminate state!!!
        //аутлет из нил ин инит
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.bounds.size.height{
            case 480:
                print("iPhone 4S Оххх")
            case 568:
                profileImage.layer.cornerRadius = 30
                chooseImageButton.layer.cornerRadius = 30
                chooseImageButton.imageEdgeInsets = UIEdgeInsetsMake(15, 16, 16, 16)
                print("iPhone 5S ")
            default:
                profileImage.layer.cornerRadius = 60
                chooseImageButton.layer.cornerRadius = 60
                chooseImageButton.imageEdgeInsets = UIEdgeInsetsMake(25, 26, 26, 26)
            }
        }
        profileImage.image = defaultImage
        profileImage.layer.masksToBounds = true
        
        chooseImageButton.setImage(UIImage(named: "slr-camera-2-xxl"), for: .normal)
        //Hex #3F78F0 converted to RGB
        chooseImageButton.backgroundColor = UIColor(red: 63/255, green: 120/255, blue: 240/255, alpha: 0.9)
        
        changeProfileButton.layer.borderWidth = 1
        changeProfileButton.layer.cornerRadius = 10
        
        //свойство frame кнопки«редактировать».
        print(changeProfileButton.layer.frame)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(changeProfileButton.layer.frame)
        //Свойство frame отличается, тк в .storyboard файле выбран девайс iPhoneSE, а в качестве запускаемого симулятора выбран iPhone8Plus или iPhoneX (если в сториборде будет выбран тот же девайс что и в симуляторе, frame будет тем же, при чем свойство origin остается неизменным, меняется только высота и ширина. Понтово))
    }

    //MARK: - Choose profile image
    @IBAction func takePhoto(_ sender: UIButton) {
        print("«Выбери изображение профиля»")
        //Create the AlertController and add Its action like button in Actionsheet
        let alert = UIAlertController(title: "Сменить фото профиля", message: nil, preferredStyle: .actionSheet)
        
        //Picker discription
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        alert.addAction(UIAlertAction(title: "Сфотографировать", style: .default , handler:{ (UIAlertAction)in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.present(imagePicker ,animated: true, completion: nil)
            }

        }))
        
        alert.addAction(UIAlertAction(title: "Выбрать из коллекции" , style: .default , handler:{ (UIAlertAction)in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                self.present(imagePicker ,animated: true, completion: nil)
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Удалить нынешнее фото", style: .destructive , handler:{ (UIAlertAction)in
            self.profileImage.image = self.defaultImage
        }))
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
            print("Отмена операции, возвращаемся на базу")
        }))
        
        //Показываем алерт
        self.present(alert, animated: true, completion: {
        })
        
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            profileImage.contentMode = .scaleToFill
            profileImage.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.configure(title: ":jgf", subtitle: "\(indexPath)")
        return cell
    }
}
extension ProfileViewController: UITableViewDelegate{

}

class MyCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!

    func configure(title: String, subtitle: String){
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
    }
    
}



