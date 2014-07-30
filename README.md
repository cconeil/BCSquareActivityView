BCSquareActivityView
====================

A simple, modern activity indicator for ios


<h5>CUSTOMIZATION</h5>
You can set the backgroundColor, foregroundColor, frame, and animationDuration to create an activity indicator with a custom feel.

<h5>USE</h5>
You can use .startActivity() and .endActivity() functions to control the animations.  The .startActivity() function will do nothing if it is called while already animating, and the .endActivity() function will do nothing if it is called while it is not animating.  There is also an isAnimating property that allows you to check if the activity indicator is animating.
