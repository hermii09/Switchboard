import SwiftUI

struct ContentView: View {
    @StateObject private var det = MuteDetector()
    @Environment(\.scenePhase) private var phase

    var body: some View {
        let color: Color = det.isSilent == nil ? .gray : (det.isSilent! ? .red : .green)
        let text = det.isSilent == nil ? "CHECKING..." : (det.isSilent! ? "SILENT" : "RING")
        ZStack {
            color.ignoresSafeArea()
            VStack(spacing: 16) {
                Text(text).font(.system(size: 54, weight: .bold)).foregroundColor(.white).padding(.top, 60)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 4) {
                        ForEach(Array(det.logs.enumerated()), id: \.offset) { _, l in
                            Text(l).font(.system(size: 12, design: .monospaced)).foregroundColor(.white)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading).padding()
                }.background(Color.black.opacity(0.35)).cornerRadius(8).padding()
            }
        }
        .onChange(of: phase) { p in
            if p == .active { det.start() } else { det.stop() }
        }
        .onAppear { det.start() }
    }
}
