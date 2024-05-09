COMMENT ON TABLE person_discounts IS 'Information about personal discounts in each pizzeria for a specific person';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for each record in the table';
COMMENT ON COLUMN person_discounts.person_id IS 'ID of the person who should receive the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID of a pizzeria that should provide a discount to a specific person';
COMMENT ON COLUMN person_discounts.discount IS 'Percent discount';
