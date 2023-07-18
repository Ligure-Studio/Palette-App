import SwiftUI

struct Palette: View {
    
    @State private var Red: Double = 102.0
    @State private var Green: Double = 110.0
    @State private var Blue: Double = 197.0
    
    @State private var showingAlert = false
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        return numberFormatter
    }()
    
    var body: some View {
        VStack(alignment: .center) {
            
            Circle()
                .foregroundColor(Color(red: Red/255.0, green: Green/255.0, blue: Blue/255.0))
                .frame(width: 250, height: 250)
                .padding(100)
            VStack {
                
                HStack {
                    Text("红色色值")
                    Button(action: {
                        Red = Red - 10
                    })
                    {
                        Image(systemName: "minus.circle.fill")
                    }
                    Slider(value: $Red,in:0...255)
                    Button(action: {
                        Red = Red + 10
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                    Spacer()
                }
                HStack {
                    Text("绿色色值")
                    Button(action: {
                        Green = Green - 10
                    })
                    {
                        Image(systemName: "minus.circle.fill")
                    }
                    Slider(value: $Green,in:0...255)
                    Button(action: {
                        Green = Green + 10
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                HStack {
                    Text("蓝色色值")
                    Button(action: {
                        Blue = Blue - 10
                    })
                    {
                        Image(systemName: "minus.circle.fill")
                    }
                    Slider(value: $Blue,in:0...255)
                    Button(action: {
                        Blue = Blue + 10
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                    }
                }
                Button("复制颜色值") {
                    UIPasteboard.general.string = "生成的色值：R:\(Red) G:\(Green) B:\(Blue)"
                    self.showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("成功！"),
                          message: Text("您的色值已成功复制到剪贴板"),
                          dismissButton: .default(Text("完成")))
                }
            }
            .padding()
        }
        .navigationTitle("色度混合")
    }
}

struct Palette_Previews: PreviewProvider {
    static var previews: some View {
        Palette()
    }
}
