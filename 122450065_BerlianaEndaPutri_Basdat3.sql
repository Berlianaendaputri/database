CREATE TABLE pelanggan (
id SERIAL PRIMARY KEY,
nama VARCHAR(100) NOT NULL,
email VARCHAR(100), 
alamat VARCHAR(255) 
);

CREATE TABLE produk ( 
id SERIAL PRIMARY KEY,
nama VARCHAR(100) NOT NULL,
harga DECIMAL (10, 2) NOT NULL
);

CREATE TABLE pesanan ( 
id SERIAL PRIMARY KEY,
id_pelanggan INT REFERENCES pelanggan (id),
nomor_pesanan VARCHAR(100), 
tanggal_pesanan DATE NOT NULL
);

CREATE TABLE pesanan_detail (
id SERIAL PRIMARY KEY,
id_pesanan INT REFERENCES pesanan (id),
id_produk INT REFERENCES produk (id),
jumlah INT NOT NULL,
harga_per_item DECIMAL(10, 2) NOT null
);

INSERT INTO pelanggan (nama, email, alamat) VALUES
('John Doe', 'john.doe@example.com', 'Jalan Sudirman No. 123'),
('Jane Smith', 'jane.smith@example.com', 'Jalan MH Thamrin No. 456'),
('Alice Johnson', 'alice.johnson@example.com', 'Jalan Gatot Subroto No. 789'),
('Bob Brown', 'bob.brown@example.com', 'Jalan Diponegoro No. 1011'),
('Eva Lee', 'eva.lee@example.com', 'Jalan Asia Afrika No. 1213');


INSERT INTO produk (nama, harga) VALUES
('Baju', 150000),
('Celana', 200000),
('Sepatu', 300000),
('Topi', 50000),
('Kacamata', 100000),
('Tas', 250000),
('Jam Tangan', 400000),
('Dompet', 150000),
('Kemeja', 180000),
('Jaket', 350000);

INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, nomor_pesanan) VALUES
(1, '2024-04-20', 'ORD2024042001'),
(1, '2024-04-22', 'ORD2024042201'),
(1, '2024-04-25', 'ORD2024042501'),
(2, '2024-04-21', 'ORD2024042101'),
(2, '2024-04-23', 'ORD2024042301'),
(2, '2024-04-26', 'ORD2024042601'),
(3, '2024-04-24', 'ORD2024042401'),
(3, '2024-04-27', 'ORD2024042701'),
(3, '2024-04-29', 'ORD2024042901'),
(4, '2024-04-28', 'ORD2024042801');




INSERT INTO pesanan_detail (id_pesanan, id_produk, jumlah, harga_per_item) VALUES
(1, 1, 2, 150000), 
(1, 2, 1, 200000),
(1, 3, 1, 300000),
(2, 4, 1, 50000), 
(2, 5, 1, 100000),
(3, 6, 1, 250000), 
(3, 7, 1, 400000),
(4, 8, 2, 150000),
(4, 9, 1, 180000), 
(4, 10, 1, 350000),
(5, 1, 1, 150000),
(5, 3, 1, 300000), 
(6, 2, 1, 200000),
(6, 4, 1, 50000), 
(7, 2, 1, 100000),
(7, 6, 1, 250000),
(7, 8, 1, 150000), 
(8, 7, 1, 400000),
(9, 9, 1, 100000), 
(9, 10, 2, 350000),
(10, 3, 1, 300000),
(10, 4, 1, 50000),
(10, 6, 1, 250000);


SELECT pn.id as order_id, pn.nomor_pesanan,p.nama as nama_pelanggan , pn.tanggal_pesanan
FROM pelanggan p
INNER JOIN pesanan pn ON p.id = pn.id_pelanggan 

SELECT pd.id_pesanan as order_id , pn.nomor_pesanan, p.nama as nama_pelanggan, pdk.nama as nama_produk, pd.harga_per_item as harga_produk
from pelanggan p 
inner join pesanan pn on p.id = pn.id_pelanggan 
inner join pesanan_detail pd on pn.id = pd.id_pesanan 
inner join produk pdk on pd.id_produk = pdk.id 

select pn.id_pelanggan, p.nama as nama_pelanggan, pn.id as order_id, pn.nomor_pesanan, pn.tanggal_pesanan
from pelanggan p 
left join pesanan pn on p.id  = pn.id_pelanggan 


select pn.id_pelanggan, p.nama as nama_pelanggan, pn.id as order_id, pn.nomor_pesanan, pn.tanggal_pesanan
from pelanggan p 
full join pesanan pn on p.id  = pn.id_pelanggan; 


SELECT p.nama AS nama_pelanggan, pdk.nama AS nama_produk
FROM pelanggan p
CROSS JOIN produk pdk;
