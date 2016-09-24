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

-- states

INSERT INTO states(name,abbr) VALUES('Afghanistan','AFG');
INSERT INTO states(name,abbr) VALUES('Albania','ALB');
INSERT INTO states(name,abbr) VALUES('Algeria','DZA');
INSERT INTO states(name,abbr) VALUES('Andorra','AND');
INSERT INTO states(name,abbr) VALUES('Angola','AGO');
INSERT INTO states(name,abbr) VALUES('Anguilla','AIA');
INSERT INTO states(name,abbr) VALUES('Antartide','ATA');
INSERT INTO states(name,abbr) VALUES('Antigua e Barbuda','ATG');
INSERT INTO states(name,abbr) VALUES('Arabia Saudita','SAU');
INSERT INTO states(name,abbr) VALUES('Argentina','ARG');
INSERT INTO states(name,abbr) VALUES('Armenia','ARM');
INSERT INTO states(name,abbr) VALUES('Aruba','ABW');
INSERT INTO states(name,abbr) VALUES('Austria','AUT');
INSERT INTO states(name,abbr) VALUES('Azerbaigian','AZE');
INSERT INTO states(name,abbr) VALUES('Bahamas','BHS');
INSERT INTO states(name,abbr) VALUES('Bahrein','BHR');
INSERT INTO states(name,abbr) VALUES('Bangladesh','BGD');
INSERT INTO states(name,abbr) VALUES('Barbados','BRB');
INSERT INTO states(name,abbr) VALUES('Belgio','BEL');
INSERT INTO states(name,abbr) VALUES('Belize','BLZ');
INSERT INTO states(name,abbr) VALUES('Benin','BEN');
INSERT INTO states(name,abbr) VALUES('Bermuda','BMU');
INSERT INTO states(name,abbr) VALUES('Bhutan','BTN');
INSERT INTO states(name,abbr) VALUES('Bielorussia','BLR');
INSERT INTO states(name,abbr) VALUES('Birmania','MMR');
INSERT INTO states(name,abbr) VALUES('Bolivia','BOL');
INSERT INTO states(name,abbr) VALUES('Bosnia ed Erzegovina','BIH');
INSERT INTO states(name,abbr) VALUES('Botswana','BWA');
INSERT INTO states(name,abbr) VALUES('Brasile','BRA');
INSERT INTO states(name,abbr) VALUES('Brunei','BRN');
INSERT INTO states(name,abbr) VALUES('Bulgaria','BGR');
INSERT INTO states(name,abbr) VALUES('Burkina Faso','BFA');
INSERT INTO states(name,abbr) VALUES('Burundi','BDI');
INSERT INTO states(name,abbr) VALUES('Cambogia','KHM');
INSERT INTO states(name,abbr) VALUES('Camerun','CMR');
INSERT INTO states(name,abbr) VALUES('Canada','CAN');
INSERT INTO states(name,abbr) VALUES('Capo Verde','CPV');
INSERT INTO states(name,abbr) VALUES('Ciad','TCD');
INSERT INTO states(name,abbr) VALUES('Cile','CHL');
INSERT INTO states(name,abbr) VALUES('Cina','CHN');
INSERT INTO states(name,abbr) VALUES('Cipro','CYP');
INSERT INTO states(name,abbr) VALUES('Citta del Vaticano','VAT');
INSERT INTO states(name,abbr) VALUES('Colombia','COL');
INSERT INTO states(name,abbr) VALUES('Comore','COM');
INSERT INTO states(name,abbr) VALUES('Corea del Nord','PRK');
INSERT INTO states(name,abbr) VALUES('Corea del Sud','KOR');
INSERT INTO states(name,abbr) VALUES('Costa d''Avorio','CIV');
INSERT INTO states(name,abbr) VALUES('Costa Rica','CRI');
INSERT INTO states(name,abbr) VALUES('Croazia','HRV');
INSERT INTO states(name,abbr) VALUES('Cuba','CUB');
INSERT INTO states(name,abbr) VALUES('Cura','CUW');
INSERT INTO states(name,abbr) VALUES('Danimarca','DNK');
INSERT INTO states(name,abbr) VALUES('Dominica','DMA');
INSERT INTO states(name,abbr) VALUES('Ecuador','ECU');
INSERT INTO states(name,abbr) VALUES('Egitto','EGY');
INSERT INTO states(name,abbr) VALUES('El Salvador','SLV');
INSERT INTO states(name,abbr) VALUES('Emirati Arabi Uniti','ARE');
INSERT INTO states(name,abbr) VALUES('Eritrea','ERI');
INSERT INTO states(name,abbr) VALUES('Estonia','EST');
INSERT INTO states(name,abbr) VALUES('Etiopia','ETH');
INSERT INTO states(name,abbr) VALUES('Figi','FJI');
INSERT INTO states(name,abbr) VALUES('Filippine','PHL');
INSERT INTO states(name,abbr) VALUES('Gabon','GAB');
INSERT INTO states(name,abbr) VALUES('Gambia','GMB');
INSERT INTO states(name,abbr) VALUES('Georgia','GEO');
INSERT INTO states(name,abbr) VALUES('Georgia del Sud e isole Sandwich meridionali','SGS');
INSERT INTO states(name,abbr) VALUES('Germania','DEU');
INSERT INTO states(name,abbr) VALUES('Ghana','GHA');
INSERT INTO states(name,abbr) VALUES('Giamaica','JAM');
INSERT INTO states(name,abbr) VALUES('Giappone','JPN');
INSERT INTO states(name,abbr) VALUES('Gibilterra','GIB');
INSERT INTO states(name,abbr) VALUES('Gibuti','DJI');
INSERT INTO states(name,abbr) VALUES('Giordania','JOR');
INSERT INTO states(name,abbr) VALUES('Grecia','GRC');
INSERT INTO states(name,abbr) VALUES('Grenada','GRD');
INSERT INTO states(name,abbr) VALUES('Groenlandia','GRL');
INSERT INTO states(name,abbr) VALUES('Guadalupa','GLP');
INSERT INTO states(name,abbr) VALUES('Guam','GUM');
INSERT INTO states(name,abbr) VALUES('Guatemala','GTM');
INSERT INTO states(name,abbr) VALUES('Guernsey','GGY');
INSERT INTO states(name,abbr) VALUES('Guinea','GIN');
INSERT INTO states(name,abbr) VALUES('Guinea-Bissau','GNB');
INSERT INTO states(name,abbr) VALUES('Guinea Equatoriale','GNQ');
INSERT INTO states(name,abbr) VALUES('Guyana','GUY');
INSERT INTO states(name,abbr) VALUES('Guyana francese','GUF');
INSERT INTO states(name,abbr) VALUES('Haiti','HTI');
INSERT INTO states(name,abbr) VALUES('Honduras','HND');
INSERT INTO states(name,abbr) VALUES('Hong Kong','HKG');
INSERT INTO states(name,abbr) VALUES('India','IND');
INSERT INTO states(name,abbr) VALUES('Indonesia','IDN');
INSERT INTO states(name,abbr) VALUES('Iran','IRN');
INSERT INTO states(name,abbr) VALUES('Iraq','IRQ');
INSERT INTO states(name,abbr) VALUES('Irlanda','IRL');
INSERT INTO states(name,abbr) VALUES('Islanda','ISL');
INSERT INTO states(name,abbr) VALUES('Isola Bouvet','BVT');
INSERT INTO states(name,abbr) VALUES('Isola di Man','IMN');
INSERT INTO states(name,abbr) VALUES('Isola di Natale','CXR');
INSERT INTO states(name,abbr) VALUES('Isola Norfolk','NFK');
INSERT INTO states(name,abbr) VALUES('Isole Aland','ALA');
INSERT INTO states(name,abbr) VALUES('Isole BES','BES');
INSERT INTO states(name,abbr) VALUES('Isole Cayman','CYM');
INSERT INTO states(name,abbr) VALUES('Isole Cocos (Keeling)','CCK');
INSERT INTO states(name,abbr) VALUES('Isole Cook','COK');
INSERT INTO states(name,abbr) VALUES('Isole Falkland','FLK');
INSERT INTO states(name,abbr) VALUES('Isole Heard e McDonald','HMD');
INSERT INTO states(name,abbr) VALUES('Isole Marianne Settentrionali','MNP');
INSERT INTO states(name,abbr) VALUES('Isole Marshall','MHL');
INSERT INTO states(name,abbr) VALUES('Isole minori esterne degli Stati Uniti','UMI');
INSERT INTO states(name,abbr) VALUES('Isole Pitcairn','PCN');
INSERT INTO states(name,abbr) VALUES('Isole Salomone','SLB');
INSERT INTO states(name,abbr) VALUES('Isole Vergini britanniche','VGB');
INSERT INTO states(name,abbr) VALUES('Isole Vergini americane','VIR');
INSERT INTO states(name,abbr) VALUES('Israele','ISR');
INSERT INTO states(name,abbr) VALUES('Italia','ITA');
INSERT INTO states(name,abbr) VALUES('Jersey','JEY');
INSERT INTO states(name,abbr) VALUES('Kazakistan','KAZ');
INSERT INTO states(name,abbr) VALUES('Kenya','KEN');
INSERT INTO states(name,abbr) VALUES('Kirghizistan','KGZ');
INSERT INTO states(name,abbr) VALUES('Kiribati','KIR');
INSERT INTO states(name,abbr) VALUES('Kuwait','KWT');
INSERT INTO states(name,abbr) VALUES('Laos','LAO');
INSERT INTO states(name,abbr) VALUES('Lesotho','LSO');
INSERT INTO states(name,abbr) VALUES('Lettonia','LVA');
INSERT INTO states(name,abbr) VALUES('Libano','LBN');
INSERT INTO states(name,abbr) VALUES('Liberia','LBR');
INSERT INTO states(name,abbr) VALUES('Libia','LBY');
INSERT INTO states(name,abbr) VALUES('Liechtenstein','LIE');
INSERT INTO states(name,abbr) VALUES('Lituania','LTU');
INSERT INTO states(name,abbr) VALUES('Lussemburgo','LUX');
INSERT INTO states(name,abbr) VALUES('Macao','MAC');
INSERT INTO states(name,abbr) VALUES('Macedonia','MKD');
INSERT INTO states(name,abbr) VALUES('Madagascar','MDG');
INSERT INTO states(name,abbr) VALUES('Malawi','MWI');
INSERT INTO states(name,abbr) VALUES('Malesia','MYS');
INSERT INTO states(name,abbr) VALUES('Maldive','MDV');
INSERT INTO states(name,abbr) VALUES('Mali','MLI');
INSERT INTO states(name,abbr) VALUES('Malta','MLT');
INSERT INTO states(name,abbr) VALUES('Marocco','MAR');
INSERT INTO states(name,abbr) VALUES('Martinica','MTQ');
INSERT INTO states(name,abbr) VALUES('Mauritania','MRT');
INSERT INTO states(name,abbr) VALUES('Mauritius','MUS');
INSERT INTO states(name,abbr) VALUES('Mayotte','MYT');
INSERT INTO states(name,abbr) VALUES('Messico','MEX');
INSERT INTO states(name,abbr) VALUES('Micronesia','FSM');
INSERT INTO states(name,abbr) VALUES('Moldavia','MDA');
INSERT INTO states(name,abbr) VALUES('Mongolia','MNG');
INSERT INTO states(name,abbr) VALUES('Montenegro','MNE');
INSERT INTO states(name,abbr) VALUES('Montserrat','MSR');
INSERT INTO states(name,abbr) VALUES('Mozambico','MOZ');
INSERT INTO states(name,abbr) VALUES('Namibia','NAM');
INSERT INTO states(name,abbr) VALUES('Nauru','NRU');
INSERT INTO states(name,abbr) VALUES('Nepal','NPL');
INSERT INTO states(name,abbr) VALUES('Nicaragua','NIC');
INSERT INTO states(name,abbr) VALUES('Niger','NER');
INSERT INTO states(name,abbr) VALUES('Nigeria','NGA');
INSERT INTO states(name,abbr) VALUES('Niue','NIU');
INSERT INTO states(name,abbr) VALUES('Norvegia','NOR');
INSERT INTO states(name,abbr) VALUES('Nuova Caledonia','NCL');
INSERT INTO states(name,abbr) VALUES('Nuova Zelanda','NZL');
INSERT INTO states(name,abbr) VALUES('Oman','OMN');
INSERT INTO states(name,abbr) VALUES('Paesi Bassi','NLD');
INSERT INTO states(name,abbr) VALUES('Pakistan','PAK');
INSERT INTO states(name,abbr) VALUES('Palau','PLW');
INSERT INTO states(name,abbr) VALUES('Palestina','PSE');
INSERT INTO states(name,abbr) VALUES('Panam','PAN');
INSERT INTO states(name,abbr) VALUES('Papua Nuova Guinea','PNG');
INSERT INTO states(name,abbr) VALUES('Paraguay','PRY');
INSERT INTO states(name,abbr) VALUES('Peru','PER');
INSERT INTO states(name,abbr) VALUES('Polinesia Francese','PYF');
INSERT INTO states(name,abbr) VALUES('Polonia','POL');
INSERT INTO states(name,abbr) VALUES('Porto Rico','PRI');
INSERT INTO states(name,abbr) VALUES('Portogallo','PRT');
INSERT INTO states(name,abbr) VALUES('Monaco','MCO');
INSERT INTO states(name,abbr) VALUES('Qatar','QAT');
INSERT INTO states(name,abbr) VALUES('Regno Unito','GBR');
INSERT INTO states(name,abbr) VALUES('RD del Congo','COD');
INSERT INTO states(name,abbr) VALUES('Rep. Ceca','CZE');
INSERT INTO states(name,abbr) VALUES('Rep. Centrafricana','CAF');
INSERT INTO states(name,abbr) VALUES('Rep. del Congo','COG');
INSERT INTO states(name,abbr) VALUES('Rep. Dominicana','DOM');
INSERT INTO states(name,abbr) VALUES('Riunione','REU');
INSERT INTO states(name,abbr) VALUES('Romania','ROU');
INSERT INTO states(name,abbr) VALUES('Ruanda','RWA');
INSERT INTO states(name,abbr) VALUES('Russia','RUS');
INSERT INTO states(name,abbr) VALUES('Sahara Occidentale','ESH');
INSERT INTO states(name,abbr) VALUES('Saint Kitts e Nevis','KNA');
INSERT INTO states(name,abbr) VALUES('Santa Lucia','LCA');
INSERT INTO states(name,abbr) VALUES('Sant''Elena, Ascensione e Tristan da Cunha','SHN');
INSERT INTO states(name,abbr) VALUES('Saint Vincent e Grenadine','VCT');
INSERT INTO states(name,abbr) VALUES('Saint-Barth','BLM');
INSERT INTO states(name,abbr) VALUES('Saint-Martin','MAF');
INSERT INTO states(name,abbr) VALUES('Saint-Pierre e Miquelon','SPM');
INSERT INTO states(name,abbr) VALUES('Samoa','WSM');
INSERT INTO states(name,abbr) VALUES('Samoa Americane','ASM');
INSERT INTO states(name,abbr) VALUES('San Marino','SMR');
INSERT INTO states(name,abbr) VALUES('Repubblica di Vanuatu','VAN');
INSERT INTO states(name,abbr) VALUES('Senegal','SEN');
INSERT INTO states(name,abbr) VALUES('Serbia','SRB');
INSERT INTO states(name,abbr) VALUES('Seychelles','SYC');
INSERT INTO states(name,abbr) VALUES('Sierra Leone','SLE');
INSERT INTO states(name,abbr) VALUES('Singapore','SGP');
INSERT INTO states(name,abbr) VALUES('Sint Maarten','SXM');
INSERT INTO states(name,abbr) VALUES('Siria','SYR');
INSERT INTO states(name,abbr) VALUES('Slovacchia','SVK');
INSERT INTO states(name,abbr) VALUES('Slovenia','SVN');
INSERT INTO states(name,abbr) VALUES('Somalia','SOM');
INSERT INTO states(name,abbr) VALUES('Spagna','ESP');
INSERT INTO states(name,abbr) VALUES('Sri Lanka','LKA');
INSERT INTO states(name,abbr) VALUES('Stati Uniti','USA');
INSERT INTO states(name,abbr) VALUES('Sudafrica','ZAF');
INSERT INTO states(name,abbr) VALUES('Sudan','SDN');
INSERT INTO states(name,abbr) VALUES('Sudan del Sud','SSD');
INSERT INTO states(name,abbr) VALUES('Suriname','SUR');
INSERT INTO states(name,abbr) VALUES('Svalbard e Jan Mayen','SJM');
INSERT INTO states(name,abbr) VALUES('Svezia','SWE');
INSERT INTO states(name,abbr) VALUES('Svizzera','CHE');
INSERT INTO states(name,abbr) VALUES('Swaziland','SWZ');
INSERT INTO states(name,abbr) VALUES('Taiwan','TWN');
INSERT INTO states(name,abbr) VALUES('Tagikistan','TJK');
INSERT INTO states(name,abbr) VALUES('Tanzania','TZA');
INSERT INTO states(name,abbr) VALUES('Terre australi e antartiche francesi','ATF');
INSERT INTO states(name,abbr) VALUES('Territorio britannico dell''oceano Indiano','IOT');
INSERT INTO states(name,abbr) VALUES('Thailandia','THA');
INSERT INTO states(name,abbr) VALUES('Timor Est','TLS');
INSERT INTO states(name,abbr) VALUES('Togo','TGO');
INSERT INTO states(name,abbr) VALUES('Tokelau','TKL');
INSERT INTO states(name,abbr) VALUES('Tonga','TON');
INSERT INTO states(name,abbr) VALUES('Trinidad e Tobago','TTO');
INSERT INTO states(name,abbr) VALUES('Tunisia','TUN');
INSERT INTO states(name,abbr) VALUES('Turchia','TUR');
INSERT INTO states(name,abbr) VALUES('Turkmenistan','TKM');
INSERT INTO states(name,abbr) VALUES('Turks e Caicos','TCA');
INSERT INTO states(name,abbr) VALUES('Tuvalu','TUV');
INSERT INTO states(name,abbr) VALUES('Ucraina','UKR');
INSERT INTO states(name,abbr) VALUES('Uganda','UGA');
INSERT INTO states(name,abbr) VALUES('Ungheria','HUN');
INSERT INTO states(name,abbr) VALUES('Uruguay','URY');
INSERT INTO states(name,abbr) VALUES('Uzbekistan','UZB');
INSERT INTO states(name,abbr) VALUES('Vanuatu','VUT');
INSERT INTO states(name,abbr) VALUES('Venezuela','VEN');
INSERT INTO states(name,abbr) VALUES('Vietnam','VNM');
INSERT INTO states(name,abbr) VALUES('Wallis e Futuna','WLF');
INSERT INTO states(name,abbr) VALUES('Yemen','YEM');
INSERT INTO states(name,abbr) VALUES('Zambia','ZMB');
INSERT INTO states(name,abbr) VALUES('Zimbabwe','ZWE');

-- restaurants

INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Dal Pescatore','Pietanze italiane creative\, con molte specialita'' mantovane servite in una sala elegante o nel giardino.','https://www.dalpescatore.com/',4,3,3,4,45.171121,10.357452,'Localita'' Runate 15','46013','Canneto Sull''oglio',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Forsterbräu Trento','Cucina trentina e tirolese in birreria e ristorante Forst dall''ampia sala affrescata e dagli arredi in legno.','http://www.forst-trento.it/',4,2,2,3,46.068801, 11.122500,'Via Paolo Oss-Mazzurana 38','38100', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Pizzeria da Albert','Birre artigianali e pizze creative proposte in un piccolo e movimentato locale dall''atmosfera informale.','www.albertpizza.it/',5,1,1,2,46.065139, 11.117496,'Via Bernardino Bomporto 2','38122', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Uva e Menta','Pizza, anche per celiaci, e birre artigianali servite in un vivace ristorante moderno con soffitto a volta.','www.uvaementa.it/',4,4,4,2,46.065631, 11.124518,'Via Dietro le Mura A 35','38122', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Ristorante Pizzeria Rosa D''Oro','Piatti trentini, pizza e dolci casarecci serviti in sale semplici con arredi di legno in stile bavarese.','www.ristoranterosadoro.com/',3,5,5,2,46.068455, 11.119875,'Piazza Santa Maria Maggiore 21','38122', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Pizzeria Ristorante Alla Grotta','','',4,6,6,3,46.069820, 11.125406,'Vicolo S. Marco 6','38122', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Osteria a le Due Spade','Cucina creativa trentina e vini internazionali in elegante sala del 500 rivestita in legno, con volta a botte.','www.leduespade.com/',5,2,2,3,46.066976, 11.120268,'Via Don Arcangelo Rizzi 11','38122', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Due Giganti','','',3,1,1,2,46.068576, 11.123757,'Via San Simonino 14','38100', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('La Stube Del Galletto','Galletto allo spiedo e panini tra arredi di legno essenziali e ampie vetrate in risto-pub moderno con veranda.','www.lastubedelgalletto.com/',4,3,3,2,46.088181, 11.065352,'Via Strada di cadine 13','38123', 'Trento',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Locanda Margon','Pietanze d''autore servite in un intimo e raffinato salotto o in una veranda dalle ampie vetrate vista vigneti.','www.locandamargon.it/',4,2,2,3,46.024584, 11.108628,'Via Margone 15','38123', 'Ravina',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Orostube','Pietanze di terra, insalate e pizze cotte a legna in un animato ristorante con soffitti e pareti di legno.','www.locandamargon.it/',5,3,3,2,46.064814, 11.150465,'Via Sommarive 10','38123', 'Povo',114);

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

-- photos path: '..\Image' da finire diocane →↓

INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('20443944484fe4333ba1832_large.jpg','Interni Orostube',11,1,'2016-09-24 01:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('esterno3.jpg','Esterno Margon',10,2,'2016-09-24 02:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('cbk.jpg','Ristorante alla grotta',6,3,'2016-09-24 03:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('frost.jpg','Interni Frost',2,4,'2016-09-24 04:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('img.jpg','Interni Rosa D''oro',5,5,'2016-09-24 05:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('InternoSPADE.JPG','Interni Le Due Spade',7,6,'2016-09-24 06:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('ladycapri5.jpg','Pizza  da Albert',3,1,'2016-09-24 07:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('la-stube-del-galletto.jpg','Interni Stube Del Galletto',9,2,'2016-09-24 08:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('prova.jpg','Esterno Dal Pescatore',1,3,'2016-09-24 09:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('ristorante.jpg','Interni Uva e Menta',4,4,'2016-09-24 10:00:00');
INSERT INTO photos(name,description,id_restaurant,id_user,data_creation) VALUES ('ristorante-bar-pizzeria-due-giganti-20110209-132031.jpg','Esterno Due Giganti',8,5,'2016-09-24 11:00:00');

