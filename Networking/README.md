# iOS Networking with Swift

## Lesson 2: Using Web Services and APIs
- __Network__ the global system of interconnected computer networks from which we can access data.
- __Data__ images, text, video, or any media that can be used by our apps.
- __Protocol__ a way of communicating; standard operating procedure; the rules for communication
- __HTTP__ (Hypertext Transfer Protocol) a protocol or “handshake” that defines how messages (and data) are sent and received by computers; the underlying protocol for the World Wide Web
- __Client__ a computer that requests data (or services) from a server
- __Server__ a computer that provides data (or services) to a client upon request
- __HTTP request__ a request for data (or a resource) that a client makes to a server; there are various types of HTTP requests called “HTTP methods”
- __URL__ (Uniform Resource Locator) — specifies the location for retrieving data over the web; can be thought of as the name of a file on the World Wide Web, because it usually refers to a file on some machine on the network
- __HTTP method__ specifies the type of HTTP request that is being made; in this course, we will also call these (HTTP) request types
- __HTTP status code__ a number returned in response to an HTTP request which indicates the result of the request; you may also hear these referred to as “response codes” or “status messages." [Here is a nice listing](https://httpstatuses.com/) of different HTTP status codes.
- __HTTP GET request__ a type of HTTP request where a client requests a specified resource from a server
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
- __Singleton__ a special kind of object that can only be instantiated once
- __URLSession__ manages network requests for our app
- __URLSessionConfiguration__ specify settings (ex. timeout interval) for a NSURLSession
- __URLSessionTask__ a network task that can be executed
- __URLSessionDataTask__ subclass of NSURLSessionTask; downloads data directly into memory
- __URLSessionDownloadTask__ subclass of NSURLSessionTask; downloads data to a temporary file
- __URLSessionUploadTask__ subclass of NSURLSessionTask; specialized for uploading data
- __URLResponse__ a container for information about the response to a network request such its status code
- __URL escaping/encoding__ a mechanism for ensuring that all characters in a URL are valid ASCII characters
- __Serialization__ 말그대로 객체를 직렬화하여 전송 가능한 형태로 만드는 것을 의미한다. 객체들의 데이터를 연속적인 데이터로 변형하여 Stream을 통해 데이터를 읽도록 해준다. 이것은 주로 객체들을 통째로 파일로 저장하거나 전송하고 싶을 때 주로 사용된다.
- __Deserialization__ 말그대로 객체를 직렬화하여 전송 가능한 형태로 만드는 것을 의미한다. 객체들의 데이터를 연속적인 데이터로 변형하여 Stream을 통해 데이터를 읽도록 해준다. 이것은 주로 객체들을 통째로 파일로 저장하거나 전송하고 싶을 때 주로 사용된다.
- __JSONSerialization__  a class used to convert bytes of JSON data into objects or vice versa
- Between App and Server
1. The client contacts the server and tries to use the flickr.galleries.getPhotos method to get some (URLs of) photos.
2. The server returns a JSON object that contains locations of photos in the specified gallery.
3. The client randomly chooses something out of that JSON object, attempts to download the image from that randomly chosen URL, and displays it."

- URLComponents
```swift
import Foundation

var components = URLComponents()
components.scheme = "https"
components.host = "api.flickr.com"
components.path = "/services/rest"
components.queryItems = [URLQueryItem]()

let queryItem1 = URLQueryItem(name: "method", value: "flickr.photos.search")
let queryItem2 = URLQueryItem(name: "api_key", value: "1234")
let queryItem3 = URLQueryItem(name: "text", value: "purple")

components.queryItems!.append(queryItem1)
components.queryItems!.append(queryItem2)
components.queryItems!.append(queryItem3)

print(components.url!)
```
