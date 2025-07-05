# iOS Watch Rate

A sleek iOS app that helps you track and review your favorite TV shows using The Movie Database (TMDB) API. Keep tabs on shows you've watched with personal reviews and ratings, while building a watchlist of shows you want to see next.

## Features

- **Personal Reviews**: Track shows you've watched with custom star ratings and detailed reviews
- **Watchlist Management**: Save shows you want to watch later with descriptions and cover art
- **TMDB Integration**: Access comprehensive TV show data including release dates, descriptions, and high-quality images
- **Intuitive Interface**: Clean, native iOS design with easy navigation between reviews and watchlist
- **Detailed Show Information**: View show posters, descriptions, and your personal notes

## Screenshots

<img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/4.png" width="160">  <img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/5.png" width="160">  <img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/6.png" width="160">  <img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/9.png" width="160">  <img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/7.png" width="160">  <img src="https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/Screenshots/8.png" width="160">





## Requirements

- iOS 17.0+
- Xcode 16.0+
- Swift 6.0+
- TMDB API Key (free registration required)

## Installation

1. Clone the repository:

```bash
git clone https://github.com/myavonbehren/iOS-Watch-Rate.git
cd iOS-Watch-Rate
```

2. Open the project in Xcode:

```bash
open Watch-Rate.xcodeproj
```

3. Get your TMDB API key:
   - Visit [TMDB API](https://www.themoviedb.org/settings/api)
   - Create a free account and request an API key
   - Add your API key to the project configuration
4. Build and run the project in Xcode

## Usage

### Reviews Tab

- Browse your reviewed shows in a clean list format
- Each entry displays the show title and release date
- Tap any show to view your detailed review and star rating
- See the show poster alongside your personal notes

### Watchlist Tab

- View shows you've saved to watch later
- Each entry shows the show title and key information
- Tap any show to see the full description and poster
- Easily manage your queue of upcoming shows to watch

## Technologies Used

- **Swift** - Primary programming language
- **SwiftUI** - User interface framework
- **TMDB API** - TV show data source
- **URLSession** - Network requests
- **Core Data**  - Local data persistence

## API Reference

This app uses [The Movie Database (TMDB) API](https://www.themoviedb.org/documentation/api) to fetch TV show information including:

- Show metadata (titles, release dates, descriptions)
- High-resolution poster images

## Future Enhancements

- [ ] Episode-level tracking and reviews
- [ ] Social features to share reviews with friends
- [ ] Export reviews to external platforms

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/myavonbehren/iOS-Watch-Rate/blob/main/LICENSE) file for details.

## Contact

Mya Von Behren - myakvb@gmail.com
