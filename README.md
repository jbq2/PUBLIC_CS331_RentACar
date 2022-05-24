# PUBLIC_CS331_RentACar (MySQL, PHP, HTML, CSS, JavaScript)
### Created by: Joshua Quizon and Gabriel Pascual<br>
A private version of this repository exists, but it has sensitive information in it regarding the MySQL Database URL.  Since pull request history cannot be deleted, we decided to create a separate public repository for the project.<br>
# Brief Documentation:<br>
This repository was created for publicizing the Rent-A-Car project for CS331 Honors at NJIT.<br>
The main point of this project was to use the lessons learned regarding relational databases and SQL to program and implement a car rental website.  Although we were only tasked to create 3 pages for the implementation of our car rental database, we created 6 to implement 3 major business requirements.  The following are the business rules we focused on in this project:<br>
1. Adding and viewing cars in the database
2. Creating, confirming, and deleting reservations for customers
3. Creating and confirming agreements from existing reservations

## Adding Cars/List of Cars

The ability to add a car and view the list of cars is important since they are entities of the database and a major portion of the business rules that were given to us.  Essentially, the form asks for the car's model, year, make, VIN, location (branch), and class.  These are the attributes (columns) of the CAR entity (table).  For viewing cars, a simple SELECT query is utilized to gather necessary information for each car.  In addition, JavaScript sorting was added for convenience.<br><br>

## Reservation Feature

The website was made to support both employee and customer use.  Therefore, they can both create reservations.  The usual process for reservations can occur in three different ways: the customer can reserve a car online, a customer can call an employee that creates the reservation for them, or a customer can make a reservation through walk-in.  The form for creating the reservation asks for the branch location, estimated pick up and drop of times, car class, and the customer's name and license information.  A customer is added if the entered information is completely new.  Otherwise, the existing customer in the database is tied to the reservation.  Within the add reservation page, a table of reservations is also shown.<br>

The second page for the reservations feature of the project is for cancelling reservation.  Such a page is necessary because a customer may cancel a reservation or a customer might not show up to confirm the reservation.  It is important to note that a reservation can only be canceled if it is not tied to an agreement. Therefore, the table of reservations in the cancel reservation page only shows the reservations have not yet been converted to agreements. The page has been programmed to give the employee the ability to delete a reservation with a simple click of a button.<br><br>

## Agreement Feature

If a customer comes to confirm the reservation, it is turned into an agreement.  Agreements and reservations are two different entities in the database, though they participate in a relationship.  An agreement can only exist if a reservation exists, but a reservation can exist without an accompanying agreement.  In the agreement page, an employee can convert an existing reservation to an agreement.  It is important to note that the displayed table of reservations in this page only consist of the reservations that are not yet tied to an agreement.  The form asks for the reservation ID (reservation that is to be tied to the agreement), the actual pick up time of the vehicle, the current mileage of the vehicle, the car, and the customer's credit card information.<br>

The second page for the agreements feature of this project is for editing agreements.  It is assumed that the customer will always bring back the car (a car cannot go missing).  When a customer brings back a rental, the rental end date and the ending mileage are recorded.  In the form, it also asks for the contract number of the agreement that is to be edited.  Note that only "incomplete" agreements are displayed in the table of agreements that can be chosen.  When an incomplete agreement has been chosen, the form is partially filled with the already existing information of the agreement.  The employee is tasked to fill out the rental end date and the ending mileage of the car.<br><br>

## Entity Relationship Diagram
![image](https://user-images.githubusercontent.com/98120760/169941240-2c1f6ea2-f722-45cc-9ec0-dc8ee4dd38af.png)

## Relational Schema (3rd Normal Form)
![image](https://user-images.githubusercontent.com/98120760/169941477-7df836e8-cd09-45cd-87d9-92656f5f450c.png)

