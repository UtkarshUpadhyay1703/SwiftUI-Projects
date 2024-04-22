


import SwiftUI


struct ContentView: View{
    @State private var currentCardIndex = 0
    
    private var people: [(String, String)] = [("Suraj","https://in.linkedin.com/in/suraj-chechare-44a39b211?original_referer=https%3A%2F%2Fwww.google.com%2F"), ("Aniket Don","https://in.linkedin.com/in/aniket-kondhekar-94125714a"), ("Utkarsh","https://in.linkedin.com/in/utkarshupadhyay1703?trk=people-guest_people_search-card"), ("Akash","https://www.linkedin.com/in/akash-phatangade-260475153?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app&original_referer=https%3A%2F%2Fkeep.google.com%2F"), ("Vaibhav","https://in.linkedin.com/in/vaibhav-chauhan-15857221")]
    
    
    @State private var visibleCardIndex: Int = 0
    
    var body: some View {
        ZStack {
            Image("backgroundImage")
                           .resizable()
                           .scaledToFill()
                           .edgesIgnoringSafeArea(.all)
            VStack {
                
                ScrollView {
                    Spacer()
                    ZStack {
                        
                        ForEach(people, id: \.0) { (person, link)  in
                            
                            
                            VStack{
                                CardView(person: person,link: link)
                                Spacer()
                                
                            }
                            
                        }
                    }
                    
                    
                }
                .padding(.top,90)
            }
                .frame(maxWidth:.infinity)
                .ignoresSafeArea()
            .background(Color.white)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
