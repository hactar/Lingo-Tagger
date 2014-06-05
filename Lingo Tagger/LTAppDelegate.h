//
//  LTAppDelegate.h
//  Lingo Tagger
//
//  Created by patrick on 05/06/2014.
//  Copyright (c) 2014 patrick. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LTAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSTextView *inputTextView;
@property (unsafe_unretained) IBOutlet NSTextView *outputTextView;
@property (weak) IBOutlet NSComboBox *languageComboBox;

@end
