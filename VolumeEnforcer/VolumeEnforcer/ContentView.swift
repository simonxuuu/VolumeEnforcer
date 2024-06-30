import SwiftUI
import ISSoundAdditions

class VolumeMonitor: ObservableObject {
    @Published var currentVolume: Float = Sound.output.volume * 100
    @Published var volumeLimit: Float = 80 // Default limit of 80%
    
    init() {
        startMonitoring()
    }
    
    func startMonitoring() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.checkAndLimitVolume()
        }
    }
    
    func checkAndLimitVolume() {
        let systemVolume = Sound.output.volume * 100
        if systemVolume != self.currentVolume {
            self.currentVolume = systemVolume
            if systemVolume > self.volumeLimit {
                Sound.output.volume = self.volumeLimit / 100
                self.currentVolume = self.volumeLimit
            }
        }
    }
}

struct ContentView: View {
    @StateObject private var volumeMonitor = VolumeMonitor()
    
    var body: some View {
        VStack {
            Text("Volume Enforcer")
                .font(.largeTitle)
            
            Slider(value: $volumeMonitor.volumeLimit, in: 0...100, step: 1)
                .padding()
            
            Text("Volume Limit: \(Int(volumeMonitor.volumeLimit))%")
            
            Text("Current Volume: \(Int(volumeMonitor.currentVolume))%")
                .padding()
        }
        .padding()
        .onAppear {
            print("Volume Enforcer started.")
        }
        .onChange(of: volumeMonitor.volumeLimit) { _, newValue in
            volumeMonitor.checkAndLimitVolume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
