//
//  Person.h
//  ParsingJSONObjc
//
//  Created by Lisa J on 5/21/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

#ifndef Person_h
#define Person_h


#endif /* Person_h */

//Public Interface - external classes have public access

@interface Person: NSObject// add interface

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *email;
@property (copy, nonatomic, readonly) NSString *phone;
    
- (instancetype)initWithDict:(NSDictionary *)dict;
   //more type safe than id
-(void)personDescription;
@end
