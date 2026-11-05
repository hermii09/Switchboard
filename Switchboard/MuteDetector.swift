import AudioToolbox
import AVFoundation
import Foundation

/// iOS has no public API for the ring/silent switch. Workaround: play a short
/// silent sound. If the switch is on silent, the completion fires instantly.
final class MuteDetector: ObservableObject {
    @Published var isSilent: Bool? = nil
    @Published var logs: [String] = []

    private var soundID: SystemSoundID = 0
    private var timer: Timer?

    init() {
        try? AVAudioSession.sharedInstance().setCategory(.ambient, options: [.mixWithOthers])
        try? AVAudioSession.sharedInstance().setActive(true)
        if let url = Bundle.main.url(forResource: "silence", withExtension: "wav") {
            AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        } else {
            log("ERROR: silence.wav missing")
        }
    }

    func start() {
        stop()
        log("Monitoring started")
        check()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in self?.check() }
    }

    func stop() {
        timer?.invalidate(); timer = nil
        log("Monitoring stopped")
    }

    private func check() {
        let begin = Date()
        AudioServicesPlaySystemSoundWithCompletion(soundID) { [weak self] in
            let elapsed = Date().timeIntervalSince(begin)
            let silent = elapsed < 0.1
            DispatchQueue.main.async {
                guard let self = self else { return }
                if self.isSilent != silent {
                    self.log(silent ? "SWITCH -> SILENT (\(String(format: "%.3f", elapsed))s)"
                                    : "SWITCH -> RING (\(String(format: "%.3f", elapsed))s)")
                    self.isSilent = silent
                }
            }
        }
    }

    private func log(_ s: String) {
        let f = DateFormatter(); f.dateFormat = "HH:mm:ss.SSS"
        logs.insert("[\(f.string(from: Date()))] \(s)", at: 0)
        print(s)
    }
}
