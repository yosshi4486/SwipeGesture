import SwiftUI

extension View {
    
    public func onSwipe(leftAction: (() -> Void)?,
                        rightAction: (() -> Void)?,
                        upAction: (() -> Void)?,
                        downAction: (() -> Void)?) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: leftAction,
                     onSwipeRight: rightAction,
                     onSwipeUp: upAction,
                     onSwipeDown: downAction)
    }
    
}

struct SwipeGesture<Content> : UIViewControllerRepresentable where Content : View {
    
    var content: Content
    var onSwipeLeft: (() -> Void)?
    var onSwipeRight: (() -> Void)?
    var onSwipeUp: (() -> Void)?
    var onSwipeDown: (() -> Void)?

    func makeUIViewController(context: Context) -> UIHostingController<Content> {
        let hostingController = UIHostingController(rootView: content)
        hostingController.view.backgroundColor = .clear
        
        if onSwipeLeft != nil {
            let left = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeLeft))
            left.direction = .left
            hostingController.view.addGestureRecognizer(left)
        }

        if onSwipeRight != nil {
            let right = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeight))
            right.direction = .right
            hostingController.view.addGestureRecognizer(right)
        }

        if onSwipeUp != nil {
            let up = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeUp))
            up.direction = .up
            hostingController.view.addGestureRecognizer(up)
        }
        
        if onSwipeDown != nil {
            let down = UISwipeGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.swipeDown))
            down.direction = .down
            hostingController.view.addGestureRecognizer(down)
        }
        
        return hostingController
    }
    
    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: Context) {
        
    }
        
    func makeCoordinator() -> Coordinator {
        Coordinator(onSwipeLeft: self.onSwipeLeft,
                    onSwipeRight: self.onSwipeRight,
                    onSwipeUp: self.onSwipeUp,
                    onSwipeDown: self.onSwipeDown)
    }
    
    class Coordinator : NSObject {
        var onSwipeLeft: (() -> Void)?
        var onSwipeRight: (() -> Void)?
        var onSwipeUp: (() -> Void)?
        var onSwipeDown: (() -> Void)?

        init(onSwipeLeft: (() -> Void)?,
             onSwipeRight: (() -> Void)?,
             onSwipeUp: (() -> Void)?,
             onSwipeDown: (() -> Void)?) {
            self.onSwipeLeft = onSwipeLeft
            self.onSwipeRight = onSwipeRight
            self.onSwipeUp = onSwipeUp
            self.onSwipeDown = onSwipeDown
        }

        @objc func swipeLeft() {
            onSwipeLeft?()
        }
        
        @objc func swipeight() {
            onSwipeRight?()
        }
        
        @objc func swipeUp() {
            onSwipeUp?()
        }
        
        @objc func swipeDown() {
            onSwipeDown?()
        }
        
    }
}
