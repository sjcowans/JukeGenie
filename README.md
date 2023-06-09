# JukeGenie README
<hr>

<img src="/playlists/welcome_page.png" alt="Welcome Page">

## About the project:


JukeGenie sprang from the desire to make party playlists more inclusive and collaborative. Most playlists are controlled by a single host or DJ with no regard for potentially valuable input from the partygoers the playlist is supposed to entertain. JukeGenie empowers the partygoers to control their musical destiny in a collaborative process.

<hr>

### <b>As a Visitor:</b> 
When accessing the website visitors will be provided a description of the application and the features that they will be able to access as a registered user. Visitors will be directed to register an account with our application via Oath authentication. Once registered/logged in visitors will be redirected to a user dashboard page.

<hr>

### <b>As a User:</b>
On their user dashboard page, users will see any JukeJams that they are hosting or have joined. Each will be a link to the JukeJam's show page. Users will also see buttons to create a new JukeJam, join an existing JukeJam by inputting a JukeJam code provided to them, and explore nearby parties (This will prompt the user to share their current location, send an API request to Geolocation API, and check if they are in range of other parties hosted by other users.)
<ol>
  <li>When Accessing a JukeJam they have joined, users will be able to recommend artists, songs, or genres to the playlist.</li>
  <li>Users will also see recommendations from other users to this playlist.</li>
</ol>

<hr>

### <b>As a JukeJam Host:</b>
When creating a JukeJam, that user will be set as the host. The user will create their Jukejam with a name, full address and range. Then they will be taken to an initial suggestions page where they can send initial suggestions to populate a spotify playlist. The playlis will be created and they will see the embedded spotify playlist on the created playlist's show page. 
<ol>
  <li></li>
  <li>The JukeJam host will get a JukeJam code that they can share with other users so that they can join the JukeJam.</li>
  <li>Any user within the set range by the host will be able to find that JukeJam with the Explore Nearby Jukes button and send in recommendations.</li>
</ol>

<hr>

<img src="/playlists/playlist_show.png" alt="Playlist Show Page">

## Tech Stack

* Ruby on Rails

* Tailwind 

* Postgresql

* Sqlite3

* 


<hr>

## API's

* <a href="https://developer.spotify.com/documentation/web-api">Spotify</a>

* <a href="https://developers.google.com/maps/documentation/geolocation/overview">Geolocation</a>

<hr>

## This project was created by:

* <a href="https://www.linkedin.com/in/sean-cowans-985554267/">Sean Cowans</a> <br>
<small><a href="https://github.com/sjcowans">Github</a></small>

* <a href="https://www.linkedin.com/in/alejandrolopez1992/">Alejandro Lopez</a><br>
<small><a href="https://github.com/AlejandroLopez1992">Github</a></small>

* <a href="https://www.linkedin.com/in/andrew-b0wman/">Andrew Bowman</a><br>
<small><a href="https://github.com/abwmn">Github</a></small>

* <a href="https://www.linkedin.com/in/boston-lowrey/"> Boston Lowrey</a><br>
<small><a href="https://github.com/BLowrey24">Github</a></small>
