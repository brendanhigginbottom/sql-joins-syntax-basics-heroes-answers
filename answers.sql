-- 1. How many powers are there?

SELECT COUNT(*) FROM "super_powers";

-- 2. List all heroes and their powers.

Select "heroes"."name", "super_powers"."name" from "heroes"
JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "super_powers"."id" = "heroes_powers"."super_power_id";


-- 3. Find all of Professor X's powers.
SELECT "heroes"."name", "super_powers"."name" FROM "heroes"
JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "heroes_powers"."super_power_id" = "super_powers"."id"
WHERE "heroes"."name" = 'Professor X';
;

-- 4. Add a new super power. 
INSERT INTO "super_powers" ("name", "description")
VALUES ('Coding', 'SQL Psycho');

-- 5. Add this power to an existing hero.
Insert Into "heroes_powers" ("hero_id", "super_power_id", "power_level")
Values (4,9,1000);

-- 6. Which heroes have laser vision? Include their name and alias.

SELECT "heroes"."name", "heroes"."alias", "super_powers"."name"
FROM "heroes" JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "super_powers"."id" = "heroes_powers"."super_power_id"
WHERE "super_powers"."name" = 'Laser Vision';

-- 7. How many can fly? A twist on the above...
SELECT COUNT(*) AS "Number of heroes who can fly"
FROM "heroes" JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "super_powers"."id" = "heroes_powers"."super_power_id"
WHERE "super_powers"."name" = 'Flight';


-- 8. What is the average super strength power level?
SELECT AVG("heroes_powers"."power_level") AS "AVG super power power level"
FROM "heroes_powers";

-- 9. Show all the information for heroes with super strength power level over 2.
SELECT "heroes".*, "super_powers".*, "heroes_powers"."power_level" FROM "heroes"
JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "super_powers"."id" = "heroes_powers"."super_power_id"
WHERE "heroes_powers"."power_level" > 2;

-- 10. Find the average power level for all powers. Include the power name and descriptions.

SELECT AVG("heroes_powers"."power_level"), "super_powers"."name", "super_powers"."description"
FROM "heroes" JOIN "heroes_powers" ON "heroes"."id" = "heroes_powers"."hero_id"
JOIN "super_powers" ON "super_powers"."id" = "heroes_powers"."super_power_id"
GROUP BY "super_powers"."name", "super_powers"."description"
ORDER BY AVG DESC;