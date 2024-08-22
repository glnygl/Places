# Places
- Fetch locations (async/await)
- List locations
- Create url with location and scheme 
- Redirect to Wikipedia App when tab a location (or type a new custom location)
- Localize hard coded strings
- UnitTests

# Wikipedia
- Fetch redirectURl in SceneDelegate
- Get queryItems from Url
- Redirect location with showPlaces func


 > In showPlaces func: 

```
Select places tab
Pop navigation controllers,
Dismis other controllers (in case user select filter, share then redirect)
Set viewMode to map (in case select another viewMode)
Cancel search (in case user typed a location text)
Set new location
```

> If mapView not loaded (user didn't select places tab yet, I used zoomAndPanMapView func to redirect 




