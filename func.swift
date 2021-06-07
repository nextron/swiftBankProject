//function for display balance 
func displaybalance() { 
    print("Account balance:" , self.balance) 
} 
  
 
  
  
//function for deposit money 
func deposit(amount: Double) { 
    self.balance += amount 
    print("Current Account Balance:" , self.balance ) 
     
} 


//function for withdraw money 
func withdraw(amount: Double) { 
    self.balance -= amount 
    print("Your remaining balance: ", self.balance)
} 
  
// function to transfer money 
func transfer(firstAcc : Int, secondAcc : Int , amount : Double , userList: [String]) { 
    for item in userlist {  
     if (firstAcc == item.accountNumber) { 
        if firstAcc.balance < amount { 
           print("Insufficient Balance") 
        }else { 
        firstAcc.balance -= amount 
     }  
     else {  
     println("Invalid account number! ") 
     } 
  
     if secondAcc == item.accountNumber { 
          secondAcc.balance += amount 
     }  
     else { 
         println("Invalid account number! ") 
     } 
   }   
} 
} 
  
//function to pay utility 
func payUtility(utility: Double) { 
  if self.balance > utility { 
   self.balance -= utility
   print(" the bill was paid. your Current balance is :" , self.balance) 
    }else{ 
        print("Insufficient balance") 
    } 
} 