import SwiftUI

struct LoginView: View {
    @State var mobile :String = "0563238328"
    @State var password : String = "12345"
    @State var name:String = ""
    @State var email:String = ""
    @State var national_id:String = ""
    @State var city_id:String = ""
    @State var toggle_register_login_screen:Bool = true
    let userObj = CustomerController()
    @State var showHomeView = false
    @EnvironmentObject var settings: UserSettings

    
    var body: some View {
    
            
                VStack{
                    VStack{
                        if !toggle_register_login_screen {
                            
                            TextField("Name", text: $name)
                                .padding(.all)
                                .font(.headline)
                            
                            
                            TextField("Mobile", text: $mobile)
                                .padding(.all)
                                .font(.headline)
                            
                            
                            TextField("Email", text: $email)
                                .padding(.all)
                                .font(.headline)
                            
                            TextField("National ID", text: $national_id)
                                .padding(.all)
                                .font(.headline)
                            
                            
                            TextField("City", text: $city_id)
                                .padding(.all)
                                .font(.headline)
                            
                        }else{
                            TextField("Customer ID / Mobile No", text: $mobile)
                                .padding(.all)
                                .font(.headline)
                                .animation(.interactiveSpring())
                        }
                        
                        
                        SecureField("Password", text: $password)
                            .padding(.all)
                            .font(.headline)

                        HStack{
                            
                            Button(action: {
                                self.LoginToApp()
                            }){
                                Text(self.toggle_register_login_screen ? "Login" : "Register")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .padding()
                            }
                            .foregroundColor(Color.white)
                            .background(MAIN_COLOR)
                            .cornerRadius(2)
                            .font(.headline)
                        }
                        
                    }.background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    
                    HStack{
                        Text(self.toggle_register_login_screen ? "Dont't have account? " : "Already have account? " )
                        Button(action: {
                            withAnimation {
                                self.resetForm()
                                self.toggle_register_login_screen.toggle()
                            }
                        }){
                            Text(self.toggle_register_login_screen ? "Register" : "Login")
                                .foregroundColor(MAIN_COLOR)
                        }
                    }
                    
                    
                }
                .background(Image("bg2"))
                .padding()
                .textFieldStyle(PlainTextFieldStyle())
                
            }
        
        
        
    
    
    
    func resetForm(){
        self.national_id = ""
        self.name = ""
        self.city_id = ""
        self.email = ""
        self.mobile = ""
    }
    
    func LoginToApp(){
        self.userObj.login(customer_id: mobile, password: password){ response in
            if response {
                self.settings.loggedIn = true
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
