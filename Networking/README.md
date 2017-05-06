# iOS Networking with Swift

## Summary  
- 주로 사용하는 많은 앱들은 전부 네트워크를 사용하는 앱이다. 예) 페이스북, 유투브, 트의터 등등..
- Network? the global system of interconnected computer networks from which we can access data.
- Data? images, text, video, or any media that can be used by our apps.
- Protocol? a way of communicating; standard operating procedure; the rules for communication
- HTTP? (Hypertext Transfer Protocol) a protocol or “handshake” that defines how messages (and data) are sent and received by computers; the underlying protocol for the World Wide Web
- Client? a computer that requests data (or services) from a server
- Server? a computer that provides data (or services) to a client upon request
- HTTP request? a request for data (or a resource) that a client makes to a server; there are various types of HTTP requests called “HTTP methods”
- URL? (Uniform Resource Locator) — specifies the location for retrieving data over the web; can be thought of as the name of a file on the World Wide Web, because it usually refers to a file on some machine on the network
- HTTP method? specifies the type of HTTP request that is being made; in this course, we will also call these (HTTP) request types
- HTTP status code? a number returned in response to an HTTP request which indicates the result of the request; you may also hear these referred to as “response codes” or “status messages." [Here is a nice listing](https://httpstatuses.com/) of different HTTP status codes.
- HTTP GET request? a type of HTTP request where a client requests a specified resource from a server
- [URLSessionTask](https://developer.apple.com/reference/foundation/urlsessiontask) : URL sessions provide three types of tasks: data tasks, upload tasks, and download tasks. Network request are know as "task"
```swift
override func viewDidLoad() {
    super.viewDidLoad()

    let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!

    let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in

        if error == nil {
            let downloadImage = UIImage(data: data!)

            performUIUpdatesOnMain {
              self.imageView.image = downloadImage
            }
        }
    }
    task.resume()
}
```
- [Configuring App Transport Security](https://ste.vn/2015/06/10/configuring-app-transport-security-ios-9-osx-10-11/)
- Singleton? a special kind of object that can only be instantiated once
- URLSession? manages network requests for our app
- URLSessionConfiguration? specify settings (ex. timeout interval) for a NSURLSession
- URLSessionTask? a network task that can be executed
- URLSessionDataTask? subclass of NSURLSessionTask; downloads data directly into memory
- URLSessionDownloadTask? subclass of NSURLSessionTask; downloads data to a temporary file
- URLSessionUploadTask? subclass of NSURLSessionTask; specialized for uploading data
- URLResponse? a container for information about the response to a network request such its status code
