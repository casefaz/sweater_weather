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

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

 <td align="center"><a href="https://github.com/casefaz"><img src="https://avatars.githubusercontent.com/u/98674727?v=4" width="100px;" alt=""/><br /><sub><b>Casey F. (they/she)</b></sub></a><br /><a href="https://www.linkedin.com/in/casey-fazio-7ba04149/" title ="Linked In"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" /></a></td>
