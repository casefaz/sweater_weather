<h1>Sweater Weather</h1>

<div align="center">
<img src="https://media4.giphy.com/media/3osxYzIQRqN4DOEddC/giphy.gif?cid=ecf05e47wegdrse2zti96spjc8jgw6p7n6un3xe0n8hsjlpm&rid=giphy.gif&ct=g" alt="sweaters" width="30%"/>
</div

>Sweater Weather is a Ruby on Rails project that explores service-oriented architecture to better allow the front end to communicate with the backend by exposing API endpoints.
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#learning-goals">Learning Goals</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#apis-consumed">API's Consumed</a></li>
    <li>
      <a href="#endpoints">Endpoints</a>
      <ul>
        <li><a href="#retrieve-weather">Retrieve Weather</a></li>
        <li><a href="#user-registration">User Registration</a></li>
        <li><a href="#login">Login</a></li>
        <li><a href="#road-trip">Road Trip</a></li>
     </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>

</details>
<!-- ABOUT THE PROJECT -->

## Learning Goals
- Expose an API that combines data from multiple external APIs
- Perform CRUD functionality on API endpoints
- Refactor code for developer empathy and readability
- Research and consume an API based on customer needs

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

![Ruby](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## API's Consumed
- [MapQuest GeoCoding](https://developer.mapquest.com/documentation/geocoding-api/)
- [MapQuest Directions](https://developer.mapquest.com/documentation/directions-api/)
- [OpenWeather](https://openweathermap.org/api/one-call-api)

## Endpoints

### Retrieve Weather
#### Request:
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
![Screen Shot 2022-08-10 at 6 47 26 AM](https://user-images.githubusercontent.com/98674727/183905749-0e9153e5-5a9d-48cb-ae61-081549bfc71a.png)


### User Registration
#### Request
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
![Screen Shot 2022-08-10 at 6 46 16 AM](https://user-images.githubusercontent.com/98674727/183905551-a91e87a4-a54c-44b5-addf-ceaf8dbc706e.png)


### Login
#### Request
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```

![Screen Shot 2022-08-10 at 6 53 03 AM](https://user-images.githubusercontent.com/98674727/183906083-78c51341-caa1-4f16-a899-2bf20d98964a.png)


### Road Trip

#### Request
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

![Screen Shot 2022-08-10 at 6 47 12 AM](https://user-images.githubusercontent.com/98674727/183905683-75c9e59e-e464-4e26-90a6-789bf2756218.png)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TESTING -->
## Test Coverage

- using Simplecov, postman, and RSpec Sweater Weather takes into account sad pathing and coverage of all present code

> in the example below you can see test coverage, edge casing, and sad pathing

![Screen Shot 2022-08-10 at 6 57 08 AM](https://user-images.githubusercontent.com/98674727/183906865-60948b2a-9bb8-48db-af53-54c4361021e5.png)

<!-- CONTACT -->
## Contact

 <td align="center"><a href="https://github.com/casefaz"><img src="https://avatars.githubusercontent.com/u/98674727?v=4" width="100px;" alt=""/><br /><sub><b>Casey F. (they/she)</b></sub></a><br /><a href="https://www.linkedin.com/in/casey-fazio-7ba04149/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
