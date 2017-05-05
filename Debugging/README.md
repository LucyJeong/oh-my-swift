# Xcode Debugging
![debugging](http://origin.webcdn.theblackdesertonline.net/forum/service_live/monthly_02_2016/Stick_figure_waiting.jpg.1cc524488322611bb0f0c318956745ce.jpg)
## Summary
* :large_orange_diamond: warnings - issues identified by the complier that __Might cause problems__ or have __unintended side-effect__ on your running application
* :red_circle: errors - issues identified by the complier that __Must be fixed__ prior to running your application
* Debugging tip1 : Don't panic!
* Debugging Lingo
  * When solving (and sharing) bugs, it is important to know the right lingo! Being able to describe your bug precisely is key (especially when talking to developers)!
  * __logic error__: a bug in a program that causes it to operate incorrectly, but not to terminate abnormally (or crash)
  * __runtime errors__: issues that occur while your application is running—these can be logic errors or errors that cause your application to crash
  * __software bug__: an error, flaw, failure, or fault in a computer program or system that causes it to produce an incorrect or unexpected result, or to behave in unintended ways
  * __static (or compilation) errors__: issues identified by the compiler that must be fixed prior to running your application
  * __warning__: issues that might cause problems or have unintended side-effects on your running application
![ninja](https://s3.amazonaws.com/content.udacity-data.com/courses/ud774/debugging-ninja.png)
* __The Debugging Process__
![debuggingprocess](/Debugging/process.png)
  * 문제를 재현하기
    * 어떤 경우에는 버튼이 클릭된 다음 바로 발생할 수 있지만 앱이 실행된지 30분후에 발생하는 버그도 있다.
    * 가장 중요한 것은, 그 문제를 재현할 수 없다면, 문제를 이해할 수 없고 즉, 버그를 고칠 수 없다.
  * 디버그 정보 모으기
    * 로그, 프로그램 상태, ...
    * 변수의 값이 무엇인가?
    * 어떤 종류의 에러인가? (ex. EXC_BAD_ACCESS)
    * 에러가 코드의 어느 라인인가?
    * 어떤 함수 혹은 메소드가 에러를 이끄는가?
  * 가설을 세운다 -> Try a Fix or 디버그 정보 모으기로 다시 돌아간다
* Print Debugging
  * only use print statements to debug
  * Short cut - Quick Search : Cmd + Shift + O
```swift
override var description: String {
    return "PrintBugViewController contains \(bugs.count) bugs\n"
}

override var debugDescription: String {
    var index = 0
    var debugString = "PrintBugViewController contains \(bugs.count) bugs...\n"
    for bug in bugs {
        debugString = debugString + "bug\(index): \(bug.frame)\n"
        index += 1
    }
    return debugString
}

//using
debugPrint()
```
* Advanced Print Debugging: Logging
  * 로그 메시지를 메모리 및 디스크로 효율적으로 캡처합니다. 로깅 동작 및 지속성을 관리합니다.
  * Unified logging is available in iOS 10.0 and later, macOS 10.12 and later, tvOS 10.0 and later, and watchOS 3.0 and later
  * log messages were written to specific locations on disk, such as /etc/system.log.
    * by [Apple Developer: Logging]

    Level | Constant | Behavior
    ------| ------------------- | --------
    Default | OS_LOG_TYPE_DEFAULT | 이 레벨을 사용하면 실패 할 수있는 사항에 대한 정보를 캡처 할 수 있습니다.
    Info | OS_LOG_TYPE_INFO | 이 수준을 사용하면 오류를 해결하는 데 도움이 될 수 있지만 에러를 고치는데 필수적인 것은 아닙니다.
    Debug | OS_LOG_TYPE_DEBUG | 디버그 수준 메시지는 구성 변경을 통해 디버그 로깅을 사용하도록 설정 한 경우에만 메모리에 캡처됩니다. 구성의 지속성 설정에 따라 제거됩니다. 이 레벨에 기록 된 메시지에는 개발 중에 또는 특정 문제점을 해결하는 동안 유용한 정보가 들어 있습니다. 디버그 로깅은 출하 소프트웨어가 아닌 개발 환경에서 사용하기위한 것입니다.
    Error | OS_LOG_TYPE_ERROR | Error-level 메시지는 항상 데이터 저장소에 저장됩니다. 저장소 할당량이 초과 될 때까지이 위치에 남아 있습니다. 가장 오래된 메시지가 제거됩니다. Error-level 메시지는 process-level Error를 보고하기위한 것입니다.
    Fault | OS_LOG_TYPE_FAULT | Fault-level 메시지는 항상 데이터 저장소에 저장됩니다.
