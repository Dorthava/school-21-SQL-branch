ALTER TABLE person_discounts add constraint ch_nn_person_id check (person_id IS NOT NULL);
ALTER TABLE person_discounts add constraint ch_nn_pizzeria_id check (pizzeria_id IS NOT NULL);
ALTER TABLE person_discounts add constraint ch_nn_discount check (discount IS NOT NULL);
ALTER TABLE person_discounts ALTER discount SET DEFAULT 0;
ALTER TABLE person_discounts ALTER discount SET DEFAULT 0;
ALTER TABLE person_discounts add constraint ch_range_discount CHECK (discount>=0 AND discount <=100);