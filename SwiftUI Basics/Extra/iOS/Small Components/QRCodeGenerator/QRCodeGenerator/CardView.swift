
import SwiftUI
import SafariServices


struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    var link : String
    @State private var isShowingSafari = false
    
    var body: some View {
        VStack {
            ZStack {
                
                    Rectangle()
                        .frame(width: 350, height: 400)
                        //.border(.white, width: 20)
                        .cornerRadius(50)
                        .foregroundColor(color.opacity(0.9))
                        .shadow(radius: 4)
                       // .padding(.top,20)
                VStack {
                    Image(person)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(25)
                    
                   
                    HStack {
    
                            Text(person)
                            .bold()
                            .font(.system(size: 40))
                            .font(Font.system(.body, design: .monospaced))
                            .foregroundColor(.white)
                                
                                .italic()
                        
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                
                    }
                    //.padding(.bottom,10)
                }
                .padding(.bottom,5)
            }
            .padding(50)
//            Text("Scan QR to download the app!")
//            VStack{
//                QRCodeView(url: link)
//            }
            
            Text("click QR ! or Scan QR to view full profile!")
                               .foregroundColor(.blue)
//                               .onTapGesture {
//                                   // Open the link when tapped
//                                   isShowingSafari = true
//                               }	
            VStack{
                            QRCodeView(url: link)
                    
                        }
            .foregroundColor(.blue)
            .onTapGesture {
                // Open the link when tapped
                isShowingSafari = true
            }
        
        }
        .sheet(isPresented: $isShowingSafari) {
                                           
    SafariView(url: URL(string: link)!)
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    withAnimation {
                        swipcard(width: offset.width)
                    }
                }
    )
    }
    
    func swipcard(width: CGFloat) {
        switch width {
        case -500 ... (-150):
            print("\(person) removed")
            offset = CGSize(width: -500, height: 0)
        default:
            offset = .zero
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Update the view controller if needed
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: "Utkarsh", link: "https://in.linkedin.com/in/utkarshupadhyay1703")
    }
}

