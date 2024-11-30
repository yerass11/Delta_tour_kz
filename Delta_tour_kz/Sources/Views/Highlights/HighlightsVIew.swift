import SwiftUI

struct HighlightsView: View {
    let images: [String] = (1...32).map { "feedback\($0)" }
    @ObservedObject var countTimer: CountTimer = CountTimer(items: 32, interval: 3.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                let currentIndex = Int(self.countTimer.progress) % self.images.count
                
                Image(self.images[currentIndex])
                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: nil, alignment: .center)
                
                HStack(alignment: .center, spacing: 4) {
                    ForEach(self.images.indices, id: \.self) { image in
                        LoadingBar(progress: min(max(CGFloat(self.countTimer.progress) - CGFloat(image), 0.0), 1.0))
                            .frame(width: nil, height: 2, alignment: .leading)
                            .animation(.linear, value: countTimer.progress)
                    }
                }
                .padding()
                
                HStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: -1)
                        }
                    Rectangle()
                        .foregroundColor(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.countTimer.advancePage(by: 1)
                        }
                }
            }
            .onAppear {
                self.countTimer.start()
            }
        }
    }
}

#Preview {
    HighlightsView()
}
