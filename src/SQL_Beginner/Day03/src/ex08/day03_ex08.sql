INSERT INTO menu
VALUES ((SELECT 1 + MAX(menu.id) FROM menu), (SELECT pizzeria.id FROM pizzeria WHERE pizzeria.name LIKE 'Dominos'), 'sicilian pizza', 900);