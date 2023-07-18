import SwiftUI

/*
 SGksIEknbSBnbGFkIHlvdSBzb2x2ZWQgdGhlIHB1enpsZSBJIGxlZnQuIEFsdGhvdWdoIHRoZSBhcHBsaWNhdGlvbiB0aGlzIHRpbWUgaXMgbGlnaHR3ZWlnaHQsIGl0IGhhcyBhIGxvdCBvZiBkZXZlbG9wbWVudCBhbmQgaW52b2x2ZXMgbWFueSBrbm93bGVkZ2UgYmxpbmQgc3BvdHMuIEknbSB2ZXJ5IGhhcHB5IHRvIGhhdmUgdGhlIGN1cnJlbnQgY29tcGxldGlvbiBiZWZvcmUgdGhlIGVuZCBvZiB0aGUgd2ludGVyIHZhY2F0aW9uLiBJIGFsc28gaG9wZSB5b3UgY2FuIGJlIGhhcHB5IHdoZW4gdXNpbmcgbXkgYXBwbGljYXRpb24uIFRoZSBwdXJwb3NlIG9mIGRldmVsb3BpbmcgYXBwbGljYXRpb25zIGlzIG5vdCB0byB3aW4gYXdhcmRzLCBidXQgdG8gbWFrZSBwZW9wbGUgbGl2ZSBhbmQgY3JlYXRlIGJldHRlciEgQmVzdCB3aXNoZXMgdG8geW91IQ==
 */

struct Intro: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("Icon")
                    .resizable()
                    .frame(width:170,height: 170)
                Text("Ligure Palette")

                    .font(.title)
                    .padding(.top)
                Text("超轻量化色彩方案生成")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding()
                Divider()
                Text("    调色板是由 Ligure Studio 开发设计的超轻量化软件。本软件使用Apple目前最新最先进的编程架构——SwiftUI编写，是一款优秀的色彩方案生成工具。")
                Spacer()
                Text("    本软件的开发初衷是为业余设计者智能生成色彩方案，通过超轻量化的算法提供最方便的使用体验，让尽可能多的Apple 设备能够使用。软件前端干净极简，您只需要轻点按钮，拖动滑块就可以生成您喜欢的颜色，并将其运用进您的设计作品中。未来还会提供实用色彩库的一键调用和自定义存储。")
            }.padding()
            Spacer()
            Text("项目主页：https://github.com/FANChenjia/Palette-App")
        }
        }
}

struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}

