//
//  ViewController.m
//  BaiduMapTools
//
//  Created by 洪铭翔 on 2020/3/12.
//  Copyright © 2020 洪铭翔. All rights reserved.
//

#import "ViewController.h"

#import "BaiduMapTool.h"

@interface ViewController ()
@property (nonatomic, strong) BMKMapView *mapView;
@end

@implementation ViewController
- (BMKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[BaiduMapTool shared] getMapViewWithFrame:self.view.bounds];
    }
    return _mapView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mapView];
    
    [[BaiduMapTool shared] queryHistoryTrackRequest];
}


@end
