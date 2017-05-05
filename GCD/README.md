#GCD

## Summary
* GCD stands for Grand Central Dispatch
* __UIKit__: You can't run anything form UIKit in the background, or your app will crash __intermittently__.
* __Core data__: NSManageObjectContext can only be used in the same queue it was created.
 * 만약 콘텍스트를 메인 큐 안에서 생성했다면, 오직 메인큐 안에서만 사용해야하고, 백그라운드 큐에서 생성했다면 오직 백그라운드 큐에서만 사용해야한다.
* [Github](https://github.com/udacity/ios-nd-gcd)
