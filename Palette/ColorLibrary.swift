//
//  ColorLibrary.swift
//  Palette
//
//  Created by 樊宸嘉 on 2022/9/3.
//

import SwiftUI


struct MyColor: Identifiable {
    var id = UUID()
    var name: String
    var R: Double
    var G: Double
    var B: Double
}


//定义数组，存放数据
var MyColors = [
    MyColor(name: "Ligure Purple", R: 102,G: 110,B: 197),
    MyColor(name: "Ligure Green", R: 84,G: 185, B: 179)
]

struct ColorLibrary: View {
    
    
    //定义数组
    @State var MyColorsItems = MyColors
    
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
                addItem()
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
    
    
    func moveItem(from source: IndexSet, to destination: Int) {
        MyColorsItems.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ColorLibrary_Previews: PreviewProvider {
    static var previews: some View {
        ColorLibrary()
    }
}
