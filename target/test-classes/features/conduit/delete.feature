Feature: Delete Feature

  Background: Test Base
    Given url 'https://api.realworld.io/api/'
    And path 'users/login'
    And header Content-Type = 'application/json'
    When request {"user":{"email":"meltemce03@gmail.com","password":"Erol1972!"}}
    Then method POST
    And status 200
    * def token = response.user.token
    #tdemailtestdata@gmail.com
    #Trendyol123!

  Scenario: delete article
    Given header Authorization = 'Token ' + token
    And path 'articles'
    And request {"article":{"title":"test title01","description":"test","body":"karate api test","tagList":""}}
    When method POST
    And status 200
    * def articleId = response.article.slug

    # aslinda adi slug di biz adini articleId verdik.

    Given header Authorization = 'Token ' + token
    And path 'articles'
    When params {limit: 10, offset:0}
    When method GET
    Then status 200
    And match response.articles[0].title == "test title01"


    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * print 'before'
    * sleep(5000)
    * print 'after'

    Given header Authorization = 'Token ' + token
    When path 'articles', articleId
    And method DELETE
    And status 204

    Given header Authorization = 'Token ' + token
    And path 'articles'
    When params {limit: 10, offset:0}
    When method GET
    Then status 200
    * print response.articles
    And match response.articles[0].title != "test title01"

