@Registration
Feature: Digital Bank Registration Page

  Background:
    Given The user with "jack@test.co" is not in DB
    Given User navigates to Digital Bank signup page


  @Test
  Scenario: Positive Case. As a user, I want to successfully create Digital Bank account
    When User creates account with following fields
      | title | firstName | lastName | gender | dob        | ssn         | email        | password  | address    | locality | region | postalCode | country | homePhone  | mobilePhone | workPhone  | termsCheckMark |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     | 99921      | US      | 2144659100 | 2136591208  | 2134567809 | true           |
    Then User should be displayed with the message "Success Registration Successful. Please Login."
    Then the following user info should be saved in the db
      | title | firstName | lastName | gender | dob        | ssn         | email        | password  | address    | locality | region | postalCode | country | homePhone  | mobilePhone | workPhone  | termsCheckMark | accountNonExpired |accountNonLocked|credentialsNonExpired|enabled|
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     | 99921      | US      | 2144659100 | 2136591208  | 2134567809 | true           | true              |true            |true                 |true   |


  @NegativeRegistrationCase
  Scenario Outline: Negative Test Cases. As a Digital Bank Admin, I want to make sure users can not register without providing all valid data
    When User creates account with following fields
      | title   | firstName   | lastName   | gender   | dob   | ssn   | email   | password   | address   | locality   | region   | postalCode   | country   | homePhone   | mobilePhone   | workPhone   | termsCheckMark   |
      | <title> | <firstName> | <lastName> | <gender> | <dob> | <ssn> | <email> | <password> | <address> | <locality> | <region> | <postalCode> | <country> | <homePhone> | <mobilePhone> | <workPhone> | <termsCheckMark> |
    Then the User should see the "<fieldWithError>" required field error message "<errorMessage>"

    Examples:
      | title | firstName | lastName | gender | dob        | ssn         | email        | password  | address    | locality | region | postalCode | country | homePhone   | mobilePhone | workPhone  | termsCheckMark | fieldWithError | errorMessage                                    |
      |       |           |          |        |            |             |              |           |            |          |        |            |         |             |             |            |                | title          | Виберіть елемент зі списку.                     |
      | Mr.   |           |          |        |            |             |              |           |            |          |        |            |         |             |             |            |                | firstName      | Заповніть це поле.                              |
      | Mr.   | Jack      |          |        |            |             |              |           |            |          |        |            |         |             |             |            |                | lastName       | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     |        |            |             |              |           |            |          |        |            |         |             |             |            |                | gender         | Виберіть один із запропонованих варіантів.      |
      | Mr.   | Jack      | Test     | M      |            |             |              |           |            |          |        |            |         |             |             |            |                | dob            | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 |             |              |           |            |          |        |            |         |             |             |            |                | ssn            | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 |              |           |            |          |        |            |         |             |             |            |                | email          | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co |           |            |          |        |            |         |             |             |            |                | password       | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 |            |          |        |            |         |             |             |            |                | address        | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St |          |        |            |         |             |             |            |                | locality       | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     |        |            |         |             |             |            |                | region         | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     |            |         |             |             |            |                | postalCode     | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     | 99921      |         |             |             |            |                | country        | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     | 99921      | US      |             |             |            |                | homePhone      | Заповніть це поле.                              |
      | Mr.   | Jack      | Test     | M      | 12/12/1990 | 123-44-3456 | jack@test.co | Tester123 | 12 Main St | City     | CA     | 99921      | US      | 21446591008 | 2136591208  | 2134567809 |                | termsCheckMark | Поставте тут прапорець, якщо хочете продовжити. |
