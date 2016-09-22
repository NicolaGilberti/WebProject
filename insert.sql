-- users
-- type: 2-> administrator 1-> ristoratore 0-> utente normale

INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Nicola','Gilberti','NicolaG.','nicola.gilberti@studenti.unitn.it','f2968eaaf566c02af66ad16da3d89f71',2); -- password : md5(nicolag)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('David','Marinangeli','David M.','david.marinangeli@studenti.unitn.it','172522ec1028ab781d9dfd17eaca4427',2); -- password : md5(david)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Mirko','Pani','Mirko P.','mirko.pani@studenti.unitn.it','13592f2caf86af30572a825229a2a8dc',2); -- password : md5(mirko)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Marco','Roberti','Marco R.','marco.roberti@studenti.unitn.it','f5888d0bb58d611107e11f7cbc41c97a',2); -- password : nicolag
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Riccardo','Grigoletto','Riccardo G.','riccardo.grigoletto@studenti.unitn.it','9667aacee4c11ab5cb1aee39cb183599',2); -- password : md5(riccardo)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Nicola','Schiavon','Nicola S.','nicola.schiavon@studenti.unitn.it','deb97a759ee7b8ba42e02dddf2b412fe',2); -- password : md5(nicolas)

-- opening_hours_range

INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (1,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (1,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (2,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (2,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (3,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (3,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (4,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (4,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (5,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (5,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (6,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (6,'18:00:00','23:30:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (7,'11:00:00','15:00:00');
INSERT INTO opening_hours_range(day_of_the_week,start_hour,end_hour) VALUES (7,'18:00:00','23:30:00');

-- cuisine

INSERT INTO cuisine(name) VALUES('afgana'); -- 1
INSERT INTO cuisine(name) VALUES('Africana'); -- 2 
INSERT INTO cuisine(name) VALUES('Americana'); -- 3
INSERT INTO cuisine(name) VALUES('argentina'); -- 4
INSERT INTO cuisine(name) VALUES('Asiatica');-- 5
INSERT INTO cuisine(name) VALUES('austriaca');-- 6
INSERT INTO cuisine(name) VALUES('bar');-- 7
INSERT INTO cuisine(name) VALUES('barbecue');-- 8
INSERT INTO cuisine(name) VALUES('Barbecue');-- 9
INSERT INTO cuisine(name) VALUES('birreria');-- 10
INSERT INTO cuisine(name) VALUES('Brasiliana'); -- 11
INSERT INTO cuisine(name) VALUES('Caffè'); -- 12
INSERT INTO cuisine(name) VALUES('centro americana'); -- 13
INSERT INTO cuisine(name) VALUES('centro europea'); -- 14
INSERT INTO cuisine(name) VALUES('Cibo di strada'); -- 15
INSERT INTO cuisine(name) VALUES('Cinese'); -- 16
INSERT INTO cuisine(name) VALUES('contemporanea'); -- 17
INSERT INTO cuisine(name) VALUES('coreana'); -- 18
INSERT INTO cuisine(name) VALUES('Texas'); -- 19
INSERT INTO cuisine(name) VALUES('Esteuropea'); -- 20
INSERT INTO cuisine(name) VALUES('Europea'); -- 21
INSERT INTO cuisine(name) VALUES('fast food'); -- 22
INSERT INTO cuisine(name) VALUES('Francese'); -- 23
INSERT INTO cuisine(name) VALUES('fusion'); -- 24
INSERT INTO cuisine(name) VALUES('Gastronomia'); -- 25
INSERT INTO cuisine(name) VALUES('Giapponese'); -- 26
INSERT INTO cuisine(name) VALUES('Greca'); -- 27
INSERT INTO cuisine(name) VALUES('halal'); -- 28
INSERT INTO cuisine(name) VALUES('Indiana'); -- 29
INSERT INTO cuisine(name) VALUES('internazionale'); -- 30
INSERT INTO cuisine(name) VALUES('Italiana'); -- 31
INSERT INTO cuisine(name) VALUES('locanda balti'); -- 32
INSERT INTO cuisine(name) VALUES('marocchina'); -- 33
INSERT INTO cuisine(name) VALUES('Mediorientale'); -- 34
INSERT INTO cuisine(name) VALUES('Mediterranea'); -- 35
INSERT INTO cuisine(name) VALUES('Messicana'); -- 36
INSERT INTO cuisine(name) VALUES('mongola'); -- 37
INSERT INTO cuisine(name) VALUES('senza glutine'); -- 38
INSERT INTO cuisine(name) VALUES('Opzioni vegane'); -- 39
INSERT INTO cuisine(name) VALUES('Per vegetariani'); -- 40
INSERT INTO cuisine(name) VALUES('Pesce'); -- 41
INSERT INTO cuisine(name) VALUES('Pizza'); -- 42
INSERT INTO cuisine(name) VALUES('Pub'); -- 43
INSERT INTO cuisine(name) VALUES('americano anni 50'); -- 44
INSERT INTO cuisine(name) VALUES('salutistica'); -- 45
INSERT INTO cuisine(name) VALUES('Spagnola'); -- 46
INSERT INTO cuisine(name) VALUES('Steakhouse'); -- 47
INSERT INTO cuisine(name) VALUES('Sudamericana'); -- 48
INSERT INTO cuisine(name) VALUES('Sushi'); -- 49
INSERT INTO cuisine(name) VALUES('Tailandese'); -- 50
INSERT INTO cuisine(name) VALUES('Tedesca'); -- 51
INSERT INTO cuisine(name) VALUES('turca'); -- 52
INSERT INTO cuisine(name) VALUES('venezuelana'); -- 53
INSERT INTO cuisine(name) VALUES('Wine Bar'); -- 54
INSERT INTO cuisine(name) VALUES('Zuppe'); -- 55

-- price_ranges

INSERT INTO price_range(min_value,max_value) VALUES(5,15);
INSERT INTO price_range(min_value,max_value) VALUES(10,25);
INSERT INTO price_range(min_value,max_value) VALUES(20,50);
INSERT INTO price_range(min_value,max_value) VALUES(30,250);

-- restaurant

INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Dal Pescatore','Pietanze italiane creative\, con molte specialita'' mantovane servite in una sala elegante o nel giardino.','https://www.dalpescatore.com/',4,3,3,4,45.171121,10.357452,'Localita'' Runate 15','46013','Canneto Sull''oglio','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Forsterbräu Trento','Cucina trentina e tirolese in birreria e ristorante Forst dall''ampia sala affrescata e dagli arredi in legno.','http://www.forst-trento.it/',4,2,2,3,46.068801, 11.122500,'Via Paolo Oss-Mazzurana 38','38100', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Pizzeria da Albert','Birre artigianali e pizze creative proposte in un piccolo e movimentato locale dall''atmosfera informale.','www.albertpizza.it/',5,1,1,2,46.065139, 11.117496,'Via Bernardino Bomporto 2','38122', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Uva e Menta','Pizza, anche per celiaci, e birre artigianali servite in un vivace ristorante moderno con soffitto a volta.','www.uvaementa.it/',4,4,4,2,46.065631, 11.124518,'Via Dietro le Mura A 35','38122', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Ristorante Pizzeria Rosa D''Oro','Piatti trentini, pizza e dolci casarecci serviti in sale semplici con arredi di legno in stile bavarese.','www.ristoranterosadoro.com/',3,5,5,2,46.068455, 11.119875,'Piazza Santa Maria Maggiore 21','38122', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Pizzeria Ristorante Alla Grotta','','',4,6,6,3,46.069820, 11.125406,'Vicolo S. Marco 6','38122', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Osteria a le Due Spade','Cucina creativa trentina e vini internazionali in elegante sala del 500 rivestita in legno, con volta a botte.','www.leduespade.com/',5,2,2,3,46.066976, 11.120268,'Via Don Arcangelo Rizzi 11','38122', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Due Giganti','','',3,1,1,2,46.068576, 11.123757,'Via San Simonino 14','38100', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('La Stube Del Galletto','Galletto allo spiedo e panini tra arredi di legno essenziali e ampie vetrate in risto-pub moderno con veranda.','www.lastubedelgalletto.com/',4,3,3,2,46.088181, 11.065352,'Via Strada di cadine 13','38123', 'Trento','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Locanda Margon','Pietanze d''autore servite in un intimo e raffinato salotto o in una veranda dalle ampie vetrate vista vigneti.','www.locandamargon.it/',4,2,2,3,46.024584, 11.108628,'Via Margone 15','38123', 'Ravina','Italia');
INSERT INTO restaurant(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,citta,stato) VALUES ('Orostube','Pietanze di terra, insalate e pizze cotte a legna in un animato ristorante con soffitti e pareti di legno.','www.locandamargon.it/',5,3,3,2,46.064814, 11.150465,'Via Sommarive 10','38123', 'Povo','Italia');

-- restaurant_cuisine

INSERT INTO restaurants_cuisine VALUES (31,1);
INSERT INTO restaurants_cuisine VALUES (35,1);
INSERT INTO restaurants_cuisine VALUES (21,1);
INSERT INTO restaurants_cuisine VALUES (31,2);
INSERT INTO restaurants_cuisine VALUES (6,2);
INSERT INTO restaurants_cuisine VALUES (21,2);
INSERT INTO restaurants_cuisine VALUES (38,2);
INSERT INTO restaurants_cuisine VALUES (42,3);
INSERT INTO restaurants_cuisine VALUES (31,3);
INSERT INTO restaurants_cuisine VALUES (42,4);
INSERT INTO restaurants_cuisine VALUES (31,4);
INSERT INTO restaurants_cuisine VALUES (35,4);
INSERT INTO restaurants_cuisine VALUES (38,4);
INSERT INTO restaurants_cuisine VALUES (51,5);
INSERT INTO restaurants_cuisine VALUES (31,5);
INSERT INTO restaurants_cuisine VALUES (42,5);
INSERT INTO restaurants_cuisine VALUES (21,5);
INSERT INTO restaurants_cuisine VALUES (35,5);
INSERT INTO restaurants_cuisine VALUES (55,5);
INSERT INTO restaurants_cuisine VALUES (31,6);
INSERT INTO restaurants_cuisine VALUES (42,6);
INSERT INTO restaurants_cuisine VALUES (35,6);
INSERT INTO restaurants_cuisine VALUES (21,7);
INSERT INTO restaurants_cuisine VALUES (31,7);
INSERT INTO restaurants_cuisine VALUES (42,8);
INSERT INTO restaurants_cuisine VALUES (31,8);
INSERT INTO restaurants_cuisine VALUES (31,9);
INSERT INTO restaurants_cuisine VALUES (3,9);
INSERT INTO restaurants_cuisine VALUES (7,9);
INSERT INTO restaurants_cuisine VALUES (9,9);
INSERT INTO restaurants_cuisine VALUES (21,9);
INSERT INTO restaurants_cuisine VALUES (43,9);
INSERT INTO restaurants_cuisine VALUES (31,10);
INSERT INTO restaurants_cuisine VALUES (35,10);
INSERT INTO restaurants_cuisine VALUES (21,10);
INSERT INTO restaurants_cuisine VALUES (31,11);
INSERT INTO restaurants_cuisine VALUES (35,11);
INSERT INTO restaurants_cuisine VALUES (42,11);
INSERT INTO restaurants_cuisine VALUES (40,11);

-- opening_hours_range_restaurnat


INSERT INTO opening_hours_range_restaurant VALUES (4,1);
INSERT INTO opening_hours_range_restaurant VALUES (6,1);
INSERT INTO opening_hours_range_restaurant VALUES (8,1);
INSERT INTO opening_hours_range_restaurant VALUES (10,1);
INSERT INTO opening_hours_range_restaurant VALUES (12,1);
INSERT INTO opening_hours_range_restaurant VALUES (14,1);
INSERT INTO opening_hours_range_restaurant VALUES (2,2);
INSERT INTO opening_hours_range_restaurant VALUES (6,2);
INSERT INTO opening_hours_range_restaurant VALUES (8,2);
INSERT INTO opening_hours_range_restaurant VALUES (10,2);
INSERT INTO opening_hours_range_restaurant VALUES (12,2);
INSERT INTO opening_hours_range_restaurant VALUES (14,2);
INSERT INTO opening_hours_range_restaurant VALUES (2,3);
INSERT INTO opening_hours_range_restaurant VALUES (4,3);
INSERT INTO opening_hours_range_restaurant VALUES (8,3);
INSERT INTO opening_hours_range_restaurant VALUES (10,3);
INSERT INTO opening_hours_range_restaurant VALUES (12,3);
INSERT INTO opening_hours_range_restaurant VALUES (14,3);
INSERT INTO opening_hours_range_restaurant VALUES (2,4);
INSERT INTO opening_hours_range_restaurant VALUES (4,4);
INSERT INTO opening_hours_range_restaurant VALUES (6,4);
INSERT INTO opening_hours_range_restaurant VALUES (10,4);
INSERT INTO opening_hours_range_restaurant VALUES (12,4);
INSERT INTO opening_hours_range_restaurant VALUES (14,4);
INSERT INTO opening_hours_range_restaurant VALUES (2,5);
INSERT INTO opening_hours_range_restaurant VALUES (4,5);
INSERT INTO opening_hours_range_restaurant VALUES (6,5);
INSERT INTO opening_hours_range_restaurant VALUES (8,5);
INSERT INTO opening_hours_range_restaurant VALUES (10,5);
INSERT INTO opening_hours_range_restaurant VALUES (12,5);
INSERT INTO opening_hours_range_restaurant VALUES (14,5);
INSERT INTO opening_hours_range_restaurant VALUES (2,6);
INSERT INTO opening_hours_range_restaurant VALUES (4,6);
INSERT INTO opening_hours_range_restaurant VALUES (6,6);
INSERT INTO opening_hours_range_restaurant VALUES (8,6);
INSERT INTO opening_hours_range_restaurant VALUES (10,6);
INSERT INTO opening_hours_range_restaurant VALUES (12,6);
INSERT INTO opening_hours_range_restaurant VALUES (14,6);
INSERT INTO opening_hours_range_restaurant VALUES (2,7);
INSERT INTO opening_hours_range_restaurant VALUES (4,7);
INSERT INTO opening_hours_range_restaurant VALUES (6,7);
INSERT INTO opening_hours_range_restaurant VALUES (8,7);
INSERT INTO opening_hours_range_restaurant VALUES (10,7);
INSERT INTO opening_hours_range_restaurant VALUES (12,7);
INSERT INTO opening_hours_range_restaurant VALUES (14,7);
INSERT INTO opening_hours_range_restaurant VALUES (2,8);
INSERT INTO opening_hours_range_restaurant VALUES (4,8);
INSERT INTO opening_hours_range_restaurant VALUES (6,8);
INSERT INTO opening_hours_range_restaurant VALUES (8,8);
INSERT INTO opening_hours_range_restaurant VALUES (10,8);
INSERT INTO opening_hours_range_restaurant VALUES (12,8);
INSERT INTO opening_hours_range_restaurant VALUES (14,8);
INSERT INTO opening_hours_range_restaurant VALUES (2,9);
INSERT INTO opening_hours_range_restaurant VALUES (4,9);
INSERT INTO opening_hours_range_restaurant VALUES (6,9);
INSERT INTO opening_hours_range_restaurant VALUES (8,9);
INSERT INTO opening_hours_range_restaurant VALUES (10,9);
INSERT INTO opening_hours_range_restaurant VALUES (12,9);
INSERT INTO opening_hours_range_restaurant VALUES (14,9);
INSERT INTO opening_hours_range_restaurant VALUES (2,10);
INSERT INTO opening_hours_range_restaurant VALUES (4,10);
INSERT INTO opening_hours_range_restaurant VALUES (6,10);
INSERT INTO opening_hours_range_restaurant VALUES (8,10);
INSERT INTO opening_hours_range_restaurant VALUES (10,10);
INSERT INTO opening_hours_range_restaurant VALUES (12,10);
INSERT INTO opening_hours_range_restaurant VALUES (14,10);
INSERT INTO opening_hours_range_restaurant VALUES (2,11);
INSERT INTO opening_hours_range_restaurant VALUES (4,11);
INSERT INTO opening_hours_range_restaurant VALUES (6,11);
INSERT INTO opening_hours_range_restaurant VALUES (8,11);
INSERT INTO opening_hours_range_restaurant VALUES (10,11);
INSERT INTO opening_hours_range_restaurant VALUES (12,11);
INSERT INTO opening_hours_range_restaurant VALUES (14,11);
INSERT INTO opening_hours_range_restaurant VALUES (1,5);
INSERT INTO opening_hours_range_restaurant VALUES (3,5);
INSERT INTO opening_hours_range_restaurant VALUES (5,5);
INSERT INTO opening_hours_range_restaurant VALUES (7,5);
INSERT INTO opening_hours_range_restaurant VALUES (9,5);
INSERT INTO opening_hours_range_restaurant VALUES (11,5);
INSERT INTO opening_hours_range_restaurant VALUES (13,5);
INSERT INTO opening_hours_range_restaurant VALUES (1,6);
INSERT INTO opening_hours_range_restaurant VALUES (3,6);
INSERT INTO opening_hours_range_restaurant VALUES (5,6);
INSERT INTO opening_hours_range_restaurant VALUES (7,6);
INSERT INTO opening_hours_range_restaurant VALUES (9,6);
INSERT INTO opening_hours_range_restaurant VALUES (11,6);
INSERT INTO opening_hours_range_restaurant VALUES (13,6);
INSERT INTO opening_hours_range_restaurant VALUES (1,9);
INSERT INTO opening_hours_range_restaurant VALUES (3,9);
INSERT INTO opening_hours_range_restaurant VALUES (5,9);
INSERT INTO opening_hours_range_restaurant VALUES (7,9);
INSERT INTO opening_hours_range_restaurant VALUES (9,9);
INSERT INTO opening_hours_range_restaurant VALUES (11,9);
INSERT INTO opening_hours_range_restaurant VALUES (13,9);
INSERT INTO opening_hours_range_restaurant VALUES (1,11);
INSERT INTO opening_hours_range_restaurant VALUES (3,11);
INSERT INTO opening_hours_range_restaurant VALUES (5,11);
INSERT INTO opening_hours_range_restaurant VALUES (7,11);
INSERT INTO opening_hours_range_restaurant VALUES (9,11);
INSERT INTO opening_hours_range_restaurant VALUES (11,11);
INSERT INTO opening_hours_range_restaurant VALUES (13,11);
 