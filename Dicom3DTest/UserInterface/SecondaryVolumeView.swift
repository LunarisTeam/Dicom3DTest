import SwiftUI

struct SecondaryVolumeView: View {
    
    @Environment(ViewModel.self) private var model
    
    var body: some View {
    
        ZStack(alignment: .bottom) {
            StlView()
            
            Text("This is a volume")
                .padding()
                .glassBackgroundEffect(in: .capsule)
        }
        .onDisappear {
            model.secondaryVolumeIsShowing.toggle()
        }
        
    }
}

#Preview {
    SecondaryVolumeView()
        .environment(ViewModel())
}
