import Foundation

//class-BankUser
class BankUser
{
    var userID: Int
    var accountNo: Int
    var userName: String
    var password: String
    var gender: String
    var mobileNo: Int
    var accountType: String
    var balance: Double

    //intialisation of all objects
    init(userID: Int, accountNo: Int, userName: String, password: String, gender: String, mobileNo: Int, accountType: String, balance: Double)
    {
        self.userID=userID
        self.accountNo=accountNo
        self.userName=userName
        self.password=password
        self.gender=gender
        self.mobileNo=mobileNo
        self.accountType=accountType
        self.balance=balance
    }
    
    //fuction for print details of all objects
    func printDetails()
    {
        print("User ID: \(userID) Account Number: \(accountNo) User Name: \(userName) gender: \(gender) Mobile Number: \(mobileNo) Account Type: \(accountType) Balance: \(balance)")
    }
    
    //function for display balance 
    func displaybalance() { 
        print("Account balance:" , self.balance) 
    } 
    
    //function to check balance 
    func checkBalance(amount: Double) -> Bool {
        if(self.balance > amount){
            return true
        }
        return false
    }
    //function for deposit money 
    func deposit(amount: Double) -> Double
    {     
        self.balance = self.balance + amount 
        return self.balance   
    } 
    
    //function for withdraw money 
     func withdraw(amount: Double) { 
      self.balance -= amount 
      print("your Current Balance:" , self.balance) 
    } 
    
}


//create array and fill it

var userList = [BankUser]()

userList.append(BankUser(userID:1,accountNo:1001,userName:"Miral Lakhani",password:"123456",gender:"Female",mobileNo:9586698237,accountType:"Saving",balance:20000))
userList.append(BankUser(userID:2,accountNo:1002,userName:"Manpreet Singh",password:"123456",gender:"Male",mobileNo:9986698237,accountType:"Current",balance:80000))
userList.append(BankUser(userID:3,accountNo:1003,userName:"Najmeh Akbari",password:"345678",gender:"Female",mobileNo:9786698237,accountType:"Current",balance:35000))
userList.append(BankUser(userID:4,accountNo:1004,userName:"Dishant chaudhary",password:"456789",gender:"Male",mobileNo:9086698237,accountType:"Saving",balance:50000))
userList.append(BankUser(userID:5,accountNo:1005,userName:"mani",password:"123",gender:"Male",mobileNo:9086698237,accountType:"Saving",balance:50000))

//Token to validate if user is logged in or not(value is going to be 0 if user is not logged in and user once user login)
//userObj is going to store user Object/details once user login
var token = 0
var userObj = BankUser(userID:0,accountNo:0,userName:"",password:"",gender:"",mobileNo:0,accountType:"",balance:0)

//Login Function
func login(userID: Int, password: String) -> Bool {
    for user in userList{
        if(user.userID == userID && user.password == password){
            token = user.userID
            userObj = user
            return true
        }
    }
    return false
}

//Logout Function user to set token value to zero and user obj to empty
func logout(){
    token = 0
    userObj = BankUser(userID:0,accountNo:0,userName:"",password:"",gender:"",mobileNo:0,accountType:"",balance:0)
}

//Register Function
func registerUser(userName: String, password: String, gender: String, mobileNo: Int, accountType: String, balance: Double) -> Bool{
    if(userName != "" && password != "" && gender != "" && mobileNo >= 0 && accountType != "" && balance >= 0){
        var userID = 1
        var accountNo = 1001
        if(userList.count != 0){
            userID = (userList[userList.count - 1].userID) + 1
            accountNo = (userList[userList.count - 1].accountNo) + 1
        }
        userList.append(BankUser(userID:userID,accountNo:accountNo,userName:userName,password:password,gender:gender,mobileNo:mobileNo,accountType:accountType,balance:balance))
        return true
    }
    return false
}

//Sub Menu. This will appear once user log in
func subMenu(){
    var choice = 0
    if(token != 0){
        repeat{
            print("\nWelcome \(userObj.userName)\n1. Display the current balance\n2. Deposit money\n3. Withdraw money\n4. Transfer money to other account\n5. Utility bill payments\n6. Logout\nEnter your choice:")
            let choiceInt = readLine()!
            if(Int(choiceInt) != nil){ 
                choice = Int(choiceInt)!        
                switch choice {
                case 1:
                    userObj.displaybalance()               
                case 2:
                    userObj.displaybalance()
                    print("Enter the amount you would like to deposit: ")
                    var amountStr = readLine()!
                    if(Double(amountStr) == nil){
                        repeat{
                            print("Please provide a valid amount:")
                            amountStr  = readLine()!
                        }while(Double(amountStr) == nil)
                    }
                    let amount = Double(amountStr)!
                    print("Deposited amount is: ",amount)
                    print("Now, Current balance is: ",userObj.deposit(amount: amount))
                    print("Press Enter to return to the Menu")
                    _ = readLine()!
                case 3:
                    userObj.displaybalance()
                    repeat{
                        print("Enter the amount you would like to withdraw: ")
                        var amountStr = readLine()!
                        if(Double(amountStr) == nil){
                            repeat{
                                print("Please provide a valid amount:")
                                amountStr  = readLine()!
                            }while(Double(amountStr) == nil)
                        }
                        let amount = Double(amountStr)!
                        if userObj.checkBalance(amount: amount) {
                            userObj.withdraw(amount: amount)
                            print("Withdraw for \(amount) has been done.")
                            print("Press Enter to return to the Menu")
                            _ = readLine()!
                            break
                        }else{
                            print("Insufficient Balanace , do you want to change the amount?yes/no")
                        }
                    }while (readLine()! == "yes" )                    
                case 4:
                    print("Transfered money to other account")
                    //Manpreet
                case 5:
                    userObj.displaybalance()
                        print("Enter the bill amount to pay")
                        var amountStr = readLine()!
                        if(Double(amountStr) == nil){
                            repeat{
                                print("Please provide a valid amount:")
                                amountStr  = readLine()!
                            }while(Double(amountStr) == nil)
                        }                        
                        let amount = Double(amountStr)!
                        if userObj.checkBalance(amount: amount){
                            userObj.withdraw(amount: amount)
                            print("The bill was paid")
                            print("Press Enter to return to the Menu")
                            _ = readLine()!                            
                        }else{ 
                            print("Insufficient Balanace")
                            print("Press Enter to return to the Menu")
                            _ = readLine()!                            
                        }                   
                case 6:
                    print("Logout")
                    logout()
                    landingMenu()
                default:
                    print("Wrong choice!")
                }
            }else{
                print("Incorrect Input. Please try again.")
            }
        }while choice != 6
    }
}

//Menu Option
//flag is used to repeat the loop
func landingMenu(){
    var flag = "yes"
    repeat{
        print("Welcome to the Bank.\n1. Login\n2. Register as a new user.\n3. Exit from the application")
        let input = Int(readLine()!)
        if(input != nil){
            if(input == 1){
                print("Please provide user ID:")
                var stringUserID = readLine()!
                if(Int(stringUserID) == nil){
                    repeat{
                        print("Please provide a valid userID:")
                        stringUserID = readLine()!
                    }while(Int(stringUserID) == nil)
                }
                let userID = Int(stringUserID)!
                print("Please provide password:")
                let password = readLine()!
                if(login(userID: userID, password: password)){
                    print("You have successfully logged in.")
                    subMenu()
                    flag = "no"
                }else{
                    print("User Name or password is incorrect. Please try again.")
                }
            }else if(input == 2){
                //user name and it's validation
                print("Please provide user name:")
                var userName = readLine()!
                if(userName == ""){
                    repeat{
                        print("Please provide a valid user name:")
                        userName = readLine()!
                    }while(userName == "")
                }
                //password and it's validation
                print("Please provide password:")
                var password = readLine()!
                if(password == ""){
                    repeat{
                        print("Please provide a valid user name:")
                        password = readLine()!
                    }while(password == "")     
                }
                //gender and it's validation       
                print("Please provide gender(Male/Female):")
                var gender = readLine()!
                if(!(gender == "Male" || gender == "Female")){
                    repeat{
                        print("Please provide a valid Gender:\nIt Can be either Male or Female")
                        gender = readLine()!
                    }while(!(gender == "Male" || gender == "Female"))  
                }
                //Mobile No and it's validation  
                print("Please provide mobile No:")
                var stringMobileNo = readLine()!
                if(Int(stringMobileNo) == nil){
                    repeat{
                        print("Please provide a valid mobile number.")
                        stringMobileNo = readLine()!
                    }while(Int(stringMobileNo) == nil)
                }
                let mobileNo = Int(stringMobileNo)!
                //Account Type and it's validation
                print("Please provide Account type(Saving/Current):")
                let accountType = readLine()!
                if(!(accountType == "Saving" || accountType == "Current")){
                    repeat{
                        print("Please provide a valid Account Type:\nCan be either Saving or Current")
                    }while(!(accountType == "Saving" || accountType == "Current"))
                }
                let balance = 0.0
                if(registerUser(userName: userName, password: password, gender: gender, mobileNo: mobileNo, accountType: accountType, balance: balance)){
                    print("You account has been successfully registered.\nPlease login to access your account.")
                }else{
                    print("Data provided by you is in incorrect manner. Please try again.")
                }
            }else if(input == 3){
                flag = "no"
                print("Exiting from Application.")
            }
        }else{
            flag = "no"
            print("Invalid Option. Would you like to try again?")
            print("If yes, Type yes and press Enter.")
            flag = readLine()!
        }
    }while(flag.lowercased() == "yes")
}
landingMenu()

