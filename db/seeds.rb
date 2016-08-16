# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'vijay@example.com', password: 'Vijay@2212', password_confirmation: 'Vijay@2212');

#CREATE INDEX ssid_idx  ON public.networks USING btree (ssid COLLATE pg_catalog.default) TABLESPACE pg_default