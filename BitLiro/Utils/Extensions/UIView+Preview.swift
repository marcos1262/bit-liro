#if DEBUG
import UIKit
import SwiftUI

extension UIView {

    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView

        func makeUIView(context: Context) -> UIView { view }
        func updateUIView(_ uiView: UIView, context: Context) {}
    }

    func asPreview() -> some View {
        Preview(view: self)
    }
}
#endif
