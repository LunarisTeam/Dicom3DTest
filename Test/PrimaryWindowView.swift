import SwiftUI

struct PrimaryWindowView: View {
    
    @Environment(ViewModel.self) var model
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
    
        @Bindable var model = model
        
        VStack(spacing: 18.0) {
            Image(systemName: "1.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100,height: 100)
                .fontWeight(.light)
                .padding()
                
            Text("this is the primary window")
                .font(.title)
                .fontWeight(.light)
                
            Toggle("Open the secondary volume", isOn: $model.secondaryVolumeIsShowing)
                .toggleStyle(.button)
                .onChange(of: model.secondaryVolumeIsShowing) { _, isShowing in
                    if isShowing {
                        openWindow(id: "secondaryVolume")
                    } else {
                        dismissWindow(id: "secondaryVolume")
                    }
                }
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    PrimaryWindowView()
        .environment(ViewModel())
}
