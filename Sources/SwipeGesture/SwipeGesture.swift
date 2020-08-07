import SwiftUI

extension View {
    
    func onSwipe(leftAction: @escaping () -> Void = {}, rightAction: @escaping () -> Void = {}) -> some View {
        SwipeGesture(content: self, onSwipeLeft: leftAction, onSwipeRight: rightAction)
    }
    
}

struct SwipeGesture<Content> : UIViewControllerRepresentable where Content : View {
    
    var content: Content
    var onSwipeLeft: () -> Void
    var onSwipeRight: () -> Void
    
    func makeUIViewController(context: Context) -> UIHostingController<Content> {
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        
        let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeRightToLeft))
        left.direction = .left
        
        let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeLeftToRight))
        right.direction = .right
        
        hostingController.view.addGestureRecognizer(left)
        hostingController.view.addGestureRecognizer(right)
        
        return hostingController
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: Context) {
        
    }
        
    func makeCoordinator() -> Coordinator {
        Coordinator(onSwipeLeft: self.onSwipeLeft, onSwipeRight: self.onSwipeRight)
    }
    
    class Coordinator : NSObject {
        var onSwipeLeft: () -> Void
        var onSwipeRight: () -> Void
        
        init(onSwipeLeft: @escaping () -> Void, onSwipeRight: @escaping () -> Void) {
            self.onSwipeLeft = onSwipeLeft
            self.onSwipeRight = onSwipeRight
        }

        @objc func swipeRightToLeft() {
            onSwipeLeft()
        }
        
        @objc func swipeLeftToRight() {
            onSwipeRight()
        }
        
    }
}
