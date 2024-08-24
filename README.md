# Places
- Fetch locations (async/await)
- List locations
- Create url with location and scheme 
- Redirect to Wikipedia App when tab a location (or type a new custom location)
- Localize hard coded strings
- UnitTests
- Accessibility

# Wikipedia
- Fetch redirectURl in SceneDelegate
- Get queryItems from Url
- Redirect location with showPlaces func 

⚠️ We need articleURL (better way) to redirect location 

We can redirect a link work in openURL func with user activity. To process this activity we should have spesific articleURL for each location as wmf_linkURL. Since we dont have a articleURL in api data i code a workaround method called showPlaces. This func only if app status is in background or active. If app is terminated PlacesViewController doesnt load propery that leads to crash.

E.g. : WMFArticleURL=https://en.wikipedia.org/wiki/Union_Square,_San_Francisco?wprov=sfti1

 > In showPlaces func: 

```
Select places tab
Pop navigation controllers,
Dismis other controllers (in case user select filter, share then redirect)
Set viewMode to map (in case select another viewMode)
Cancel search (in case user typed a location text)
Set new location
```
If mapView not loaded (user didn't select places tab yet, I checked mapView status in setLocation func set redirectLocation and then modified zoomAndPanMapView func according to new location





