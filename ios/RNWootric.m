#import <WootricSDK/WootricSDK.h>
#import "RNWootric.h"

@implementation RNWootric

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(configureWithClientID:(NSString *)clientID accountToken:(NSString *)accountToken) {
  [Wootric configureWithClientID:clientID accountToken:accountToken];
}

RCT_EXPORT_METHOD(setEndUserEmail:(NSString *)email) {
  [Wootric setEndUserEmail:email];
}

RCT_EXPORT_METHOD(setSurveyImmediately:(BOOL)flag) {
  [Wootric surveyImmediately:flag];
}

RCT_EXPORT_METHOD(setEndUserCreatedAt:(nonnull NSNumber *)externalCreatedAt) {
  [Wootric setEndUserCreatedAt:externalCreatedAt];
}

RCT_EXPORT_METHOD(setEndUserExternalId:(NSString *)externalId) {
  [Wootric setEndUserExternalId:externalId];
}

RCT_EXPORT_METHOD(setEndUserPhoneNumber:(NSString *)phoneNumber) {
  [Wootric setEndUserPhoneNumber:phoneNumber];
}

RCT_EXPORT_METHOD(setEndUserProperties:(NSDictionary *)customProperties) {
  [Wootric setEndUserProperties:customProperties];
}

RCT_EXPORT_METHOD(showOptOut:(BOOL)flag) {
  [Wootric showOptOut:flag];
}

RCT_EXPORT_METHOD(setFirstSurveyAfter:(nonnull NSNumber *)firstSurveyAfter) {
  [Wootric setFirstSurveyAfter:firstSurveyAfter];
}

RCT_EXPORT_METHOD(setCustomLanguage:(NSString *)languageCode) {
  [Wootric setCustomLanguage:languageCode];
}

RCT_EXPORT_METHOD(setCustomProductName:(NSString *)productName) {
  [Wootric setCustomProductName:productName];
}

RCT_EXPORT_METHOD(setCustomAudience:(NSString *)audience) {
  [Wootric setCustomAudience:audience];
}

RCT_EXPORT_METHOD(forceSurvey:(BOOL)force) {
  [Wootric forceSurvey:force];
}

RCT_EXPORT_METHOD(showSurvey) {
  [Wootric showSurveyInViewController:[UIApplication sharedApplication].delegate.window.rootViewController];
}

RCT_EXPORT_METHOD(setCustomThankYou:(NSDictionary *)options) {
  NSString *promoterMessage=options[@"promoterMessage"];
  NSString *promoterText=options[@"promoterText"];
  NSString *promoterLinkString=options[@"promoterLink"];
  NSString *passiveMessage=options[@"passiveMessage"];
  NSString *passiveText=options[@"passiveText"];
  NSString *passiveLinkString=options[@"passiveLink"];

  if (promoterMessage){
    [Wootric setPromoterThankYouMessage: promoterMessage];
  }
  if (passiveMessage) {
    [Wootric setPassiveThankYouMessage: passiveMessage];
  }
  if (passiveText && passiveLinkString){
    NSURL *passiveLinkUrl = [NSURL URLWithString:passiveLinkString];
    [Wootric setPassiveThankYouLinkWithText: passiveText URL:passiveLinkUrl];
  }
  if (promoterText && promoterLinkString) {
    NSURL *promoterLinkUrl = [NSURL URLWithString:promoterLinkString];
    [Wootric setPromoterThankYouLinkWithText: promoterText URL:promoterLinkUrl];
  }
}
@end
  