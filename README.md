## MobileTomatoes

### Using the Rotten Tomatoes API with Swift

This app displays the top DVD rentals using the [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON).

Time spent: `5 hours`

#### Setting your API key

Add your [RottenTomatoes API](http://developer.rottentomatoes.com/) key to a `MobileTomatoes/config.plist` file, with the key `rottenTomatoesApiKey`.

### Features

#### Required

- [√] User can view a list of movies. Poster images load asynchronously.
- [√] User can view movie details by tapping on a cell.
- [√] User sees loading state while waiting for the API.
- [√] User sees error message when there is a network error: http://cl.ly/image/1l1L3M460c3C
- [√] User can pull to refresh the movie list.

#### Optional

- [ ] All images fade in.
- [ ] For the larger poster, load the low-res first and switch to high-res when complete.
- [ ] All images should be cached in memory and disk: AppDelegate has an instance of `NSURLCache` and `NSURLRequest` makes a request with `NSURLRequestReturnCacheDataElseLoad` cache policy. I tested it by turning off wifi and restarting the app.
- [ ] Customize the highlight and selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Add a tab bar for Box Office and DVD.
- [ ] Add a search bar: pretty simple implementation of searching against the existing table view data.

### Walkthrough

#### Normal Behavior

![RottenTomatoes API failure](http://i.imgur.com/SSBO4lX.gif)

#### Network Error Simulation

![RottenTomatoes API App Walkthrough](http://i.imgur.com/3DXr7FE.gif)

Credits
---------
* [Rotten Tomatoes API](http://developer.rottentomatoes.com/docs/read/JSON)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
