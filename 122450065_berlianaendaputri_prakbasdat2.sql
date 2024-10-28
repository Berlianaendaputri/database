create table menu_makanan (
id SERIAL primary key,
nama_menu varchar(255),
harga integer,
kategori varchar(100)
);

insert into menu_makanan(nama_menu, harga, kategori)
values
('Nasi Goreng', 25000, 'Makanan Utama'),
('Ayam Goreng', 30000, 'Makanan Utama'),
('Soto Ayam', 28000, 'Makanan Utama'),
('Es Teh Manis', 5000, 'Minuman'),
('Jus Alpukat', 10000, 'Minuman'),
('Sop Buntut', 35000, 'Makanan Utama');

select distinct kategori
from menu_makanan;

select *
from menu_makanan
where kategori = 'Makanan Utama';

select *
from menu_makanan
where kategori = 'Minuman';

select *
from menu_makanan 
where harga between 20.000 and 30.000;

select *
from menu_makanan 
order by harga asc;

select *
from menu_makanan
where not kategori = 'Makanan Utama';

select *
from menu_makanan
where kategori = 'Minuman' or nama_menu = 'Nasi Goreng';

update menu_makanan 
set harga = 7000
where nama_menu = 'Es Teh Manis';
