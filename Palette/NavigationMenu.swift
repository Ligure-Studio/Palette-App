import SwiftUI

struct NavigationMenu: View {
    let intro = Intro()
    let palette = Palette()
    let paletteduo = PaletteDuo()
    let colorlibrary = ColorLibrary()
    var body: some View {
        Form{
            Section(header:Text("概览")){
                NavigationLink(destination:intro) {
                    HStack{
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
                        Text("初步了解")
                    }
                }
            }
            
            
            Section(header:Text("主要功能")) {
                
                //色度混合
                NavigationLink(destination:palette) {
                    HStack {
                        Image(systemName: "paintpalette")
                            .foregroundColor(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
                        Text("色度混合")
                    }
                }
                
                //多色调色板
                NavigationLink(destination:paletteduo) {
                    HStack {
                        Image(systemName: "paintpalette.fill")
                            .foregroundColor(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
                        Text("多色调色板")
                    }
                }
                
                NavigationLink(destination:colorlibrary) {
                    HStack {
                        Image(systemName: "bag")
                            .foregroundColor(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
                        Text("色彩库（尚未完成）")
                    }
                }
                
            }
        }
    }
}

struct NavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenu()
    }
}
