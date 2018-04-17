# SWLoremPicsumSDK
Lorem Ipsum... but for photos. In Swift.

This is simple SDK written in Swift that allows to easy get photos from https://picsum.photos/

## Usage

It is really simple. You can access an API like this:

```swift
PhotoWebService().photo(photoId: "5", width: 200, height: 500) { result in
    switch result {
    case .success(let image):
        print("👻 Recived image: \(image)")
        // do something with the image
    case .failure(let error):
        // this means there was a some problem with request
    }
}
```

## Sample Project
I provided sample project in the repository. To use it download the repo and go to `Example` directory. Have fun!

## CocoaPods

For SWLoremPicsumSDK, use the following entry in your Podfile:

```rb
pod 'SWLoremPicsumSDK'

```

Then run `pod install`.

In any file you'd like to use SWLoremPicsumSDK in, don't forget to
import the framework with `import SWLoremPicsumSDK`.

## License

SWLoremPicsumSDK is released under an MIT license. See [License.md](https://github.com/swojtyna/SWLoremPicsumSDK/blob/develop/LICENSE) for more information.
