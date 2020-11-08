# NewsApp
IOS App using newsapi.org Open APIs

## Getting Started
### Installation or Setup
1. Just download the repo or clone the repo
2. Open Terminal and go inside the folder,e.g cd [path to inside the repo folder]
3. Type pod install
4. Go to the folder,Just open the .xcworkspace 

#### Note: To run the app you have to add [NewsAPI.org](https://newsapi.org/register) key. I have taken this step to due to limited access to daily request for News. Getting a key would take just few seconds :)

#### Setup API Key
1. Visit [NewsAPI.org](https://newsapi.org/register) to get your API Key
2. Copy your API Key from accounts section
3. Open project
   - Open Configs folder
   - Open Debug.xcconfig
   - Add the API Key here:
    ```
    API_KEY = ENTER_KEY_HERE
    ``` 
#### Libraries
- [RxSwift](https://github.com/ReactiveX/RxSwift) This is a Swift version of Rx.
- [Kingfisher](https://github.com/onevcat/Kingfisher) Kingfisher is a powerful, pure-Swift library for downloading and caching images from the web.
- [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager) Handle Keyboard and user inputs
- [MBProgressHUD](https://github.com/jdg/MBProgressHUD) MBProgressHUD is an iOS drop-in class that displays a translucent HUD with an indicator and/or labels while work is being done in a background thread. 
- [RxAlamofire](https://github.com/RxSwiftCommunity/RxAlamofire) RxAlamofire is a RxSwift wrapper around the elegant HTTP networking in Swift Alamofire.
- [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) Colorful, flexible, lightweight logging for Swift 3, Swift 4 & Swift 5.

### Todo

- [ ] Add other framework for Offline storage and use Type Erasure
  - [ ] Realm 
  - [ ] CoreData
  - [ ] Local File  
- [ ] Localization   
- [ ] Dark Mode  
- [ ] UI Improvement 
- [ ] Add Swiftlint to enforce Swift style and conventions.  
- [ ] Add filter option in source.
- [ ] Shift the change country feature to some better place.
- [ ] Pagination
- [ ] Change filter design from using actionsheet to using UIPageViewController for better UI/UX
- [ ] Implement BDD if possible
- [ ] Learn and implement RxTest
### In Progress
- [ ] Remove article from favourites 

### Done
- [x] Top headline
  - [x] Filter top headline using category
- [x] Search
- [x] Article View
  - [x] Share feature Implement
- [x] Favourites
- [x] Change country
- [x] Save favourited articles to UserDefaults


### Any comments or feedback for improvement of codebase is highly appreciated.
 
### Happy Coding
