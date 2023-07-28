//
//  ColorLibrary.swift
//  Palette
//
//  Created by 樊宸嘉 on 2022/9/3.
//

import SwiftUI


struct MyColor: Identifiable, Codable {
    var id = UUID()
    var name: String
    var R: Double
    var G: Double
    var B: Double
}


//定义数组，存放数据
//var MyColors = [
//    MyColor(name: "Ligure Purple", R: 102,G: 110,B: 197),
//    MyColor(name: "Ligure Green", R: 84,G: 185, B: 179)
//]

struct ColorLibrary: View {
    @AppStorage("MyColorsEdited") var MyColorsEdited: Bool = false
    //定义数组
    @State var MyColorsItems: [MyColor] = []
    //显示添加色彩面板
    @State var showingAddColorView = false
    
    //主视图
    var body: some View {
        VStack {
            List {
                ForEach(MyColorsItems) { MyColor in
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color(red: MyColor.R/255.0,green: MyColor.G/255.0, blue: MyColor.B/255.0))
                        Text(MyColor.name)
                    }
                }
                .onDelete(perform: deleteRow)
                .onMove(perform: moveItem)
            }
            .navigationBarItems(trailing: EditButton())
            Button("添加一个项目") {
                showingAddColorView.toggle()
            }
            .onAppear() {
                loadData()
            }
            .sheet(isPresented: $showingAddColorView, onDismiss: loadData) {
                AddColorView()
            }
            .padding()
            .background(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
            .cornerRadius(25)
            .foregroundColor(.white)
            Spacer()
        }
    }
    
    func addItem() {
        MyColorsItems.append(MyColor(name: "敬请期待",R: 102, G: 110, B: 197))
    }
                        
    
    func deleteRow(at offsets: IndexSet) {
        MyColorsItems.remove(atOffsets: offsets)
    }
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(MyColorsItems) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(encoded, forKey: "MyColorItems")
        }
    }
    
    func loadData() {
        UserDefaults.standard.removePersistentDomain(forName: "com.MingS.Palette")
        UserDefaults.standard.synchronize()
        
        let userDefaults = UserDefaults.standard
        if let savedFileItems = userDefaults.object(forKey: "MyColorItems") as? Data {
            if let loadedFileItems = try? JSONDecoder().decode([MyColor].self, from: savedFileItems) {
                MyColorsItems = loadedFileItems
            }
        }
        if MyColorsItems.isEmpty && !MyColorsEdited {
            MyColorsItems = [
                MyColor(name: "Ligure Purple", R: 102,G: 110,B: 197),
                MyColor(name: "Ligure Green", R: 84,G: 185, B: 179)
            ]
            MyColorsEdited = true
        }
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        MyColorsItems.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct AddColorView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.self) var environment
    @State var colorName = ""
    @State var color = Color.red
    @State var MyColors: [MyColor] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("颜色名称：")
                TextField("颜色名称", text: $colorName)
                    .foregroundColor(.black)
            }
            ColorPicker("选择颜色", selection: $color)
            Button("完成") {
                loadData()
                save()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color(red: 102/255.0, green: 110/255.0, blue: 197/255.0))
            .cornerRadius(25)
        }
    }
    
    func save() {
        let (red, green, blue) = color.rgb
        print(red)
        print(green)
        print(blue)
        MyColors.append(MyColor(name: colorName, R: red * 255.0, G: green * 255.0, B: blue * 255.0))
        print(red * 255.0)
        print(green * 255.0)
        print(blue * 255.0)
        if let encoded = try? JSONEncoder().encode(MyColors) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(encoded, forKey: "MyColorItems")
        }
    }
    func loadData() {
        let userDefaults = UserDefaults.standard
        if let savedFileItems = userDefaults.object(forKey: "MyColorItems") as? Data {
            if let loadedFileItems = try? JSONDecoder().decode([MyColor].self, from: savedFileItems) {
                MyColors = loadedFileItems
            }
        }
    }
}

extension Color {
  var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat) {
    let uiColor = UIColor(self)
    let components = uiColor.cgColor.components!
    return (red: components[0],
            green: components[1],
            blue: components[2])
  }
}

struct ColorLibrary_Previews: PreviewProvider {
    static var previews: some View {
        ColorLibrary()
    }
}
