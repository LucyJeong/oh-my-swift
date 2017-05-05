# GCD

## Summary
* GCD stands for Grand Central Dispatch
* __UIKit__: You can't run anything form UIKit in the background, or your app will crash __intermittently__.
* __Core data__: NSManageObjectContext can only be used in the same queue it was created.
 * 만약 콘텍스트를 메인 큐 안에서 생성했다면, 오직 메인큐 안에서만 사용해야하고, 백그라운드 큐에서 생성했다면 오직 백그라운드 큐에서만 사용해야한다.
* 이미지를 다운로드하는 실습에서 동기로 다운로드 하는 방법
```swift
@IBAction func synchronousDownload(_ sender: UIBarButtonItem) {

    // Get the URL for the image
    let url = URL(string: BigImages.seaLion.rawValue)

    // Obtain the NSData with the image
    let imgData = try? Data(contentsOf: url!)

    // Turn it into a UIImage
    let image = UIImage(data: imgData!)

    // Display it
    photoView.image = image
}
```
  * 이렇게 하면 앱스토어에서 반려당한다. 다운로드하는 동안 먹통이 되기 때문에!
* 비동기로 다운로드하는 방법 (Asynchronous Download)
```swift
// This method avoids blocking by creating a new queue that runs
// in the background, without blocking the UI.
@IBAction func simpleAsynchronousDownload(_ sender: UIBarButtonItem) {

    // Get the URL for the image
    let url = URL(string: BigImages.shark.rawValue)

    // create a queue from scratch
    let downloadQueue = DispatchQueue(label: "download", attributes: [])

    // call dispatch async to send a closure to the downloads queue
    downloadQueue.async { () -> Void in

        // download Data
        let imgData = try? Data(contentsOf: url!)

        // Turn it into a UIImage
        let image = UIImage(data: imgData!)

        // display it
        DispatchQueue.main.async(execute: { () -> Void in
            self.photoView.image = image
        })
    }
}
```
* Completion Closure : 항상 handler는 메인큐에서 작동한다! 하지만 써드파티에서 라이브러리를 가져올 때, Completion handler를 가지고 있다면 문서를 꼭 확인해야한다. handler가 어디서 실행되는지!
```swift
// This code downloads the huge image in a global queue and uses a completion closure.
func withBigImage(completionHandler handler: @escaping (_ image: UIImage) -> Void){

    DispatchQueue.global(qos: .userInitiated).async { () -> Void in

        if let url = URL(string: BigImages.whale.rawValue), let imgData = try? Data(contentsOf: url), let img = UIImage(data: imgData) {

            // all set and done, run the completion closure!
            DispatchQueue.main.async(execute: { () -> Void in
                handler(img)
            })
        }
    }
}
```
* [Closure Syntax](http://www.goshdarnclosuresyntax.com/)
* [Github](https://github.com/udacity/ios-nd-gcd)
