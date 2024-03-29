Feature: Creating a new checking account

  Scenario: Creating a new standard individual checking account
    Given the user logged in as "janekoko@gmail.com" "JaneKoko12"
    When the user creates a new checking account with the following data
      | checkingAccountType | accountOwnership | accountName               | initialDepositAmount |
      | Standard Checking   | Individual       | Jane Koko Second Checking | 10000.00             |
    Then the user should see the green "Successfully created new Standard Checking account named Jane Koko Second Checking" message
    And the user should see newly added account card
      | accountName               | accountType       | ownership  | accountNumber | interestRate | balance  |
      | Jane Koko Second Checking | Standard Checking | Individual | 486135103     | 0.0%         | 10000.00 |
    And the user should see the following transactions
      | date             | category | description               | amount   | balance  |
      | 2024-02-27 16:18 | Income   | 845326466 (DPT) - Deposit | 10000.00 | 10000.00 |