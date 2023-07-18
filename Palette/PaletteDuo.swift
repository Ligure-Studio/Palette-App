import SwiftUI

struct PaletteDuo: View {
    
    @State private var InputText: String = "Hello！"
    @State private var Red: Double = 102.0
    @State private var Green: Double = 110.0
    @State private var Blue: Double = 197.0
    
    @State private var Red2: Double = 102.0
    @State private var Green2: Double = 110.0
    @State private var Blue2: Double = 197.0
    
    @State private var dd: Double = 110.0
    
    @State private var showingAlert = false
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        return numberFormatter
    }()
    
    var body: some View {
        VStack {
            Text(InputText)
                .font(.system(size: 100))
                .gradientForeground(colors: [Color(red: Red/255.0, green: Green/255.0, blue: Blue/255.0),Color(red: Red2/255.0, green: Green2/255.0, blue: Blue2/255.0)])
            Divider()
                .padding()
            Button(action:{
                Red2 = Red + drand48() * dd
                Green2 = Green + drand48() * dd
                Blue2 = Blue + drand48() * dd
            }) {
                Text("生成配色方案")
                    .padding()
                    .background(Color(red: Red2/255.0, green: Green2/255.0, blue: Blue2/255.0))
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            VStack {
                HStack {
                    Text("请输入参考文字")
                    TextField("文字",text: $InputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }.padding(.bottom)
                VStack {
                    
                    HStack {
                        Text("红色")
                        Button(action: {
                            Red = Red - 10
                        })
                        {
                            Image(systemName: "minus.circle.fill")
                        }
                        .foregroundColor(.red)
                        Slider(value: $Red,in:0...255)
                        Button(action: {
                            Red = Red + 10
                        })
                        {
                            Image(systemName: "plus.circle.fill")
                        }
                        .foregroundColor(.red)
                    }
                    HStack {
                        Text("绿色")
                        Button(action: {
                            Green = Green - 10
                        })
                        {
                            Image(systemName: "minus.circle.fill")
                        }
                        .foregroundColor(.green)
                        Slider(value: $Green,in:0...255)
                        Button(action: {
                            Green = Green + 10
                        })
                        {
                            Image(systemName: "plus.circle.fill")
                        }
                        .foregroundColor(.green)
                    }
                    HStack {
                        Text("蓝色")
                        Button(action: {
                            Blue = Blue - 10
                        })
                        {
                            Image(systemName: "minus.circle.fill")
                        }
                        .foregroundColor(.blue)
                        Slider(value: $Blue,in:0...255)
                        Button(action: {
                            Blue = Blue + 10
                        })
                        {
                            Image(systemName: "plus.circle.fill")
                        }
                        .foregroundColor(.blue)
                    }
                }.padding(.bottom)
                HStack {
                    Text("参数调整")
                    Slider(value:$dd,in:80...150)
                }.padding()
                .padding(.bottom)
                
                if #available(iOS 16.0, *) {
                    Button("保存至剪贴板") {
                        UIPasteboard.general.strings = ["原始的色值:","R:\(Red)", "G:\(Green)","B:\(Blue)","生成的色值:","R:\(Red2)","G:\(Green2)","B:\(Blue2)"]
                        
                        self.showingAlert = true
                    }
                    .foregroundColor(Color(red: Red2/255.0, green: Green2/255.0, blue: Blue2/255.0))
                    .bold()
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("大功告成！"),
                              message: Text("您的色值已成功复制到剪贴板"),
                              dismissButton: .default(Text("完成")))
                    }
                } else {
                    // Fallback on earlier versions
                }
            }.padding()
        }
        .navigationTitle("多色调色板")
    }
}

struct PaletteDuo_Previews: PreviewProvider {
    static var previews: some View {
        PaletteDuo()
    }
}
