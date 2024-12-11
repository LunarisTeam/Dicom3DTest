import SwiftUI

@main
struct TestApp: App {
    
    @State private var model = ViewModel()
    
    var body: some Scene {
    
        WindowGroup {
            PrimaryWindowView()
                .environment(model)
        }
        
        WindowGroup(id: "secondaryVolume") {
            SecondaryVolumeView()
                .environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.1, height: 0.1, depth: 0.1, in: .meters)
        
    }
}
