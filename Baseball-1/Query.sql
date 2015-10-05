SELECT * FROM Player WHERE position = 2;
SELECT name,age FROM Player WHERE position = 1 AND team = 'Rays';
SELECT name,number,team FROM Player WHERE (position >= 7 AND position <= 9) AND age <=25;
SELECT name,number FROM Player WHERE (position >= 3 AND position <= 6) AND team = 'Red Sox';
SELECT name,number,team FROM Player WHERE position = 1 AND age > 30;
