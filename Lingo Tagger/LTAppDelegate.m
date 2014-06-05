//
//  LTAppDelegate.m
//  Lingo Tagger
//
//  Created by patrick on 05/06/2014.
//  Copyright (c) 2014 patrick. All rights reserved.
//
// Based on code by NSHipster

#import "LTAppDelegate.h"

@implementation LTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    [self.languageComboBox selectItemAtIndex:0];
}
- (IBAction)generateHit:(id)sender {
    
    NSString *question = self.inputTextView.string;
    NSLinguisticTaggerOptions options = NSLinguisticTaggerOmitWhitespace | NSLinguisticTaggerOmitPunctuation | NSLinguisticTaggerJoinNames;
    NSString *language = [self.languageComboBox objectValueOfSelectedItem];
NSLinguisticTagger *tagger = [[NSLinguisticTagger alloc] initWithTagSchemes: [NSLinguisticTagger availableTagSchemesForLanguage:language] options:options];
    tagger.string = question;
    NSMutableArray *outputArray = [NSMutableArray array];
    
    NSString *schemeToUse = nil;
    
    if ([[NSLinguisticTagger availableTagSchemesForLanguage:language] containsObject:@"NameTypeOrLexicalClass"]) {
        schemeToUse = NSLinguisticTagSchemeNameTypeOrLexicalClass;
    } else {
        schemeToUse = NSLinguisticTagSchemeLexicalClass;
    }
    
    
    [tagger enumerateTagsInRange:NSMakeRange(0, [question length]) scheme:schemeToUse options:options usingBlock:^(NSString *tag, NSRange tokenRange, NSRange sentenceRange, BOOL *stop) {
        NSString *token = [question substringWithRange:tokenRange];
        
        [outputArray addObject:@{@"word" : token, @"tag": tag}];
    }];
    
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:outputArray options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [self.outputTextView setString:  jsonString ];
}

@end
