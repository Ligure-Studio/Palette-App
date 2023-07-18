//Created By FAN Chenjia On MingS's iPad Pro 12.9-inch(4th Gen)
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationMenu()
                .navigationTitle("Ligure Palette")
        }
    }
}

extension View {
    public func gradientForeground(colors:[Color]) -> some View{
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}
