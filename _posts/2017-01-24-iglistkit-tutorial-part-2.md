---
layout: cta
drip: rubymotion
title: IGListKit Tutorial RubyMotion Edition Part 2
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
---
Ok, if you are just joining us, this is Part 2 of the IGListKit Tutorial, RubyMotion edition.  You should start with [Part 1](/blog/iglistkit-tutorial-rubymotion-edition/), if you are interested in the mechanics of the Swift -> RubyMotion translation of the [starter app](https://github.com/wndxlori/WNDXRubyMotion/releases/download/marslink-start/Marslink_Starter.tar.gz). And you really, really should read the source tutorial for [IGListKit](https://www.raywenderlich.com/147162/iglistkit-tutorial-better-uicollectionviews) before you start, because I'm skipping over the boring parts where I can.

To continue, now that we have the [starter app](https://github.com/wndxlori/WNDXRubyMotion/releases/download/marslink-start/Marslink_Starter.tar.gz) working, we can proceed with the [IGListKit Tutorial](https://www.raywenderlich.com/147162/iglistkit-tutorial-better-uicollectionviews) from Ray Wenderlich's site. While these tutorials are instructive posts to read, I frequently run into frustrating, hair-pulling-out inconsistencies that make it very difficult to go ahead and use this information in [RubyMotion](http://rubymotion.com). And, as is true of most new tutorials, it is written using Swift, instead of Objective C.  

I'm not going to repeat that whole NASA "shtick" from the tutorial, so you should refer back there to review the details it you get lost as to what we are implementing.  The focus of the tutorial is:
 
> [IGListKit](https://github.com/Instagram/IGListKit) was created to make feature-creep and massive-view-controllers a thing of the past when working with UICollectionView. By creating lists with IGListKit, you can build apps with decoupled components, blazing-fast updates, and support for any type of data.
In this tutorial you will refactor a basic UICollectionView to use IGListKit, then extend the app and take it out of this world!

So basically we have the Marslink app with it's bog standard `UICollectionView` displaying journal entries in a feed. The end goal is to add new information to the feed, including a weather update, and a "real time" chat.

### Replacing a UICollectionView with IGListKit

Instead of re-writing, we create a brand new controller (update the `app_delegate` to use the new controller), and then implement the original feed with journal entries, but this time instead of  `UICollectionView`, we use `IGListCollectionView` and `IGListAdapter`. 

In Swift, they set up the Journal Entries, and the `IGListKit` objects like so:

```swift
  let loader = JournalEntryLoader()
  let collectionView: IGListCollectionView = {
    let view = IGListCollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    view.backgroundColor = UIColor.black
    return view
  }()
  lazy var adapter: IGListAdapter = {
    return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
  }()
```
And in RubyMotion, that translates to:

```ruby
  def loader
    JournalEntryLoader.shared
  end

  def create_collection_view
    @collection_view = IGListCollectionView.alloc.initWithFrame(CGRectZero, collectionViewLayout: UICollectionViewFlowLayout.new).tap do |view|
      view.backgroundColor = UIColor.blackColor
    end
  end

  def create_adapter
    @adapter = IGListAdapter.alloc.initWithUpdater(IGListAdapterUpdater.new, viewController: self, workingRangeSize: 0)
  end
```

The creation of the `IGListAdapter` had me stymied for a short while. For some reason `initWithUpdater` just never occurred to me as the properly translated constructor from the Swift constructor `IGListAdapter(updater: IGListAdapterUpdater()...`. That's a fairly important pattern to recognize, when translating from RubyMotion to Swift and vis versa.  There's one more example later on that tripped me up as well.

And then of course, we need to implement `IGListAdapterDataSource` protocol like this:

```swift
extension FeedViewController: IGListAdapterDataSource {
  // 1
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    return loader.entries
  }
 
  // 2
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    return JournalSectionController()
  }
 
  // 3
  func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
}
```

and once again in RubyMotion:

```ruby
  def objectsForListAdapter(_)
    loader.entries
  end

  def listAdapter(_, sectionControllerForObject: object)
    JournalEntrySectionController.new
  end

  def emptyViewForListAdapter(_)
    nil
  end
```

I have conflated two steps here, and already included the initial section controller implementation, but before we check out that section controller, I'll mention that I renamed our RubyMotion section controller class for journal entries for a reason that will reveal itself shortly.

### Create your first section controller

Ok, the first `IGListSectionController`. These are honestly not that interesting in this first step, where we've mostly just refactored the methods of `UICollectionViewDataSource` out of our feed controller, and into the section controller in it's implementation of the `IGListSectionType` protocol.

```swift
extension JournalSectionController: IGListSectionType {
  func numberOfItems() -> Int {
    return 2
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext, let entry = entry else { return .zero }
    let width = context.containerSize.width

    if index == 0 {
      return CGSize(width: width, height: 30)
    } else {
      return JournalEntryCell.cellSize(width: width, text: entry.text)
    }
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cellClass: AnyClass = index == 0 ? JournalEntryDateCell.self : JournalEntryCell.self
    let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)

    if let cell = cell as? JournalEntryDateCell {
      cell.label.text = "SOL \(solFormatter.sols(fromDate: entry.date))"
    } else if let cell = cell as? JournalEntryCell {
      cell.label.text = entry.text
    }
    return cell
  }
  
  func didUpdate(to object: Any) {
    entry = object as? JournalEntry
  }
  
  func didSelectItem(at index: Int) {}
}
``` 

and in RubyMotion, this looks like:

```ruby
 def numberOfItems
    2
  end

  def sizeForItemAtIndex(index)
    return CGRectZero unless collectionContext && entry
    width = collectionContext.containerSize.width
    if index == 0
      CGSizeMake(width, 30)
    else
      JournalEntryCell.cell_size(width, self.entry.text)
    end
  end

  def cellForItemAtIndex(index)
    cell_class = index == 0 ? JournalEntryDateCell.self : JournalEntryCell.self
    cell = collectionContext.dequeueReusableCellOfClass(cell_class, forSectionController: self, atIndex: index)
    if cell.instance_of? JournalEntryDateCell
      cell.label.text = "SOL #{sol_formatter.sols(self.entry.date)}"
    elsif cell.instance_of? JournalEntryCell
      cell.label.text = self.entry.text
    end
    cell
  end

  def didUpdateToObject(object)
    self.entry = object
  end

  def didSelectItemAtIndex(_)
  end
```

If those look pretty much identical, it's because they are. The only thing I found interesting here, is the disappearance of the call to register the `UICollectionViewCells`. I have to assume `IGListKit` takes care of that somewhere, automagically.  Since that `registerClass` always struck me as a bit of boilerplate code, I'm totally down with that.

I'm not going to go thru every line of code and detail.  Refer back to Ray's [tutorial](https://www.raywenderlich.com/147162/iglistkit-tutorial-better-uicollectionviews) for that. Once we have all the models and stuff set up, our app should be runnable again, with our new and improved `IGListCollectionView`.  

### Add Messages

Next step is to finally start adding the new features, starting with the chat feature.  We'll need to add an entirely new set of collection view cells to display these messages, and a new section controller for them.

The section controller for messages looks quite similar to the one for journal entries.  I'll just highlight the differences.  Our model changes from `entry` to `message`. We only have one type of cell here, so `numberOfItems` returns 1. And the remaining two methods, `sizeForItemAtIndex` and `cellForItemAtIndex` are just simplified clones from the other section controller:

```swift
  func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return .zero }
    return MessageCell.cellSize(width: context.containerSize.width, text: message.text)
  }
  
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(of: MessageCell.self, for: self, at: index) as! MessageCell
    cell.messageLabel.text = message.text
    cell.titleLabel.text = message.user.name.uppercased()
    return cell
  }
```

 which in RubyMotion, appear as:
 
```ruby
  def sizeForItemAtIndex(index)
    return CGRectZero unless collectionContext && message
    MessageCell.cell_size(collectionContext.containerSize.width, self.message.text)
  end

  def cellForItemAtIndex(index)
    cell = collectionContext.dequeueReusableCellOfClass(MessageCell.self, forSectionController: self, atIndex: index)
    cell.message_label.text = self.message.text
    cell.title_label.text = self.message.user.name.upcase
    cell
  end
```

The implementation of `MessageCell` is not that different from `JournalEntryCell`, but it does have 3 `UILabels`, so layout is a bit more complex.  In Swift:

```swift
  override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = CGRect(x: CommonInsets.left, y: 0, width: bounds.width - CommonInsets.left - CommonInsets.right, height: MessageCell.titleHeight)
    statusLabel.frame = CGRect(x: bounds.width - 80, y: 4, width: 70, height: 18)
    let messageFrame = CGRect(x: 0, y: titleLabel.frame.maxY, width: bounds.width, height: bounds.height - MessageCell.titleHeight)
    messageLabel.frame = UIEdgeInsetsInsetRect(messageFrame, CommonInsets)
  }
```

and RubyMotion:

```ruby
  def layoutSubviews
    super
    title_label.frame = CGRectMake(Theme::CommonInsets.left, 0, bounds.size.width - Theme::CommonInsets.left - Theme::CommonInsets.right, MessageCell::TITLE_HEIGHT)
    status_label.frame = CGRectMake(bounds.size.width - 80, 4, 70, 18)
    message_frame = CGRectMake(0, CGRectGetMaxY(title_label.frame), bounds.size.width, bounds.size.height - MessageCell::TITLE_HEIGHT)
    message_label.frame = UIEdgeInsetsInsetRect(message_frame, Theme::CommonInsets)
  end
```

The only thing to trip you up here was the `titleLabel.frame.maxY` which becomes `CGRectGetMaxY(title_label.frame)`.  The constant need to translate `bounds.width` or `bounds.height` to `bounds.size.width` and `bounds.size.height` was aggravating, but not difficult to spot and correct.

We still have to add those messages to the main feed.  So back in `FeedController`, you will need to add the messages from Pathfinder to the journal entries.

```swift
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    var items: [IGListDiffable] = pathfinder.messages
    items += loader.entries as [IGListDiffable]
    return items
  }  
```

That `IGListDiffable` protocol requires the implementation of two methods.  In Swift, they patched those onto `NSObject`

```swift
extension NSObject: IGListDiffable {
  public func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  public func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
    return isEqual(object)
  }
}
```

I suppose I could have monkey-patched NSObject like that, but instead, I created a module `DiffableProtocol`

```ruby
module DiffableProtocol
  def diffIdentifier
    self
  end
  def isEqualToDiffableObject(object)
    isEqual(object)
  end
end
```

and then included that module into all the models, for instance:

```ruby
class Message < NSObject
  include DiffableProtocol
```

Finally letting us get to our `FeedController`, to update `objectsForListAdapter`

```ruby
 def objectsForListAdapter(_)
    pathfinder.messages + loader.entries
 end
```
Now I mentioned earlier that I renamed the section controller for `JournalEntries`.  That was so I could be unspeakably clever (ok, ok, a little clever) with the update to `listAdapter:sectionControllerForObject`. Now that we have 2 different kinds of feed items, we need to decide which section controller to construct.

```swift
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    if object is Message {
      return MessageSectionController()
    } else {
      return JournalSectionController()
    }
  }
```
And who wants to code an `if` statement, when you can just interpolate the section controller from the model it's controlling?

```ruby
  def listAdapter(_, sectionControllerForObject: object)
    Object.const_get("#{object.class.name}SectionController").new
  end
```

### Add Weather

Ok, we are into the home stretch now.  We have 2 of the 3 different kinds of feed items displaying in our feed.  Next up, the Weather update.  It needs to display 2 different views of the same data.  One is collapsed, the other expanded.

There was a whole lot of complexity on the `Weather` model related to the `WeatherCondition`.  As it turns out, the final version of the app never actually used the weather condition, so I just stripped that out of my RubyMotion implementation.  I suppose if you are really keen, you can use that as an exercise, to add it back in and get it to display somewhere.

The data source for weather, `WxScanner` was pretty simple:

```swift
class WxScanner {
  let currentWeather = Weather(
    temperature: 6,
    high: 13,
    low: -69,
    date: Date(),
    sunrise: "05:42",
    sunset: "17:58",
    condition: .dustStorm
  )
}
```
and it's not that interesting in RubyMotion, either:

```ruby
class WxScanner
  def self.current_weather
    Weather.new(6, 13, -69, Time.now, "05:42", "17:58")
  end
end
```

It was at this point I started pondering using a single options hash parameter for these model constructors.  Sure would be nice to just have Ruby 2.0 keyword arguments.  Oh, well.  Another exercise to leave to the reader ;-)

Now, we'll create our `WeatherSectionController`, and it starts to get a little more interesting.  We'll need an instance variable to tell us if the weather is expanded or collapsed. And we need to make a couple other adjustments to `numberOfItems` (which increase when expanded), and `sizeForItemAtIndex` (which will vary, depending on expansion as well).

```swift
  var weather: Weather!
  var expanded = false
  
  override init() {
    super.init()
    inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
  }
}

// MARK: - IGListSectionType
extension WeatherSectionController: IGListSectionType {
  func didUpdate(to object: Any) {
    weather = object as? Weather
  }

  func numberOfItems() -> Int {
    return expanded ? 5 : 1
  }
  
  func sizeForItem(at index: Int) -> CGSize {
    guard let context = collectionContext else { return .zero }
    let width = context.containerSize.width
    if index == 0 {
      return CGSize(width: width, height: 70)
    } else {
      return CGSize(width: width, height: 40)
    }
  }
```

In RubyMotion, that looks like:

```ruby
  attr_accessor :weather, :expanded

  def init
    super
    self.expanded = false
    self.inset = UIEdgeInsetsMake(0,0,15,0)
    self
  end

  def didUpdateToObject(object)
    self.weather = object
  end

  def numberOfItems
    self.expanded ? 5 : 1
  end

  def sizeForItemAtIndex(index)
    return CGRectZero unless collectionContext
    width = collectionContext.containerSize.width
    if index == 0
      CGSizeMake(width, 70)
    else
      CGSizeMake(width, 40)
    end
  end
```

Then we get to the tricky part. When the section is tapped, we need to expand the section, and display all the detail cells, in addition to the summary cell.

```swift
  func cellForItem(at index: Int) -> UICollectionViewCell {
    let cellClass: AnyClass = index == 0 ? WeatherSummaryCell.self : WeatherDetailCell.self
    let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
    if let cell = cell as? WeatherSummaryCell {
      cell.setExpanded(expanded)
    } else if let cell = cell as? WeatherDetailCell {
      let title: String, detail: String
      switch index {
      case 1:
        title = "SUNRISE"
        detail = weather.sunrise
      case 2:
        title = "SUNSET"
        detail = weather.sunset
      case 3:
        title = "HIGH"
        detail = "\(weather.high) C"
      case 4:
        title = "LOW"
        detail = "\(weather.low) C"
      default:
        title = "n/a"
        detail = "n/a"
      }
      cell.titleLabel.text = title
      cell.detailLabel.text = detail
    }
    return cell
  }

  func didSelectItem(at index: Int) {
    expanded = !expanded
    collectionContext?.reload(self)
  }
```

Take note of the call to `collectionContext?.reload(self)` here.  Once again, this Swift -> ObjC/RubyMotion translation had me scrambling through the documentation for some time, before I figured out it was `reloadSectionController(self)`.  Resulting in RubyMotion code which appears like this:

```ruby
  def cellForItemAtIndex(index)
    cell_class = index == 0 ? WeatherSummaryCell.self : WeatherDetailCell.self
    cell = collectionContext.dequeueReusableCellOfClass(cell_class, forSectionController: self, atIndex: index)
    if cell.instance_of? WeatherSummaryCell
      cell.expanded = self.expanded
    elsif cell.instance_of? WeatherDetailCell
      case index
      when 1
        title = "SUNRISE"
        detail = weather.sunrise
      when 2
        title = "SUNSET"
        detail = weather.sunset
      when 3
        title = "HIGH"
        detail = "#{weather.high} C"
      when 4
        title = "LOW"
        detail = "#{weather.low} C"
      else
        title = "n/a"
        detail = "n/a"
      end
      cell.detail_label.text = detail
      cell.title_label.text = title
    end
    cell
  end

  def didSelectItemAtIndex(_)
    self.expanded = !self.expanded
    collectionContext.reloadSectionController(self)
  end

```

Next we add that `Weather` section to the `FeedController`.  In the Swift tutorial, they decided that this was a good spot to start displaying this feed in proper date order.  Adding in a protocol for the models to implement:

```swift
protocol DateSortable {
  var date: Date { get }
}

class JournalEntry: NSObject, DateSortable {
class Message: NSObject, DateSortable {
```

They don't add that to the Weather model, which I find a little confusing.  I guess they just want Weather to float to the top of the list always?  Seems like the code does not illustrate this intention very well. 

Then, in the `FeedController`, we get this:

```swift
  let wxScanner = WxScanner()
  
  func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
    var items: [IGListDiffable] = [wxScanner.currentWeather]
    items += loader.entries as [IGListDiffable]
    items += pathfinder.messages as [IGListDiffable]

    return items.sorted(by: { (left: Any, right: Any) -> Bool in
      if let left = left as? DateSortable, let right = right as? DateSortable {
        return left.date > right.date
      }
      return false
    })
  }
  
  func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
    if object is Message {
      return MessageSectionController()
    } else if object is Weather {
      return WeatherSectionController()
    } else {
      return JournalSectionController()
    }
  }
```

Personally, I prefer my RubyMotion version here. Don't have to do one thing to the `listAdapter(_, sectionControllerForObject: object)` method, because it will properly interpolate the section controller from the new model. We don't need a special `DateSortable` protocol, because duck-typing, and the `Array` sorting in Ruby is so nice and beautifully simple:

```ruby
  def objectsForListAdapter(_)
    [WxScanner.current_weather] +
      (loader.entries +
        pathfinder.messages).sort_by! {|entry| entry.date}.reverse
  end
```

And BAM! we have our third and final type of entry for our Marslink feed.  The Weather section is tappable/expandable.  I found the animation on the summary cell to be a nice touch.

### Realtime chat

But we are not done yet. One last step, to enable realtime chat. This will be coming in as the already defined `Messages`.  

`Pathfinder` has some funky stuff for the so-called realtime chat.  It's just asynchronously delivering new messages, with a protocol for a delegate to receive the messages.  

```swift
protocol PathfinderDelegate: class {
  func pathfinderDidUpdateMessages(pathfinder: Pathfinder)
}

private func delay(time: Double = 1, execute work: @escaping @convention(block) () -> Swift.Void) {
  DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
    work()
  }
}

  func connect() {
    delay(time: 2.3) {
      self.messages.append(lewisMessage(text: "Liftoff in 3..."))
      delay {
        self.messages.append(lewisMessage(text: "2..."))
        delay {
          self.messages.append(lewisMessage(text: "1..."))
        }
      }
    }
  }
```

That was a little bit of fun to implement in RubyMotion. I had a hard time finding the docs for `Dispatch::Queue`, and fumbled around a lot, until Mark Villacampa pointed out those docs are still living with [MacRuby](https://github.com/MacRuby/MacRuby/wiki/Dispatch-Module).

```ruby
  def connect
    Dispatch::Queue.main.after(2.3) do
      add_message(lewis_message("Liftoff in 3..."))
      Dispatch::Queue.main.after(1.0) do
        add_message(lewis_message("2..."))
        Dispatch::Queue.main.after(1.0) do
          add_message(lewis_message("1..."))
        end
      end
    end
  end
```

You might be wondering here why I didn't just use `messages <<` to add a message to the `messages` array.  Well, you see...
 
The *seriously* annoying part was my inability to implement this Swift version of an observer on the messages array in a clean way. 

```swift
  var messages: [Message] = {
    ...
    didSet {
      delegate?.pathfinderDidUpdateMessages(pathfinder: self)
    }
  }
```

If you Google for didset and Objective C, you will [discover](http://stackoverflow.com/questions/32756344/how-to-implement-the-didset-of-swift-in-objective-c) that people think of this as a flaw in Swift, and you should "just use key value observation". 

So I broke down, installed `bubble-wrap/core`, and implemented KVO like this:

```ruby
class Pathfinder
  include BW::KVO
  
  def initialize
    self.messages = []
    load_messages
    observe(self, :messages) do |_, _|
      delegate.pathfinderDidUpdateMessages(self)
    end
  end
```     
  
Ha, ha, ha.  You can't use KVO on NSArrays. Ha, ha, ha. Dammit!!!  One more hack later:

```ruby
  def add_message(message)
    self.willChangeValueForKey(:messages)
    self.messages << message
    self.didChangeValueForKey(:messages)
  end
```

As they say, it ain't pretty but it works.

To wire this up in the`FeedController`, at the bottom of `viewDidLoad`, we need to set ourselves up to be the delegate for receiving updates, make the connection, and finally implement the delegate protocol. 

```swift
  override func viewDidLoad() {
    ...
    pathfinder.delegate = self
    pathfinder.connect()
  }
    
extension FeedViewController: PathfinderDelegate {
  func pathfinderDidUpdateMessages(pathfinder: Pathfinder) {
    adapter.performUpdates(animated: true)
  }
}    
```

And I will thank the [IGListKit tutorial](https://www.raywenderlich.com/147162/iglistkit-tutorial-better-uicollectionviews) writer for saving me from yet another scramble through the documentation by writing this snippit:

> The single method performUpdates(animated:completion:) tells the IGListAdapter to ask its data source for new objects and then update the UI. This handles objects that are deleted, updated, moved, or inserted.
 
So I knew I needed one more parameter on this call to `@adapter.performUpdatesAnimated`, to finish up the `PathfinderDelegate`:

```ruby
  def pathfinderDidUpdateMessages(_)
    @adapter.performUpdatesAnimated(true, completion: nil)
  end
```

And that really is the end.  The Marslink app now receives it's asynchronous messages, and displays them as they arrive.

That was a lot more work than I had intended, but I learned a lot more than I imagined
 I would at the start, so it's all good.  You can download the final version of the 
 project [here](https://github.com/wndxlori/WNDXRubyMotion/releases/tag/marslink-final).
 And the entire project lives on in my RubyMotion examples repository 
 [WNDXRubyMotion](https://github.com/wndxlori/WNDXRubyMotion).
 
 If you liked reading this, please sign up, and you'll get advance notice of all my
 tips, as well as a few special extras I save for my friends!