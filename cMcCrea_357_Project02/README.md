# Project 2 - Simple Password Manger
## Corey McCrea
### References

https://stackoverflow.com/questions/41180292/negative-number-modulo-in-swift

----------

### Summary

You will be building a simple terminal-based application. The application will have the basic functions of a password manager, such as add/encrypt, view/decrypt, and delete.
Details
The purpose of this assignment is to create the back-end structure and familiarize students with Swift in preparation for the next assignment - a password manager app on their phone.

The application will make use of the following programming elements: 
* string manipulation (reversing, Caesar Cipher)
* JSON storage / retrieval 
* reading / writing to files
*  asking for user input 
*  validating user input

The passphrase element of the application should be familiar to those who have used password managers - a master password, that you use ONLY for this purpose to secure your other passwords.

This application will not actually secure any data, just obfuscate it. The point is to learn a number of string manipulation features, not to deal with actual security.


The project must be completed as a MacOS Terminal / Console application.

### Required Functionality

Passwords will be stored in a dictionary with a key-value pair

User generated name to identify password (key) => stored password (value)

Passwords will be written to a file in JSON format

When the application first opens, the file will be read into the Dictionary object

Whenever a password is added or deleted, the file will be updated to match the Dictionary object

Initially, users are asked if they would like to View all password names, View a single password, or Delete a password

* View all
  * Lists all of the keys in the Dictionary object
* View single
  * Asks the user to enter a corresponding key in the Dictionary object
  * If it exists, ask for the user’s passphrase to de-scramble the password and display it
  * If it doesn’t exist, tell them and go back to the main menu
* Delete single
  * Asks the user to enter a corresponding key in the Dictionary object
  If it exists, delete it
  If it doesn’t exist, tell them and go back to the main menu
* Add single
  * Asks the user for the name to store it under, the password to store, and their passphrase
  * Check if the passphrase matches the end of the resultant string
  * If it does, remove it from the string and return the password to the user
  * If it doesn’t, return an error message
