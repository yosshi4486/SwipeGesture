//: # Samples of SwipeGesture

import SwiftUI
import SwipeGesture
import PlaygroundSupport

/*:
 ## General API of swipe gesture.
 */
struct SampleView1 : View {
    
    var body: some View {
        Text("Hello! Swipe Gesture Sample1!")
            .onSwipe {
                print("left")
            } rightAction: {
                print("right")
            } upAction: {
                print("up")
            } downAction: {
                print("down")
            }
    }
    
}

// Sample1
PlaygroundPage.current.setLiveView(SampleView1())

/*:
 ## Convenience API by each swipe direction.
 */

struct SampleView2 : View {
    
    var body: some View {
        Text("Hello! Swipe Gesture Sample2!")
            .onSwipeLeft {
                print("left")
            }
    }
    
}

// Sample2
PlaygroundPage.current.setLiveView(SampleView2())

