# UIImage.rotated

Extension for UIImage that returns the image rotated by X degrees

### Usage

Assuming you have the extension in your project, just call .rotated(byDegrees: X) to get the rotated image. 

```swift

guard let url = URL(string: "https://unsplash.it/300/200"),
  let imageData = try? Data(contentsOf: url),
  let originalImage = UIImage(data: imageData) else {
  fatalError("no image")
}
print(originalImage.size) // (300, 200)
if let rotatedImage = originalImage.rotated(byDegrees: 90) {
  print(rotatedImage.size) // (200, 300)
}

```

### TODO

- Publish as CocoaPod