Feature: Post Request
  Background: Test Base
    Given url 'https://api.realworld.io/api/'
    And path 'users/login'
    And header Content-Type = 'application/json'
    When request {"user":{"email":"meltemce03@gmail.com","password":"Erol1972!"}}
    Then method POST
    And status 200
    * def token = response.user.token


    #meltemce03@gmail.com
    #Erol1972!

    Scenario: post request
      * print token
      Given header Authorization = 'Token ' + token
      And path 'articles'
      And request {"article":{"title":"test title1","description":"test","body":"karate api test","tagList":""}}
      When method POST
      And status 200
      * print response

      # When request {"user":{"email":"meltemce03@gmail.com","password":"Erol1972!"}}