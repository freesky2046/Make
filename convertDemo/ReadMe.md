理解视图坐标系转换方法


1. 转换自己的子视图到兄弟视图坐标体系
2. 转换自己的子视图到父视图坐标体系

⚠️转换的一定是 frame.
    即包含两个要点
    1.当前frame所在的坐标系的视图 即要转换的 frame 的视图的superview
    2.目标视图可以是兄弟视图，也可以是父视图,也可以是祖先视图



```swift
let frameInbrotherView = superview.convert(view.frame, to:brotherview)
或
let frameInSuperSuperView =  superview.convert(view.frame, to:supersuperview)
```



