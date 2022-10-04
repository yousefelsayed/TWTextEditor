# TWTextEditor


<p align="row">
<img src= "https://media.giphy.com/media/8126LNcT9QCSmVX2z4/giphy.gif" width="400" >
</p>

## Features

- [x] Count the number of characters based on twitter criteria 


## Requirements

- iOS 13.0+


## Installation

### Add TWTextEditor framework to your project

Add the following lines to your `Package.swift` or use Xcode “Add Package Dependency…” menu.

```swift
// In your `Package.swift`

dependencies: [
    .package(name: "TWTextEditor", url: "https://github.com/yousefelsayed/TWTextEditor", ...),
    ...
],
targets: [
    .target(
        name: ...,
        dependencies: [
            .product(name: "TWTextEditor", package: "TWTextEditor"),
            ...
        ]
    ),
    ...
]
```


To get the full benefits import `TWTextEditor` wherever you import UIKit

``` swift
import UIKit
import TWTextEditor
```

```
github "github.com/yousefelsayed/TWTextEditor"
```

## Usage example

```swift
import TWTextEditor
```


