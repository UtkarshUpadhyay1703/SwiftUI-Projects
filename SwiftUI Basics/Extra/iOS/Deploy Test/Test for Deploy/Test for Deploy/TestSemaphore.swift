//
//  TestSemaphore.swift
//  Test for Deploy
//
//  Created by admin on 12/13/23.
//

import SwiftUI

struct TestSemaphore: View {
        
    
    var body: some View {
        VStack{
            VStack {
                ProgressView() // Default style
                    .progressViewStyle(DefaultProgressViewStyle())
                
                ProgressView() // Circular style
                    .progressViewStyle(CircularProgressViewStyle())
                
                ProgressView() // Linear style
                    .progressViewStyle(LinearProgressViewStyle())
            }
                .scaleEffect(6.0)
        }
            .onAppear{
                let semaphore = DispatchSemaphore(value: 1)
                let activities = [
                    { // Kid 1
                        firstFunc(semaphore: semaphore)
                        

                    },
                    { // Kid 2
                        print("Kid 2 - wait")
                        
                        semaphore.wait()
//                        DispatchQueue.global().sync {
                            DispatchQueue.global().async {
                                
                                print("Kid 2 - wait finished")
                                sleep(2) // Kid 2 playing with iPad
                                
                                print("Kid 2 - done with iPad")
                                semaphore.signal()
                            }
                            
//                        }
//                        semaphore.signal()

                    },
                    { // Kid 3
                        print("Kid 3 - wait")
                        semaphore.wait()
                        print("Kid 3 - wait finished")
//                        sleep(1) // Kid 3 playing with iPad
                        semaphore.signal()
                        print("Kid 3 - done with iPad")
                    }
                ]
                
                executeActivities(in: activities)
            }
    }
    
    func firstFunc(semaphore: DispatchSemaphore){
        print("Kid 1 - wait")
        semaphore.wait()

//                        DispatchQueue.global().sync {
            DispatchQueue.global().async {
                print("Kid 1 - wait finished")
                sleep(4) // Kid 1 playing with iPad
                
                print("Kid 1 - done with iPad")
                semaphore.signal()
            }
            
//                        }
    }
    
    func executeActivities(in order: [() -> Void]) {
        for activity in order {
            DispatchQueue.global().sync {
                activity()
            }
        }
    }
}

struct TestSemaphore_Previews: PreviewProvider {
    static var previews: some View {
        TestSemaphore()
    }
}
