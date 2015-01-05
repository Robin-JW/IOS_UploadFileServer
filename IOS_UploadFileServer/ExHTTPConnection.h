
#import "HTTPConnection.h"

@class MultipartFormDataParser;

@interface ExHTTPConnection : HTTPConnection  {
    MultipartFormDataParser*        parser;
	NSFileHandle*					storeFile;
	
	NSMutableArray*					uploadedFiles;
}

@end
