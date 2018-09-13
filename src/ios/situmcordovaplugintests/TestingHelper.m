//
//  TestingHelper.m
//  situmcordovapluginTests
//
//  Created by Situm on 24/7/18.
//  Copyright © 2018 Situm. All rights reserved.
//
#import "TestingHelper.h"


@implementation TestingHelper

+ (id)dataFromJSONFileNamed:(NSString *)fileName inDirectory: (NSString *)pathResources {
    //get file path relative to project for avoiding CI integration problems
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:fileName
                                                         ofType:@"json"
                                                    inDirectory:pathResources];
    NSDictionary *json = [[NSMutableDictionary alloc] init];
    //check file exists
    if (filePath) {
        //retrieve file content
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        
        //convert JSON NSData to a usable NSDictionary
        NSError *error;
        json = [NSJSONSerialization JSONObjectWithData:data
                                               options:0
                                                 error:&error];
        if (error) {
            NSLog(@"Something went wrong! %@", error.localizedDescription);
        }
    }
    else {
        NSLog(@"Couldn't find file!");
    }
    return json.copy;
}

- (void) assertPoint: (NSDictionary *) jsonPointFile : (NSDictionary *) pointJO {
    [self assertCoordinate:jsonPointFile[@"coordinate"]:pointJO[@"coordinate"]];
    [self assertCartesianCoordinate:jsonPointFile[@"cartesianCoordinate"]:pointJO[@"cartesianCoordinate"]];
    XCTAssertEqualObjects(jsonPointFile[@"floorIdentifier"], pointJO[@"floorIdentifier"]);
    XCTAssert(jsonPointFile[@"isIndoor"] == pointJO[@"isIndoor"]);
    XCTAssertEqualObjects(jsonPointFile[@"buildingIdentifier"], pointJO[@"buildingIdentifier"]);
    XCTAssert(jsonPointFile[@"isOutdoor"] == pointJO[@"isOutdoor"]);
}

- (void) assertCoordinate: (NSDictionary *) jsonCoordinateFile : (NSDictionary *) coordinateJO {
    XCTAssertEqualWithAccuracy([jsonCoordinateFile[@"longitude"] doubleValue], [coordinateJO[@"longitude"] doubleValue], 0.001);
    XCTAssertEqualWithAccuracy([jsonCoordinateFile[@"latitude"] doubleValue], [coordinateJO[@"latitude"] doubleValue], 0.001);
}

- (void) assertCartesianCoordinate: (NSDictionary *) jsonCartesianCoordinateFile : (NSDictionary *) cartesianCoordinateJO {
    XCTAssertEqualWithAccuracy([jsonCartesianCoordinateFile[@"x"] doubleValue], [cartesianCoordinateJO[@"x"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonCartesianCoordinateFile[@"y"] doubleValue], [cartesianCoordinateJO[@"y"] doubleValue], 0.0001);
}

- (void) assertAngle: (NSDictionary *) jsonAngleFile : (NSDictionary *) angleJO;
{
    XCTAssertEqualWithAccuracy([jsonAngleFile[@"radiansMinusPiPi"] doubleValue], [angleJO[@"radiansMinusPiPi"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonAngleFile[@"radians"] doubleValue], [angleJO[@"radians"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonAngleFile[@"degreesClockwise"] doubleValue], [angleJO[@"degreesClockwise"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonAngleFile[@"degrees"] doubleValue], [angleJO[@"degrees"] doubleValue], 0.0001);
}

- (void) assertBound: (NSDictionary *) jsonBoundFile : (NSDictionary *) boundJO {
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"northWest"][@"latitude"] doubleValue], [boundJO[@"northWest"][@"latitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"northWest"][@"longitude"] doubleValue], [boundJO[@"northWest"][@"longitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"northEast"][@"latitude"] doubleValue], [boundJO[@"northEast"][@"latitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"northEast"][@"longitude"] doubleValue], [boundJO[@"northEast"][@"longitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"southWest"][@"latitude"] doubleValue], [boundJO[@"southWest"][@"latitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"southWest"][@"longitude"] doubleValue], [boundJO[@"southWest"][@"longitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"southEast"][@"latitude"] doubleValue], [boundJO[@"southEast"][@"latitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonBoundFile[@"southEast"][@"longitude"] doubleValue], [boundJO[@"southEast"][@"longitude"] doubleValue], 0.0001);
}

- (void) assertDimension: (NSDictionary *) jsonDimensionFile : (NSDictionary *) dimensionJO {
    XCTAssertEqualWithAccuracy([jsonDimensionFile[@"width"] doubleValue], [dimensionJO[@"width"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonDimensionFile[@"height"] doubleValue], [dimensionJO[@"height"] doubleValue], 0.0001);
}

- (void) assertEvent: (NSDictionary *) jsonEventFile : (NSDictionary *) eventJO {
    XCTAssertEqualWithAccuracy([jsonEventFile[@"identifier"] doubleValue], [eventJO[@"identifier"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonEventFile[@"buildingIdentifier"] doubleValue], [eventJO[@"buildingIdentifier"] doubleValue], 0.0001);
    XCTAssertEqualObjects(jsonEventFile[@"infoHtml"], eventJO[@"infoHtml"]);
}

- (void) assertFloor: (NSDictionary *) jsonFloorFile : (NSDictionary *) floorJO {
    XCTAssertEqualWithAccuracy([jsonFloorFile[@"altitude"] doubleValue], [floorJO[@"altitude"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonFloorFile[@"level"] doubleValue], [floorJO[@"level"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonFloorFile[@"scale"] doubleValue], [floorJO[@"scale"] doubleValue], 0.0001);
    XCTAssertEqualObjects(jsonFloorFile[@"floorIdentifier"], jsonFloorFile[@"floorIdentifier"]);
    XCTAssertEqualObjects(jsonFloorFile[@"mapUrl"], jsonFloorFile[@"mapUrl"]);
    XCTAssertEqualObjects(jsonFloorFile[@"buildingIdentifier"], jsonFloorFile[@"buildingIdentifier"]);
}

- (void) assertIndication: (NSDictionary *) jsonIndicationFile : (NSDictionary *) indicationJO {
    XCTAssertEqualWithAccuracy([jsonIndicationFile[@"orientation"] doubleValue], [indicationJO[@"orientation"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonIndicationFile[@"stepIdxDestination"] doubleValue], [indicationJO[@"stepIdxDestination"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonIndicationFile[@"distance"] doubleValue], [indicationJO[@"distance"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonIndicationFile[@"stepIdxOrigin"] doubleValue], [indicationJO[@"stepIdxOrigin"] doubleValue], 0.0001);
    XCTAssertEqualWithAccuracy([jsonIndicationFile[@"distanceToNextLevel"] doubleValue], [indicationJO[@"distanceToNextLevel"] doubleValue], 0.0001);
    XCTAssertEqualObjects(jsonIndicationFile[@"orientationType"], indicationJO[@"orientationType"]);
    XCTAssertEqualObjects(jsonIndicationFile[@"indicationType"], indicationJO[@"indicationType"]);
    XCTAssertEqualObjects(jsonIndicationFile[@"stepIdxOrigin"], indicationJO[@"stepIdxOrigin"]);
    XCTAssertEqualObjects(jsonIndicationFile[@"buildingIdentifier"], indicationJO[@"buildingIdentifier"]);
    XCTAssertEqualObjects(jsonIndicationFile[@"neededLevelChange"], indicationJO[@"neededLevelChange"]);
}

- (void) assertLocation: (NSDictionary *) jsonLocationFile : (NSDictionary *) locationJO {
    XCTAssertEqualObjects(jsonLocationFile[@"accuracy"], locationJO[@"accuracy"]);
    XCTAssertEqualObjects(jsonLocationFile[@"provider"], locationJO[@"provider"]);
    XCTAssertEqualObjects(jsonLocationFile[@"buildingIdentifier"], locationJO[@"buildingIdentifier"]);
    XCTAssertEqualObjects(jsonLocationFile[@"floorIdentifier"], locationJO[@"floorIdentifier"]);
    [self assertPoint:jsonLocationFile[@"position"]:locationJO[@"position"]];
    [self assertCoordinate:jsonLocationFile[@"coordinate"]:locationJO[@"coordinate"]];
    [self assertCartesianCoordinate:jsonLocationFile[@"cartesianCoordinate"]:locationJO[@"cartesianCoordinate"]];
    [self assertAngle:jsonLocationFile[@"cartesianBearing"]:locationJO[@"cartesianBearing"]];
    
    //always returning true when creating object from file due to ios sdk restriction in hasBearing functionality
    XCTAssertTrue(jsonLocationFile[@"hasBearing"]);
}

- (void) assertLocationStatus: (NSDictionary *) jsonLocationStatusFile : (NSDictionary *) locationStatusJO;
{
    XCTAssert([jsonLocationStatusFile[@"statusName"] isEqualToString: locationStatusJO[@"statusName"]]);
}


@end
