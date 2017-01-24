---
layout: cta
drip: rubymotion
title: IGListKit Tutorial RubyMotion Edition Part 1
categories:
- products
tags:
- rubymotion
- swift
- cocopods
- iglistkit
- uicollectionview
status: publish
published: true
image:
  feature: swift-tutorials-are-coming.png
---
[IGListKit](https://github.com/Instagram/IGListKit) popped up on my radar recently 
from a couple of entries in the [iOS Dev Weekly](https://iosdevweekly.com/issues/282?sid=LeumXTm#start) 
newsletter. Digging further led me to the [IGListKit Tutorial](https://www.raywenderlich.com/147162/iglistkit-tutorial-better-uicollectionviews)
on Ray Wenderlich's site (again). While these tutorials are instructive posts to read,
I frequently run into frustrating, hair-pulling-out inconsistencies that make it very 
difficult to go ahead and use this information in [RubyMotion](http://rubymotion.com).
And, as is true of most new tutorials, it is written using Swift, instead of Objective C. 

![](/img/original/no-idea.jpg){: .img-responsive .center-block}

Swift undoubtedly comprises the lion's share of all new iOS, macOS, tvOS, and 
watchOS tutorials.
So if you are using RubyMotion like me (or still plinking away on Objective C), you
must learn how to read and translate Swift. I've been a developer for a long
time, and so I've translated more algorithms than I care to remember from one language 
to another. If you don't already feel comfortable reading one language and translating 
to a different one, you should probably find another tutorial like this and try it out.
Translating from one language to another is a skill, and it's one you'll need to hone 
if you intend to continue your career as a developer. 

I decided to take this one and port it over to RubyMotion as an exercise for myself
and an illustration for those who might not know where to start. As expected, it was in 
places super-easy, and other places really, really frustrating, but eventually I got 
it all working.  And I learned a lot along the way.  So, let's walk through it together. 

### Starter App
First up, there is a "starting place" app. One that uses normal `UICollectionViews`. This looked quite straightforward, but all the UI customizations took me places I'd never been before. Implementing all those custom views was both time-consuming and informative. Now I have **ideas** about some custom UI stuff in my other projects that I just didn't feel confident enough about tackling before. You'll probably want to download my version of the [Marslink Starter](https://github.com/wndxlori/WNDXRubyMotion/releases/download/marslink-start/Marslink_Starter.tar.gz) and the [Swift version](https://koenig-media.raywenderlich.com/uploads/2016/12/Marslink_Starter.zip) as we walk through some of the details and compare.

The `CustomNavigationBar` was the most interesting part to me.  It's mostly a direct Swift -> RubyMotion translation.  There's a lot of code massaging (`CGPoint` -> `'CGPointMake`, `UIBezierPath` -> `UIBezierPath.bezierPath`, etc). And I didn't really agree at first with the recursive use of `DispatchQueue` at the end of the `updateStatus` method for the "pulsing" status indicator:

```swift
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
      self.updateStatus()
    }
```

So I replaced the initial call to `update_status` at the bottom of the `initWithFrame` with a scheduled, repeating `NSTimer` :

```ruby
      NSTimer.scheduledTimerWithTimeInterval(0.6,
       target: self, 
       selector: :update_status, 
       userInfo: nil, 
       repeats: true)
```

That didn't really work consistently.  When I was scrolling the list of entries, it would stop flashing. So I ended up back where I started, once I was directed to the documentation for the [`Dispatch` Module](https://github.com/MacRuby/MacRuby/wiki/Dispatch-Module), and it looked like this:

```ruby
Dispatch::Queue.main.after(0.6) { self.update_status }
```

We end up with something that has a totally unique look, and working through that code was quite enlightening.

The only other thing I really struggled with translating was the somewhat odd "systems", a directory filled with a combination of model aggregators, or as we like to call them... store classes, and utility classes.  I'm not sure if there is an exact RubyMotion equivalent of the Swift "struct", but since most of this stuff was clearly throw-away utility code, in the end I decided not to worry too much about "proper" translation, and just wrote some equivalent classes that accomplished the same results.

I was pretty pleased with the implementation of `TextSize` though, once I figured out what the `TextSize.CachEntry` was supposed to do:

```swift
  fileprivate struct CacheEntry: Hashable {
    let text: String
    let font: UIFont
    let width: CGFloat
    let insets: UIEdgeInsets
    
    fileprivate var hashValue: Int {
      return text.hashValue ^ Int(width) ^ Int(insets.top) ^ Int(insets.left) ^ Int(insets.bottom) ^ Int(insets.right)
    }
  }
  
  private func ==(lhs: TextSize.CacheEntry, rhs: TextSize.CacheEntry) -> Bool {
  return lhs.width == rhs.width && lhs.insets == rhs.insets && lhs.text == rhs.text
}

```

That was trivial to implement in Ruby:

```ruby
  CacheEntry = Struct.new(:text, :font, :width, :insets)
```

This is exactly why you need to practice translating from one language to another. Sometimes the end result will be a lot uglier, and sometimes you'll find a beautifully simple way to replace a pile of ugly code with something considerably more elegant.

----
![http://www.csmonitor.com/USA/USA-Update/2016/0414/Florida-mulls-second-hunt-to-deal-with-a-bear-of-a-problem](/img/original/bear-problem.jpg){: .img-responsive .center-block}

Before we leave the "starter" app, I should take time to point out one real bear of a problem that cropped up several times in different classes, caused by translating code literally from Swift to RubyMotion. Here is some Swift code:

```swift
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    contentView.addSubview(label)
  }
```

And the equivalent in RubyMotion:

```ruby
  def initWithFrame(frame)
    super
    contentView.backgroundColor = "#0c1f3f".to_color
    contentView.addSubview(create_label)
  end
```

Those seem pretty straighforward. **Do you see the bug?**  

Ya, I didn't either.  Lots of obscure, seemingly unrelated "unrecognized selector" crashes later, I finally figured it out.

```ruby
  def initWithFrame(frame)
    super
    contentView.backgroundColor = "#0c1f3f".to_color
    contentView.addSubview(create_label)
    self
  end
```

I'm not entirely sure how Swift gets away with not having an explicit return value, but their code works without it and mine crashed, because there was a `UIView` popping up where a `UICollectionViewCell` was expected. The `initWithFrame` method IS actually expected to "return a newly allocated view object with the specified frame rectangle", so I should have had that return `self` in there to start.  It was the copy/paste/modify that tripped me up.

The end result is here - [Marslink Starter](https://github.com/wndxlori/WNDXRubyMotion/releases/download/marslink-start/Marslink_Starter.tar.gz).  This is where we needed to be to START the tutorial.  Phew! That was a lot of work, so I'll finish up the rest of the tutorial in [Part 2](/blog/iglistkit-tutorial-part-2/).
