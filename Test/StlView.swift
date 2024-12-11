import SwiftUI
import RealityKit

struct StlView: View {
    var body: some View {
        VStack(spacing: 18.0) {
            Model3D(named: "ImageToStl.com_iso") { model in
                switch model {
                case .empty:
                    ProgressView()
                    
                case .success(let resolvedModel3D):
                    resolvedModel3D
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .rotation3DEffect(.degrees(100), axis: (x: 1, y: 0, z: 0)) // Rotate 45° around the X-axis
                        .rotation3DEffect(.degrees(0), axis: (x: 0, y: 1, z: 0)) // Rotate 30° around the Y-axis
                        
                case .failure(let error):
                    Text(error.localizedDescription)
                    
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    StlView()
}
