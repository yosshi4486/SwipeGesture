import SwiftUI

extension View {
    
    /// A modifier notifying swipe events.
    public func onSwipe(leftAction: (() -> Void)? = nil,
                        rightAction: (() -> Void)? = nil,
                        upAction: (() -> Void)? = nil,
                        downAction: (() -> Void)? = nil) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: leftAction,
                     onSwipeRight: rightAction,
                     onSwipeUp: upAction,
                     onSwipeDown: downAction)
    }
    
    /// A modifier notifying left swipe events.
    ///
    /// - Attention: Since the modifier wrap content by UIHostingViewController, you might wrap the content excessively if you use convenience APIs. I recommend to use general API for adopting multi direction.
    public func onSwipeLeft(perform action: @escaping () -> Void) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: action,
                     onSwipeRight: nil,
                     onSwipeUp: nil,
                     onSwipeDown: nil)
    }
    
    /// A modifier notifying right swipe events.
    ///
    /// - Attention: Since the modifier wrap content by UIHostingViewController, you might wrap the content excessively if you use convenience APIs. I recommend to use general API for adopting multi direction
    public func onSwipeRight(perform action: @escaping () -> Void) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: nil,
                     onSwipeRight: action,
                     onSwipeUp: nil,
                     onSwipeDown: nil)
    }
    
    /// A modifier notifying up swipe events.
    ///
    /// - Attention: Since the modifier wrap content by UIHostingViewController, you might wrap the content excessively if you use convenience APIs. I recommend to use general API for adopting multi direction
    public func onSwipeUp(perform action: @escaping () -> Void) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: nil,
                     onSwipeRight: nil,
                     onSwipeUp: action,
                     onSwipeDown: nil)
    }

    /// A modifier notifying down swipe events.
    ///
    /// - Attention: Since the modifier wrap content by UIHostingViewController, you might wrap the content excessively if you use convenience APIs. I recommend to use general API for adopting multi direction
    public func onSwipeDown(perform action: @escaping () -> Void) -> some View {
        SwipeGesture(content: self,
                     onSwipeLeft: nil,
                     onSwipeRight: nil,
                     onSwipeUp: nil,
                     onSwipeDown: action)
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
        
        // Checking nullabilities for safety. As SwiftUI is still buggy, safety is worth.
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

// Althogh library items are registered, Details are not previewed.
@available (iOS 14, *)
public struct SwipeGesture_Library<ContentView : View> : LibraryContentProvider {

    @LibraryContentBuilder
    public func modifiers(base: ContentView) -> [LibraryItem] {
        LibraryItem(base.onSwipeLeft(perform: {
            
        }))
        
        LibraryItem(base.onSwipeRight(perform: {
            
        }))
        
        LibraryItem(base.onSwipeUp(perform: {
            
        }))

        LibraryItem(base.onSwipeDown(perform: {
            
        }))
        
        LibraryItem(base.onSwipe(leftAction: {
            
        }, rightAction: {
            
        }, upAction: {
            
        }, downAction: {
            
        }))

    }
    
}
