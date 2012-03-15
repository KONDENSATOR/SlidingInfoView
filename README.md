Sliding Info View
=================

Slides in a view from underneath resizing the main view. The info view will stay up for a certain time and then slide down, restoring the main view to the original state.

Usage
-----

At start up, tell which view to operate in and what subview index to steal space from. If root view is a NavigationView this works:

  [[SlidingInfoView sharedSlidingInfoView] setHostView:self.window.rootViewController.view onSubView:0];

To display info for two seconds:

  [[SlidingInfoView sharedSlidingInfoView] displayInfo:@"Hello!" for:2];

It works with screen rotation as well.