## Template
<details>
Overview: 
 - description and intent of the project
   - what its for what I did. 
 - description of what the code does

Setup instructions/guide (how to setup or install)
- How to run it
- How to run tests
- Dependencies information

- demo of how to use program (gif)

Planning and Approach: 
- User stories
- The domain model
- CRC cards 
- Process

Other: 
- Build passing (travis/circle CI)
- Test coverage (auto generated)
- Code style and code conventions (linting)
- code climate
<br>
</details>

## Overview
(to be added) Solo project to solve a technical challenge with a focus on clean well crafted code. 
Program allows user to manage finances through a simple command line interface. 
## Setup 
```
$ git clone git@github.com:fwill22/bank-tech-test-ruby.git
$ cd bank-tech-test-ruby
$ bundle install
$ irb
```

## How to use
In IRB:
```
> require ‘./lib/account’
> account = Account.new
> account.deposit(250)
> account.withdraw(150)
> account.print_statement

```

## Testing and Linting
### Run Tests
```
rspec
```
Results: (to be added)
### Run Linting
```
rubocop
```
Results: (to be added)
<p>&nbsp;</p>

## Planning and Approach: 
### User Stories
```
As a user
So I can be part of a cashless economy
I want to be able to open an empty bank account
```
```
As a user
So I can store my money securely
I want to be able to deposit it into my account
```
```
As a user
So I can buy things untracked 
I want to be able to withdraw money from my account
```
```
As a user
So I can check how much money I have saved
I want to be able to see my current account balance and transaction history on a printed statement.
```
```
As a user
So I can keep on top of my money habits
I want my account statement to display the date, transaction amount, type, and updated balance.
```
```
As a user
So I can see an up to date history of my transactions
I want to be able to see my account statement listed in reverse chronology by date created
```

#### Edge cases:
```
As a user
So I can stay in the black
I want my account to prevent withdrawal if I have insufficient funds

As a bank manager
So I can ensure the efficient operation of my business
I want to be able to notify customers if they are depositing or withdrawing amounts ≤ £0. 
```

### Acceptance Criteria
Given a client makes a deposit of 1000 on 10-01-2012<br>
And a deposit of 2000 on 13-01-2012 <br>
And a withdrawal of 500 on 14-01-2012 <br>
When she prints her bank statement she would see:
```
|    date     ||  credit  ||  debit  || balance  |
 ------------------------------------------------
|  14/01/2012 ||          || 500.00  || 2500.00  |
|  13/01/2012 || 2000.00  ||         || 3000.00  |
|  10/01/2012 || 1000.00  ||         || 1000.00  |
```

### CRC Cards

<details>
  <summary> CRC Cards </summary>
  [Draft]

**Account**:  <br>
*Responsibilities*:  <br>
Knows about: <br>
	Starting balance of 0 <br>
	Current balance  <br>
	History of transactions <br>
	Can add deposited money to CB  <br>
	Can subtract withdrawn money from CB  <br>


*Collaborators*:  <br>
	Transaction <br>
	Statement <br>


**Transaction**: <br>
*Responsibilities*:  <br>
	Knows about: <br>
		Credit amount transaction is for  <br>
    Debit amount transaction is for <br>
		Date created <br>
		Format for printing line on statement <br>

*Collaborators*: Statement

**Statement**:  <br>
*Responsibilities*:  <br>
	Knows about: <br>
		Transaction history <br>
		Current balance <br>


*Collaborators*: - 
    
 
</details>

## Dependecies
* Ruby
* Rspec
* Rubocop
* Simplecov
