---
layout: post
title: UX All The Things
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

###But especially your API's



Seriously.  If you write API's, your documentation IS an essential part of the UX of your API.  If you follow @seriouspony at all, you should be familiar with the concept of UX.  Your product and UX should be helping your users (developers) BE MORE AWESOME.


So I ask myself, when I look at documentation like this (yes, I'm looking at you Apple), how does this make the developers using it more awesome?


****



NSAttributeType


Defines the possible types of NSAttributeType properties. These explicitly distinguish between bit sizes to ensure data store independence.


typedef enum {
NSUndefinedAttributeType = 0,
NSInteger16AttributeType = 100,
NSInteger32AttributeType = 200,
NSInteger64AttributeType = 300,
NSDecimalAttributeType = 400,
NSDoubleAttributeType = 500,
NSFloatAttributeType = 600,
NSStringAttributeType = 700,
NSBooleanAttributeType = 800,
NSDateAttributeType = 900,
NSBinaryDataAttributeType = 1000,
NSTransformableAttributeType = 1800,
NSObjectIDAttributeType = 2000
} NSAttributeType;


Constants


NSUndefinedAttributeType


Specifies an undefined attribute type.
NSUndefinedAttributeType is valid for transient properties—Core Data will still track the property as an id value and register undo/redo actions, and so on.
NSUndefinedAttributeType is illegal for non-transient properties.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSInteger16AttributeType


Specifies a 16-bit signed integer attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSInteger32AttributeType


Specifies a 32-bit signed integer attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSInteger64AttributeType


Specifies a 64-bit signed integer attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSDecimalAttributeType
Specifies an NSDecimalNumber attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSDoubleAttributeType


Specifies a double attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSFloatAttributeType


Specifies a float attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSStringAttributeType


Specifies an NSString attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSBooleanAttributeType


Specifies a Boolean attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSDateAttributeType


Specifies an NSDate attribute.
Times are specified in GMT.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSBinaryDataAttributeType


Specifies an NSData attribute.
Available in OS X v10.4 and later.
Declared in NSAttributeDescription.h.


NSTransformableAttributeType


Specifies an attribute that uses a value transformer.
Available in OS X v10.5 and later.
Declared in NSAttributeDescription.h.


NSObjectIDAttributeType


Specifies the object ID attribute.
Available in OS X v10.6 and later.
Declared in NSAttributeDescription.h.


****



Argh.  Really?  I mean, sure 
**I**
 have been around long enough to have programmed in assembly code, and C, but how many younger and beginning developers understand the difference between 16 bit, 32 bit, and 64 bit integers?  And the Decimal type?  And the difference between floats and doubles?


WHY?  Why can't this reference page actually provide the information that a developer needs to make an effective choice 
[RIGHT HERE](https://developer.apple.com/library/mac/documentation/cocoa/reference/CoreDataFramework/Classes/NSAttributeDescription_Class/reference.html#//apple_ref/doc/uid/TP30001175-BAJBGGIB).


And before anyone accuses me of not practicing what I preach... I was responsible for the 900+ page reference guide for the WNDX toolkit, almost 20 years ago, and we made sure that our enumerated types were described 
**properly**
, with a certain amount of useful detail, like this:
  
       [caption id="" align="alignnone" width="2446.0"]
![WNDX Reference Manual](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29313e4b04687d9db349f_52a251b4e4b0e77c563c2387_1386369469237_Screen+Shot+2013-12-06+at+3.25.00+PM.png.00+PM.png_) WNDX Reference Manual[/caption]
