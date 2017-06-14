#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HSHistoryController.h"
#import "HSRecommendController.h"
#import "HSSubscribeController.h"
#import "HSSubscribleVC.h"
#import "HSSubscribleDataTool.h"
#import "HSRecommends.h"
#import "SubscriptAPI.h"
#import "HSRecommendsCell.h"

FOUNDATION_EXPORT double FunkySubScriptVersionNumber;
FOUNDATION_EXPORT const unsigned char FunkySubScriptVersionString[];

