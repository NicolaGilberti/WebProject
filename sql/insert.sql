-- users
-- type: 2-> administrator 1-> ristoratore 0-> utente normale

INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Nicola','Gilberti','NicolaG.','nicola.gilberti@studenti.unitn.it','6e1571e0492cf7bb96ad11402430699e1b7629dc11f647f7929d3b7ed6c7483d',2); -- password : sha256(nicolag)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('David','Marinangeli','David M.','david.marinangeli@studenti.unitn.it','07d046d5fac12b3f82daf5035b9aae86db5adc8275ebfbf05ec83005a4a8ba3e',2); -- password : sha256(david)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Mirko','Pani','Mirko P.','mirko.pani@studenti.unitn.it','6eb44ff6ac59c9b9d39e7ac203910f0384e4c2d3a59c8bfd7fecb7a5f6de1e10',2); -- password : sha256(mirko)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Marco','Roberti','Marco R.','marco.roberti@studenti.unitn.it','7c8ccc86c11654af029457d90fdd9d013ce6fb011ee8fdb1374832268cc8d967',2); -- password : sha256(marco)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Riccardo','Grigoletto','Riccardo G.','riccardo.grigoletto@studenti.unitn.it','30392496896dd377fd7885d6a65b279f3d37b28eadff543685e3790d58a9fbdb',2); -- password : sha256(riccardo)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Nicola','Schiavon','Nicola S.','nicola.schiavon@studenti.unitn.it','807a09440428c0a8aef58bd3ece32938b0d76e638119e47619756f5c2c20ff3a',2); -- password : sha256(nicolas)

INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Marco','Rossi','Marco R.','marco.rossi@gmail.com','c6f4d472e844504239bd9598c27087647e00cd127b9a40ca84fe40b901a7483d',0); -- password : sha256(Marcorossi1)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Luca','Bianchi','Luca B.','lucabianchi@gmail.com','2d38a4ccd92bc90dd4ada13737ef4d5eb3ae378feef504820590f79227de7774',0); -- password : sha256(Lucab90)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Maria','Grandi','Maria G.','mariagrandi@gmail.com','5119ccb0ff6334c6792cccd55e02627a50dab4b63a347cdf47e03275bb75e793',0); -- password : sha256(Mery)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Simona','Macchia','Simona M.','macchiasimona@gmail.com','d33da997ec1ffd36547358f92f06b59d4d306183171f229523dc463e8cda3f3d',0); -- password : sha256(simomacchia)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Riccardino','Fuffolo','Riccardino F.','Fufforiccardino@gmail.it','8a85566bbac618fe04f6f59aa406b99dbc1da62c0f91d55e592a5bad876cb2df',0); -- password : sha256(Riccardino)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Herbert','Ballerina','Herbert B.','BallerinaHerb@gmail.com','2e3966ba4e2ef8cd413c7beefbb691bdc7bd4babe482d01c4274bf40d8698a7e',0); -- password : sha256(MaccioCapatonda)
INSERT INTO users (name,surname,nickname,email,password,type) VALUES ('Ristoratore','Top','Cippalippa','risto@gmail.com','3dd223a11e1d4d6794e0eb61157c02854388024466f53d2417365bcf5dc994ec',1); -- password : sha256(risto)

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

INSERT INTO cuisine(name) VALUES('Afgana'); -- 1
INSERT INTO cuisine(name) VALUES('Africana'); -- 2 
INSERT INTO cuisine(name) VALUES('Americana'); -- 3
INSERT INTO cuisine(name) VALUES('Argentina'); -- 4
INSERT INTO cuisine(name) VALUES('Asiatica');-- 5
INSERT INTO cuisine(name) VALUES('Austriaca');-- 6
INSERT INTO cuisine(name) VALUES('Bar');-- 7
INSERT INTO cuisine(name) VALUES('Barbecue');-- 9-1
INSERT INTO cuisine(name) VALUES('Birreria');-- 10-1
INSERT INTO cuisine(name) VALUES('Brasiliana'); -- 11-1
INSERT INTO cuisine(name) VALUES('Caffè'); -- 12-1
INSERT INTO cuisine(name) VALUES('Centro americana'); -- 13-1
INSERT INTO cuisine(name) VALUES('Centro europea'); -- 14-1
INSERT INTO cuisine(name) VALUES('Cibo di strada'); -- 15-1
INSERT INTO cuisine(name) VALUES('Cinese'); -- 16-1
INSERT INTO cuisine(name) VALUES('Contemporanea'); -- 17-1
INSERT INTO cuisine(name) VALUES('Coreana'); -- 18-1
INSERT INTO cuisine(name) VALUES('Texas'); -- 19-1
INSERT INTO cuisine(name) VALUES('Esteuropea'); -- 20-1
INSERT INTO cuisine(name) VALUES('Europea'); -- 21-1
INSERT INTO cuisine(name) VALUES('Fast food'); -- 22-1
INSERT INTO cuisine(name) VALUES('Francese'); -- 23-1
INSERT INTO cuisine(name) VALUES('Fusion'); -- 24-1
INSERT INTO cuisine(name) VALUES('Gastronomia'); -- 25-1
INSERT INTO cuisine(name) VALUES('Giapponese'); -- 26-1
INSERT INTO cuisine(name) VALUES('Greca'); -- 27-1
INSERT INTO cuisine(name) VALUES('Halal'); -- 28-1
INSERT INTO cuisine(name) VALUES('Indiana'); -- 29-1
INSERT INTO cuisine(name) VALUES('Internazionale'); -- 30-1
INSERT INTO cuisine(name) VALUES('Italiana'); -- 31-1
INSERT INTO cuisine(name) VALUES('Locanda balti'); -- 32-1
INSERT INTO cuisine(name) VALUES('Marocchina'); -- 33-1
INSERT INTO cuisine(name) VALUES('Mediorientale'); -- 34-1
INSERT INTO cuisine(name) VALUES('Mediterranea'); -- 35-1
INSERT INTO cuisine(name) VALUES('Messicana'); -- 36-1
INSERT INTO cuisine(name) VALUES('Mongola'); -- 37-1
INSERT INTO cuisine(name) VALUES('Senza glutine'); -- 38-1
INSERT INTO cuisine(name) VALUES('Opzioni vegane'); -- 39-1
INSERT INTO cuisine(name) VALUES('Per vegetariani'); -- 40-1
INSERT INTO cuisine(name) VALUES('Pesce'); -- 41-1
INSERT INTO cuisine(name) VALUES('Pizza'); -- 42-1
INSERT INTO cuisine(name) VALUES('Pub'); -- 43-1
INSERT INTO cuisine(name) VALUES('Americano anni 50'); -- 44-1
INSERT INTO cuisine(name) VALUES('Salutistica'); -- 45-1
INSERT INTO cuisine(name) VALUES('Spagnola'); -- 46-1
INSERT INTO cuisine(name) VALUES('Steakhouse'); -- 47-1
INSERT INTO cuisine(name) VALUES('Sudamericana'); -- 48-1
INSERT INTO cuisine(name) VALUES('Sushi'); -- 49-1
INSERT INTO cuisine(name) VALUES('Tailandese'); -- 50-1
INSERT INTO cuisine(name) VALUES('Tedesca'); -- 51-1
INSERT INTO cuisine(name) VALUES('Turca'); -- 52-1
INSERT INTO cuisine(name) VALUES('Venezuelana'); -- 53-1
INSERT INTO cuisine(name) VALUES('Wine Bar'); -- 54-1
INSERT INTO cuisine(name) VALUES('Zuppe'); -- 55-1

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

INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Dal Pescatore','Pietanze italiane creative, con molte specialita'' mantovane servite in una sala elegante o nel giardino.','https://www.dalpescatore.com/',4,3,3,4,45.171121,10.357452,'Localita'' Runate 15','46013','Canneto Sull''oglio',114);
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
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Zur Kaiserkron','Benvenuto, il tuo viaggio nel mondo del ristorante Zur Kaiserkron inizia qui. Preparati a vivere un''esperienza indimenticabile.','',4,13,13,3,46.498321,11.353288,'Piazza della Mostra 2','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Osteria dai Carrettai','Piccolo rustico locale in una delle vie più centrali di Bolzano.','https://www.tripadvisor.it/Restaurant_Review-g187857-d1057412-Reviews-Osteria_dai_Carrettai-Bolzano_Province_of_South_Tyrol_Trentino_Alto_Adige.html',4,13,13,3,46.500215,11.354820,'Via Doktor Joseph Streiter 20/b ','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Franziskanerstuben','Storia, centralità e tradizione – unione difficile da trovare in una trattoria a Bolzano. Qui dove confluiscono la via Dr. Streiter, piazza delle erbe e la via dei Francescani, viziamo i nostri clienti con specialitá regionali e una raffinata selezione di vini di alta qualità. Completamente ristrutturata nel 2014, oggi all´interno delle nostre 3 “Stuben” e della cantina storica offriamo una variegata cucina in una piacevole atmosfera.','http://www.franziskanerstuben.com/it/',4,13,13,3,46.500366, 11.353595,'Via dei Francescani 7','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Casa al Torchio','Ambiente rustico, cortesia, il gusto della cucina altoastesina, i piatti della tradizione italiana e una vasta scelta di pizze!','http://www.casaaltorchio.com/',4,13,13,3,46.499723, 11.352333,'Via Museo 2','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Bamboo','Offriamo ai nostri ospiti una vasta scelta di cibi della cucina giapponese e orientale: sushi, sashimi, tempura e molto altro ancora. Tutti piatti che prepariamo scegliendo gli ingredienti migliori: pesce fresco dai nostri mari e riso di prima qualità.','https://www.alpensushi.it/it/ristoranti/bamboo',4,13,13,3,46.496554, 11.353582,'Via dell''Isarco 3/B','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Anita','Cucina tipica di ottima qualità, porzioni abbondanti e prezzi più che ragionevoli. Ottimi dolci.','https://www.tripadvisor.it/Restaurant_Review-g187857-d1380186-Reviews-Anita-Bolzano_Province_of_South_Tyrol_Trentino_Alto_Adige.html',4,13,13,3,46.500117, 11.353185,'Piazza delle Erbe 5','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Marechiaro','Una tavola senza vino è come una giornata senza sole.','http://www.marechiarobz.it/',4,13,13,3,46.494111, 11.341640,'Via Vicenza 14','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Alumix','Alumix è un locale unico e sfaccettato, un vero spazio multifunzione per una clientela diversificata ed esigente in materia di drink e food. Il format del locale è incentrato sull''attenzione alle esigenze degli avventori: il servizio e’ un punto cruciale, inteso soprattutto come modalita’ di soddisfare i bisogni del cliente dalla colazione fino a tarda notte. Il servizio e’ familiare, cosi’ da far sentire il cliente come a casa propria, regalandogli un’ emozione unica.','http://www.alumix.it/index.asp',4,13,13,3,46.479160, 11.333225,'Via Alessandro Volta 9','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Tortuga Beer & Pizza','Ambiente molto intimo, pizza molto buona e ottima selezione di birre, personale cortese e simpatico.','https://www.tripadvisor.it/Restaurant_Review-g187857-d8360985-Reviews-Tortuga_Beer_Pizza-Bolzano_Province_of_South_Tyrol_Trentino_Alto_Adige.html',4,13,13,3,46.495175, 11.347022,'Piazzetta Questore Renato Mazzoni 9','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Da Piero - Antico Abramo','...che dire...in poche parole gusto e cordialità, con Piero e famiglia ci si trova splendidamente ! Da provare tutte le sue specialità culinarie e la sua famosa pizza da campione del mondo!','https://www.tripadvisor.it/Restaurant_Review-g187857-d1137206-Reviews-Da_Piero_Antico_Abramo-Bolzano_Province_of_South_Tyrol_Trentino_Alto_Adige.html',4,13,13,3,46.503826, 11.333962,'Piazza Gries 16','39100','Bolzano',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Beverara','L''accoglienza e il servizio di sala sono riservati ad una coppia di gentilissimi signori, con un approccio confidenziale e famigliare ma discreto e a modo. La cucina riserva piatti che appagano sempre le tue aspettative con un''eccelsa qualità di materia prima e ricette che invogliano a provarle tutte.','https://www.tripadvisor.it/Restaurant_Review-g1948051-d2697126-Reviews-Beverara-Acquanegra_sul_Chiese_Province_of_Mantua_Lombardy.html',4,13,13,3,45.168088, 10.425928,'Strada Beverara 110','46011','Acquanegra sul Chiese',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('La Filanda','Nel cuore di una terra ricca di tradizione gastronomica, una perla ricca di qualità in un ambiente raffinato. Dalla crudità di mare alle specialità del territorio, il Ristorante La Filanda Vi offre un insieme di sensazioni difficili da dimenticare. Nella nostra sala o ovunque sia di Vostro gradimento, la qualità della nostra cucina rende indimenticabili i Vostri momenti più importanti, una serata romantica o in buona compagnia.','http://www.la-filanda.it/',4,13,13,3,45.219797, 10.406646,'Via Carducci 21/E','46041','Asola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Locanda del Gastaldo','La nostra storia inizia da un attento recupero del fascinoso edificio delle Scuderie ed e'' proprio qui che potrete trascorrere piacevoli momenti degustando i nostri piatti. ','http://www.locandadelgastaldo.it/index.html',4,13,13,3,45.201515, 10.387786,'Via Sorbara 8','46041','Asola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Al Giardino Stube','La grande varietà di birre, i taglieri tipici e la preparazione del personale, rendono questo locale il luogo ideale dove passare una serata molto piacevole.','https://www.tripadvisor.it/Restaurant_Review-g1373027-d3266529-Reviews-Al_Giardino_Stube-Asola_Province_of_Mantua_Lombardy.html',4,13,13,3,45.220878, 10.416843,'Viale Belfiore 3','46041','Asola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Osteria Selvole','Gusterete ricette tradizionali in un ambiente tranquillo, rinnovato, idoneo per pranzare e cenare insieme. I suoi ampi spazi lo rendono perfetto per ogni occasione. Le comode sale climatizzate e i toni naturali del locale vi faranno sentire come a casa vostra.','http://www.osteriaselvole.it/',4,13,13,3,45.308019, 10.465635,'Strada Selvole 23','46042','Castel Goffredo',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('GASTRONOMIA LA PIALLA','Il ristorante paninoteca pizzeria "La Pialla" nasce negli anni ''80 nel cuore della provincia di mantova. Da subito abbiamo voluto portare in tavola tutto il gusto della cucina mantovana e la qualità dei nostri prodotti. La cucina mantovana è l''insieme dei piatti della tradizione culinaria della provincia italiana di Mantova, alcuni dei quali risalenti ai tempi dei Gonzaga.','http://www.gastronomialapialla.com/',4,13,13,3,45.295393, 10.476627,'Viale Europa 31','46042','Castel Goffredo',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Osteria da Pencio','arte culinaria di Mantova iniziò più di centinaia di anni fa. La gastronomia e la cucina di Casalmoro iniziano con le specialità di carne da Osteria da Pencio. La nuova gestione risponde al nome di Osteria da Pencio e propone una prelibata tavola rotonda di idee dove poter mangiare carne alla brace naturale e genuina.','http://www.osteriadapencio.it/',4,13,13,3,45.260485, 10.405707,'Via Piave 14','46040','Casalmoro',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Park Hotel','Ottimi abbinamenti con i piatti sia di pesce che di carne personale disponibile e cordiale e tempi d''attesa distinti ambiente molto bello','https://www.tripadvisor.it/Restaurant_Review-g2627015-d7077782-Reviews-Park_Hotel-Casalmoro_Province_of_Mantua_Lombardy.html',4,13,13,3,45.259905, 10.414724,'Via Asola 1','46040','Casalmoro',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Pizzeria Ristorante Sport da Luigi','Il ristorante offre una cucina varia e raffinata, anche per chi è a dieta con piatti light.','https://www.tripadvisor.it/Restaurant_Review-g1948051-d2184084-Reviews-Pizzeria_Ristorante_Sport_da_Luigi-Acquanegra_sul_Chiese_Province_of_Mantua_Lomb.html',4,13,13,3,45.161132, 10.431345,'Via Brunelli 110','46011','Acquanegra sul Chiese',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Osteria al Lago','Posto suggestivo, anche nel periodo invernale. Il locale è carino, ben arredato e curato. Il personale cordiale.','https://www.tripadvisor.it/Restaurant_Review-g1226846-d2331331-Reviews-Osteria_al_Lago-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,43.011746, 13.393794,'Lago di San Ruffino','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Vecchio Moro','Il ristorante è situato in una bella, zona ricca di verde e lontana dal traffico. Cucina tipica di qualità ad un buon prezzo. Tanto verde per far svagare i bamini','https://www.tripadvisor.it/Restaurant_Review-g1226846-d1936592-Reviews-Vecchio_Moro-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,43.011028, 13.396680,'Lago San Ruffino','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Hotel Ristorante Paradiso','Ambiente raffinato e cordiale. Cibo buono e servizio curato.','https://www.tripadvisor.it/Restaurant_Review-g1226846-d7019653-Reviews-Hotel_Ristorante_Paradiso-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.981376, 13.357412,'Piazzale Umberto Primo 7','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Ristorante Bella Napoli','Il ristorante, appena fuori il centro storico di Amandola, è stato ricavato all''interno di un vecchio monastero. Il locale è accogliente, il personale molto gentile','https://www.tripadvisor.it/Restaurant_Review-g1226846-d5821788-Reviews-Ristorante_Bella_Napoli-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.975847,13.350489,'Via Zoccolanti 10','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Rifugio Città di Amandola','Paesaggi splendidi,possibilità di fare pic-nic ed equitazione,locale accogliente,cucina ottima e personale disponibile','www.rifugiocittadiamandola.com/',4,13,13,3,42.965954, 13.287137,'Loc.Campolungo','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Gusteau','Situato nella piazza principale di Amandola, offre ristorazione ''classica'', pizzeria e funge anche da pub con una buona offerta di birre italiane.','https://www.tripadvisor.it/Restaurant_Review-g1226846-d6959206-Reviews-Gusteau-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.980558, 13.356253,'Piazza Risorgimento 31','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Gran Caffè Belli','Sotto lo storico porticato di Piazza Risorgimento, è uno dei caffè più antichi della provincia, nato nei primi anni del ''900.','http://www.grancaffebelli.it/home1.htm',4,13,13,3,42.980254, 13.355719,'Piazza Risorgimento 13','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Mare e Monti','Buona varietà e ottima qualità delle materie prime impiegate in cucina. Pietanze singole o menù completo, qualità-prezzo imbattibile.','https://www.tripadvisor.it/Restaurant_Review-g1226846-d6160366-Reviews-Mare_e_Monti-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.977120, 13.351217,'Via Cesare Battisti 102','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Bar La Stazione','È sempre un piacere venire in questo bar. Lo staff è disponibile e cortese','https://www.tripadvisor.it/Restaurant_Review-g1226846-d4554719-Reviews-Bar_La_Stazione-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.975893, 13.350826,' Via Zoccolanti 4','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Agriturismo Madonna di Piana','Location suggestiva e curata, staff molto professionale.','https://www.tripadvisor.it/Hotel_Review-g1226846-d2279327-Reviews-Agriturismo_Madonna_di_Piana-Amandola_Province_of_Fermo_Marche.html',4,13,13,3,42.985997, 13.358526,'Loc. Madonna di Piana','63857','Amandola',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('La Pergola','Ristorante elegante e raffinato con vista su Piazza San Pietro.Cucina di buon livello.','https://www.tripadvisor.it/Restaurant_Review-g187791-d806462-Reviews-La_Pergola-Rome_Lazio.html',4,13,13,3,41.918867, 12.446451,'Via Alberto Cadlolo 101','00136','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Metamorfosi Restaurant','Emozionanti e sorprendenti. Espressione di creatività e passione. Innovativi e coinvolgenti. Percorsi da scoprire e da condividere','http://www.metamorfosiroma.it/',4,13,13,3,41.924185, 12.484679,'Via Giovanni Antonelli 30','00197','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Pane e Salame','Tutta roba di qualità, gli abbinamenti degli ingredienti nei panini impeccabili. Servizio cortese, rapidi. Pane fantastico. Porchetta suprema. Ottimo rapporto qualità prezzo. Grande attenzione ai dettagli.','https://www.tripadvisor.it/Restaurant_Review-g187791-d10044289-Reviews-Pane_e_Salame-Rome_Lazio.html',4,13,13,3,41.900716, 12.481769,'Via di Santa Maria in Via 19','00187','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Il Picchio Rosso','Dalla profonda conoscenza del nostro Chef, arriva un menù di terra e mare, ricco, fantasioso, sublime. Una vera e propria poesia sul piatto che deliziera ogni momento della vostra cena. Venite a scoprire le note inconfondibli della migliore cucina italiana: non avrete di che pentirvi.','http://www.ilpicchiorosso.it/',4,13,13,3,41.993307, 12.417970,'Via Italo Piccagli 101','00189','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('L''Uliveto Shop','La gastronomia della Puglia non è solo la Puccia o la focaccina; da noi puoi trovare selezionatissimi prodotti tipici artigianali come olio d''oliva, vini, taralli, conserve varie, birre artigianale, salumi e latticini sempre freschi come: burrata, stracciatella e nodini di mozzarella. Naturalmente tutto accuratamente selezionato dallo staff professionista dell''Uliveto Shop.','http://www.lulivetoshop.it/',4,13,13,3,41.902482, 12.473330,'Via Di Monte Brianzo 66/67','00186','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Paraponzipo','‘Na Pagnottella ancora calla NON è ‘NA VIA PE’ FA’ PRIMA ma UN modo Pe’ RACCONTA’ Delle storie, la Tradizione proprio Lì, Tra er pane er companatico. NON servono 100 ingredienti pe’ non annoiasse ma l’ amore per le materie prime, ‘NA selezione sicura su cui se pò contà, pe’ divertisse A GIOCÀ su combinazioni e consistente …. perché in cucina quello che ce metti c’aritrovi! Questione de ingredienti, de scerte e de persone …..questo è er mestiere der pagnottellaro, PARAPONZIPO’','http://www.paraponzipo.it/',4,13,13,3,41.877001, 12.482258,'Piazza di Porta S. Paolo 9','00153','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Bistrè','Benvenuti al Bistrè, dove innovazione e tradizione si incontrano. La cucina dello chef unisce i sapori autentici alla cura della presentazione, perchè si sa, anche l''occhio vuole la sua parte! I prodotti genuini, serviti in un ambiente accogliente, sazieranno tutti i vostri desideri culinari. Venite a trovarci, saremo lieti di servirvi!','http://www.bistre.it/',4,13,13,3,41.852670, 12.568152,'Via Publio Rutilio Rufo 12','00174','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Artigiani della Passione','oranei del buon cibo...In uno dei rioni più antichi e caratteristici di Roma, a pochi metri da piazza Navona, Est - Artigiani del gusto è il luogo di incontro, ottimo per immergersi nella lettura dei giornali, ideale per una colazione all’italiana o internazionale, perfetto per un pranzo veloce, sano e genuino o una cena alla carta.','http://www.estartigianidelgusto.it/',4,13,13,3,41.897484, 12.471375,'Vicolo della Cancelleria 11-12','00186','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Orlando','Ambiente riservato e tranquillo, ottima cantina di Vini Siciliani. Pesce predominante nel menù. Dolci superlativi.','https://www.tripadvisor.it/Restaurant_Review-g187791-d3544980-Reviews-Orlando-Rome_Lazio.html',4,13,13,3,41.908417, 12.490553,'Angolo Via Marche 9','00187','Roma',114);
INSERT INTO restaurants(name,description,web_site_url,global_value,id_owner,id_creator,id_price_range,latitude,longitude,address,cap,city,country) VALUES ('Il Tamburello di Pulcinella','Atmosfera davvero bella personale molto simpatico e gioioso e cucina ottima.','https://www.tripadvisor.it/Restaurant_Review-g187791-d8076107-Reviews-Il_Tamburello_di_Pulcinella-Rome_Lazio.html',4,13,13,3,41.897394, 12.430070,'Via Pasquale Fiore 23','00165','Roma',114);

-- restaurant_cuisine

INSERT INTO restaurants_cuisine VALUES (30,1);
INSERT INTO restaurants_cuisine VALUES (34,1);
INSERT INTO restaurants_cuisine VALUES (20,1);
INSERT INTO restaurants_cuisine VALUES (30,2);
INSERT INTO restaurants_cuisine VALUES (6,2);
INSERT INTO restaurants_cuisine VALUES (20,2);
INSERT INTO restaurants_cuisine VALUES (37,2);
INSERT INTO restaurants_cuisine VALUES (41,3);
INSERT INTO restaurants_cuisine VALUES (30,3);
INSERT INTO restaurants_cuisine VALUES (41,4);
INSERT INTO restaurants_cuisine VALUES (30,4);
INSERT INTO restaurants_cuisine VALUES (34,4);
INSERT INTO restaurants_cuisine VALUES (37,4);
INSERT INTO restaurants_cuisine VALUES (50,5);
INSERT INTO restaurants_cuisine VALUES (30,5);
INSERT INTO restaurants_cuisine VALUES (41,5);
INSERT INTO restaurants_cuisine VALUES (20,5);
INSERT INTO restaurants_cuisine VALUES (34,5);
INSERT INTO restaurants_cuisine VALUES (54,5);
INSERT INTO restaurants_cuisine VALUES (30,6);
INSERT INTO restaurants_cuisine VALUES (41,6);
INSERT INTO restaurants_cuisine VALUES (34,6);
INSERT INTO restaurants_cuisine VALUES (20,7);
INSERT INTO restaurants_cuisine VALUES (30,7);
INSERT INTO restaurants_cuisine VALUES (41,8);
INSERT INTO restaurants_cuisine VALUES (30,8);
INSERT INTO restaurants_cuisine VALUES (30,9);
INSERT INTO restaurants_cuisine VALUES (3,9);
INSERT INTO restaurants_cuisine VALUES (7,9);
INSERT INTO restaurants_cuisine VALUES (8,9);
INSERT INTO restaurants_cuisine VALUES (20,9);
INSERT INTO restaurants_cuisine VALUES (42,9);
INSERT INTO restaurants_cuisine VALUES (30,10);
INSERT INTO restaurants_cuisine VALUES (34,10);
INSERT INTO restaurants_cuisine VALUES (20,10);
INSERT INTO restaurants_cuisine VALUES (30,11);
INSERT INTO restaurants_cuisine VALUES (34,11);
INSERT INTO restaurants_cuisine VALUES (41,11);
INSERT INTO restaurants_cuisine VALUES (39,11);
INSERT INTO restaurants_cuisine VALUES (29,12);
INSERT INTO restaurants_cuisine VALUES (29,13);
INSERT INTO restaurants_cuisine VALUES (29,14);
INSERT INTO restaurants_cuisine VALUES (29,15);
INSERT INTO restaurants_cuisine VALUES (29,16);
INSERT INTO restaurants_cuisine VALUES (29,17);
INSERT INTO restaurants_cuisine VALUES (29,18);
INSERT INTO restaurants_cuisine VALUES (29,19);
INSERT INTO restaurants_cuisine VALUES (29,20);
INSERT INTO restaurants_cuisine VALUES (29,21);
INSERT INTO restaurants_cuisine VALUES (29,22);
INSERT INTO restaurants_cuisine VALUES (29,23);
INSERT INTO restaurants_cuisine VALUES (29,24);
INSERT INTO restaurants_cuisine VALUES (29,25);
INSERT INTO restaurants_cuisine VALUES (29,26);
INSERT INTO restaurants_cuisine VALUES (29,27);
INSERT INTO restaurants_cuisine VALUES (29,28);
INSERT INTO restaurants_cuisine VALUES (29,29);
INSERT INTO restaurants_cuisine VALUES (29,30);
INSERT INTO restaurants_cuisine VALUES (29,31);
INSERT INTO restaurants_cuisine VALUES (29,32);
INSERT INTO restaurants_cuisine VALUES (29,33);
INSERT INTO restaurants_cuisine VALUES (29,34);
INSERT INTO restaurants_cuisine VALUES (29,35);
INSERT INTO restaurants_cuisine VALUES (29,36);
INSERT INTO restaurants_cuisine VALUES (29,37);
INSERT INTO restaurants_cuisine VALUES (29,38);
INSERT INTO restaurants_cuisine VALUES (29,39);
INSERT INTO restaurants_cuisine VALUES (29,40);
INSERT INTO restaurants_cuisine VALUES (29,41);
INSERT INTO restaurants_cuisine VALUES (29,42);
INSERT INTO restaurants_cuisine VALUES (29,43);
INSERT INTO restaurants_cuisine VALUES (29,44);
INSERT INTO restaurants_cuisine VALUES (29,45);
INSERT INTO restaurants_cuisine VALUES (29,46);
INSERT INTO restaurants_cuisine VALUES (29,47);
INSERT INTO restaurants_cuisine VALUES (29,48);
INSERT INTO restaurants_cuisine VALUES (29,49);
INSERT INTO restaurants_cuisine VALUES (29,50);--50

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
INSERT INTO opening_hours_range_restaurant VALUES (1,12);
INSERT INTO opening_hours_range_restaurant VALUES (3,12);
INSERT INTO opening_hours_range_restaurant VALUES (5,12);
INSERT INTO opening_hours_range_restaurant VALUES (7,12);
INSERT INTO opening_hours_range_restaurant VALUES (9,12);
INSERT INTO opening_hours_range_restaurant VALUES (11,12);
INSERT INTO opening_hours_range_restaurant VALUES (13,12);
INSERT INTO opening_hours_range_restaurant VALUES (1,13);
INSERT INTO opening_hours_range_restaurant VALUES (3,13);
INSERT INTO opening_hours_range_restaurant VALUES (5,13);
INSERT INTO opening_hours_range_restaurant VALUES (7,13);
INSERT INTO opening_hours_range_restaurant VALUES (9,13);
INSERT INTO opening_hours_range_restaurant VALUES (11,13);
INSERT INTO opening_hours_range_restaurant VALUES (13,13);
INSERT INTO opening_hours_range_restaurant VALUES (1,14);
INSERT INTO opening_hours_range_restaurant VALUES (3,14);
INSERT INTO opening_hours_range_restaurant VALUES (5,14);
INSERT INTO opening_hours_range_restaurant VALUES (7,14);
INSERT INTO opening_hours_range_restaurant VALUES (9,14);
INSERT INTO opening_hours_range_restaurant VALUES (11,14);
INSERT INTO opening_hours_range_restaurant VALUES (13,14);
INSERT INTO opening_hours_range_restaurant VALUES (1,15);
INSERT INTO opening_hours_range_restaurant VALUES (3,15);
INSERT INTO opening_hours_range_restaurant VALUES (5,15);
INSERT INTO opening_hours_range_restaurant VALUES (7,15);
INSERT INTO opening_hours_range_restaurant VALUES (9,15);
INSERT INTO opening_hours_range_restaurant VALUES (11,15);
INSERT INTO opening_hours_range_restaurant VALUES (13,15);
INSERT INTO opening_hours_range_restaurant VALUES (1,16);
INSERT INTO opening_hours_range_restaurant VALUES (3,16);
INSERT INTO opening_hours_range_restaurant VALUES (5,16);
INSERT INTO opening_hours_range_restaurant VALUES (7,16);
INSERT INTO opening_hours_range_restaurant VALUES (9,16);
INSERT INTO opening_hours_range_restaurant VALUES (11,16);
INSERT INTO opening_hours_range_restaurant VALUES (13,16);
INSERT INTO opening_hours_range_restaurant VALUES (1,17);
INSERT INTO opening_hours_range_restaurant VALUES (3,17);
INSERT INTO opening_hours_range_restaurant VALUES (5,17);
INSERT INTO opening_hours_range_restaurant VALUES (7,17);
INSERT INTO opening_hours_range_restaurant VALUES (9,17);
INSERT INTO opening_hours_range_restaurant VALUES (11,17);
INSERT INTO opening_hours_range_restaurant VALUES (13,17);
INSERT INTO opening_hours_range_restaurant VALUES (1,18);
INSERT INTO opening_hours_range_restaurant VALUES (3,18);
INSERT INTO opening_hours_range_restaurant VALUES (5,18);
INSERT INTO opening_hours_range_restaurant VALUES (7,18);
INSERT INTO opening_hours_range_restaurant VALUES (9,18);
INSERT INTO opening_hours_range_restaurant VALUES (11,18);
INSERT INTO opening_hours_range_restaurant VALUES (13,18);
INSERT INTO opening_hours_range_restaurant VALUES (1,19);
INSERT INTO opening_hours_range_restaurant VALUES (3,19);
INSERT INTO opening_hours_range_restaurant VALUES (5,19);
INSERT INTO opening_hours_range_restaurant VALUES (7,19);
INSERT INTO opening_hours_range_restaurant VALUES (9,19);
INSERT INTO opening_hours_range_restaurant VALUES (11,19);
INSERT INTO opening_hours_range_restaurant VALUES (13,19);
INSERT INTO opening_hours_range_restaurant VALUES (1,20);
INSERT INTO opening_hours_range_restaurant VALUES (3,20);
INSERT INTO opening_hours_range_restaurant VALUES (5,20);
INSERT INTO opening_hours_range_restaurant VALUES (7,20);
INSERT INTO opening_hours_range_restaurant VALUES (9,20);
INSERT INTO opening_hours_range_restaurant VALUES (11,20);
INSERT INTO opening_hours_range_restaurant VALUES (13,20);
INSERT INTO opening_hours_range_restaurant VALUES (1,21);
INSERT INTO opening_hours_range_restaurant VALUES (3,21);
INSERT INTO opening_hours_range_restaurant VALUES (5,21);
INSERT INTO opening_hours_range_restaurant VALUES (7,21);
INSERT INTO opening_hours_range_restaurant VALUES (9,21);
INSERT INTO opening_hours_range_restaurant VALUES (11,21);
INSERT INTO opening_hours_range_restaurant VALUES (13,21);
INSERT INTO opening_hours_range_restaurant VALUES (1,23);
INSERT INTO opening_hours_range_restaurant VALUES (3,23);
INSERT INTO opening_hours_range_restaurant VALUES (5,23);
INSERT INTO opening_hours_range_restaurant VALUES (7,23);
INSERT INTO opening_hours_range_restaurant VALUES (9,23);
INSERT INTO opening_hours_range_restaurant VALUES (11,23);
INSERT INTO opening_hours_range_restaurant VALUES (13,23);
INSERT INTO opening_hours_range_restaurant VALUES (1,24);
INSERT INTO opening_hours_range_restaurant VALUES (3,24);
INSERT INTO opening_hours_range_restaurant VALUES (5,24);
INSERT INTO opening_hours_range_restaurant VALUES (7,24);
INSERT INTO opening_hours_range_restaurant VALUES (9,24);
INSERT INTO opening_hours_range_restaurant VALUES (11,24);
INSERT INTO opening_hours_range_restaurant VALUES (13,24);
INSERT INTO opening_hours_range_restaurant VALUES (1,25);
INSERT INTO opening_hours_range_restaurant VALUES (3,25);
INSERT INTO opening_hours_range_restaurant VALUES (5,25);
INSERT INTO opening_hours_range_restaurant VALUES (7,25);
INSERT INTO opening_hours_range_restaurant VALUES (9,25);
INSERT INTO opening_hours_range_restaurant VALUES (11,25);
INSERT INTO opening_hours_range_restaurant VALUES (13,25);
INSERT INTO opening_hours_range_restaurant VALUES (1,26);
INSERT INTO opening_hours_range_restaurant VALUES (3,26);
INSERT INTO opening_hours_range_restaurant VALUES (5,26);
INSERT INTO opening_hours_range_restaurant VALUES (7,26);
INSERT INTO opening_hours_range_restaurant VALUES (9,26);
INSERT INTO opening_hours_range_restaurant VALUES (11,26);
INSERT INTO opening_hours_range_restaurant VALUES (13,26);
INSERT INTO opening_hours_range_restaurant VALUES (1,27);
INSERT INTO opening_hours_range_restaurant VALUES (3,27);
INSERT INTO opening_hours_range_restaurant VALUES (5,27);
INSERT INTO opening_hours_range_restaurant VALUES (7,27);
INSERT INTO opening_hours_range_restaurant VALUES (9,27);
INSERT INTO opening_hours_range_restaurant VALUES (11,27);
INSERT INTO opening_hours_range_restaurant VALUES (13,27);
INSERT INTO opening_hours_range_restaurant VALUES (1,28);
INSERT INTO opening_hours_range_restaurant VALUES (3,28);
INSERT INTO opening_hours_range_restaurant VALUES (5,28);
INSERT INTO opening_hours_range_restaurant VALUES (7,28);
INSERT INTO opening_hours_range_restaurant VALUES (9,28);
INSERT INTO opening_hours_range_restaurant VALUES (11,28);
INSERT INTO opening_hours_range_restaurant VALUES (13,28);
INSERT INTO opening_hours_range_restaurant VALUES (1,29);
INSERT INTO opening_hours_range_restaurant VALUES (3,29);
INSERT INTO opening_hours_range_restaurant VALUES (5,29);
INSERT INTO opening_hours_range_restaurant VALUES (7,29);
INSERT INTO opening_hours_range_restaurant VALUES (9,29);
INSERT INTO opening_hours_range_restaurant VALUES (11,29);
INSERT INTO opening_hours_range_restaurant VALUES (13,29);
INSERT INTO opening_hours_range_restaurant VALUES (1,30);
INSERT INTO opening_hours_range_restaurant VALUES (3,30);
INSERT INTO opening_hours_range_restaurant VALUES (5,30);
INSERT INTO opening_hours_range_restaurant VALUES (7,30);
INSERT INTO opening_hours_range_restaurant VALUES (9,30);
INSERT INTO opening_hours_range_restaurant VALUES (11,30);
INSERT INTO opening_hours_range_restaurant VALUES (13,30);
INSERT INTO opening_hours_range_restaurant VALUES (1,31);
INSERT INTO opening_hours_range_restaurant VALUES (3,31);
INSERT INTO opening_hours_range_restaurant VALUES (5,31);
INSERT INTO opening_hours_range_restaurant VALUES (7,31);
INSERT INTO opening_hours_range_restaurant VALUES (9,31);
INSERT INTO opening_hours_range_restaurant VALUES (11,31);
INSERT INTO opening_hours_range_restaurant VALUES (13,31);
INSERT INTO opening_hours_range_restaurant VALUES (1,32);
INSERT INTO opening_hours_range_restaurant VALUES (3,32);
INSERT INTO opening_hours_range_restaurant VALUES (5,32);
INSERT INTO opening_hours_range_restaurant VALUES (7,32);
INSERT INTO opening_hours_range_restaurant VALUES (9,32);
INSERT INTO opening_hours_range_restaurant VALUES (11,32);
INSERT INTO opening_hours_range_restaurant VALUES (13,32);
INSERT INTO opening_hours_range_restaurant VALUES (1,33);
INSERT INTO opening_hours_range_restaurant VALUES (3,33);
INSERT INTO opening_hours_range_restaurant VALUES (5,33);
INSERT INTO opening_hours_range_restaurant VALUES (7,33);
INSERT INTO opening_hours_range_restaurant VALUES (9,33);
INSERT INTO opening_hours_range_restaurant VALUES (11,33);
INSERT INTO opening_hours_range_restaurant VALUES (13,33);
INSERT INTO opening_hours_range_restaurant VALUES (1,34);
INSERT INTO opening_hours_range_restaurant VALUES (3,34);
INSERT INTO opening_hours_range_restaurant VALUES (5,34);
INSERT INTO opening_hours_range_restaurant VALUES (7,34);
INSERT INTO opening_hours_range_restaurant VALUES (9,34);
INSERT INTO opening_hours_range_restaurant VALUES (11,34);
INSERT INTO opening_hours_range_restaurant VALUES (13,34);
INSERT INTO opening_hours_range_restaurant VALUES (1,35);
INSERT INTO opening_hours_range_restaurant VALUES (3,35);
INSERT INTO opening_hours_range_restaurant VALUES (5,35);
INSERT INTO opening_hours_range_restaurant VALUES (7,35);
INSERT INTO opening_hours_range_restaurant VALUES (9,35);
INSERT INTO opening_hours_range_restaurant VALUES (11,35);
INSERT INTO opening_hours_range_restaurant VALUES (13,35);
INSERT INTO opening_hours_range_restaurant VALUES (1,36);
INSERT INTO opening_hours_range_restaurant VALUES (3,36);
INSERT INTO opening_hours_range_restaurant VALUES (5,36);
INSERT INTO opening_hours_range_restaurant VALUES (7,36);
INSERT INTO opening_hours_range_restaurant VALUES (9,36);
INSERT INTO opening_hours_range_restaurant VALUES (11,36);
INSERT INTO opening_hours_range_restaurant VALUES (13,36);
INSERT INTO opening_hours_range_restaurant VALUES (1,37);
INSERT INTO opening_hours_range_restaurant VALUES (3,37);
INSERT INTO opening_hours_range_restaurant VALUES (5,37);
INSERT INTO opening_hours_range_restaurant VALUES (7,37);
INSERT INTO opening_hours_range_restaurant VALUES (9,37);
INSERT INTO opening_hours_range_restaurant VALUES (11,37);
INSERT INTO opening_hours_range_restaurant VALUES (13,37);
INSERT INTO opening_hours_range_restaurant VALUES (1,38);
INSERT INTO opening_hours_range_restaurant VALUES (3,38);
INSERT INTO opening_hours_range_restaurant VALUES (5,38);
INSERT INTO opening_hours_range_restaurant VALUES (7,38);
INSERT INTO opening_hours_range_restaurant VALUES (9,38);
INSERT INTO opening_hours_range_restaurant VALUES (11,38);
INSERT INTO opening_hours_range_restaurant VALUES (13,38);
INSERT INTO opening_hours_range_restaurant VALUES (1,39);
INSERT INTO opening_hours_range_restaurant VALUES (3,39);
INSERT INTO opening_hours_range_restaurant VALUES (5,39);
INSERT INTO opening_hours_range_restaurant VALUES (7,39);
INSERT INTO opening_hours_range_restaurant VALUES (9,39);
INSERT INTO opening_hours_range_restaurant VALUES (11,39);
INSERT INTO opening_hours_range_restaurant VALUES (13,39);
INSERT INTO opening_hours_range_restaurant VALUES (1,40);
INSERT INTO opening_hours_range_restaurant VALUES (3,40);
INSERT INTO opening_hours_range_restaurant VALUES (5,40);
INSERT INTO opening_hours_range_restaurant VALUES (7,40);
INSERT INTO opening_hours_range_restaurant VALUES (9,40);
INSERT INTO opening_hours_range_restaurant VALUES (11,40);
INSERT INTO opening_hours_range_restaurant VALUES (13,40);
INSERT INTO opening_hours_range_restaurant VALUES (1,41);
INSERT INTO opening_hours_range_restaurant VALUES (3,41);
INSERT INTO opening_hours_range_restaurant VALUES (5,41);
INSERT INTO opening_hours_range_restaurant VALUES (7,41);
INSERT INTO opening_hours_range_restaurant VALUES (9,41);
INSERT INTO opening_hours_range_restaurant VALUES (11,41);
INSERT INTO opening_hours_range_restaurant VALUES (13,41);
INSERT INTO opening_hours_range_restaurant VALUES (1,47);
INSERT INTO opening_hours_range_restaurant VALUES (3,47);
INSERT INTO opening_hours_range_restaurant VALUES (5,47);
INSERT INTO opening_hours_range_restaurant VALUES (7,47);
INSERT INTO opening_hours_range_restaurant VALUES (9,47);
INSERT INTO opening_hours_range_restaurant VALUES (11,47);
INSERT INTO opening_hours_range_restaurant VALUES (13,47);
INSERT INTO opening_hours_range_restaurant VALUES (1,42);
INSERT INTO opening_hours_range_restaurant VALUES (3,42);
INSERT INTO opening_hours_range_restaurant VALUES (5,42);
INSERT INTO opening_hours_range_restaurant VALUES (7,42);
INSERT INTO opening_hours_range_restaurant VALUES (9,42);
INSERT INTO opening_hours_range_restaurant VALUES (11,42);
INSERT INTO opening_hours_range_restaurant VALUES (13,42);
INSERT INTO opening_hours_range_restaurant VALUES (1,43);
INSERT INTO opening_hours_range_restaurant VALUES (3,43);
INSERT INTO opening_hours_range_restaurant VALUES (5,43);
INSERT INTO opening_hours_range_restaurant VALUES (7,43);
INSERT INTO opening_hours_range_restaurant VALUES (9,43);
INSERT INTO opening_hours_range_restaurant VALUES (11,43);
INSERT INTO opening_hours_range_restaurant VALUES (13,43);
INSERT INTO opening_hours_range_restaurant VALUES (1,44);
INSERT INTO opening_hours_range_restaurant VALUES (3,44);
INSERT INTO opening_hours_range_restaurant VALUES (5,44);
INSERT INTO opening_hours_range_restaurant VALUES (7,44);
INSERT INTO opening_hours_range_restaurant VALUES (9,44);
INSERT INTO opening_hours_range_restaurant VALUES (11,44);
INSERT INTO opening_hours_range_restaurant VALUES (13,44);
INSERT INTO opening_hours_range_restaurant VALUES (1,45);
INSERT INTO opening_hours_range_restaurant VALUES (3,45);
INSERT INTO opening_hours_range_restaurant VALUES (5,45);
INSERT INTO opening_hours_range_restaurant VALUES (7,45);
INSERT INTO opening_hours_range_restaurant VALUES (9,45);
INSERT INTO opening_hours_range_restaurant VALUES (11,45);
INSERT INTO opening_hours_range_restaurant VALUES (13,45);
INSERT INTO opening_hours_range_restaurant VALUES (1,46);
INSERT INTO opening_hours_range_restaurant VALUES (3,46);
INSERT INTO opening_hours_range_restaurant VALUES (5,46);
INSERT INTO opening_hours_range_restaurant VALUES (7,46);
INSERT INTO opening_hours_range_restaurant VALUES (9,46);
INSERT INTO opening_hours_range_restaurant VALUES (11,46);
INSERT INTO opening_hours_range_restaurant VALUES (13,46);
INSERT INTO opening_hours_range_restaurant VALUES (1,48);
INSERT INTO opening_hours_range_restaurant VALUES (3,48);
INSERT INTO opening_hours_range_restaurant VALUES (5,48);
INSERT INTO opening_hours_range_restaurant VALUES (7,48);
INSERT INTO opening_hours_range_restaurant VALUES (9,48);
INSERT INTO opening_hours_range_restaurant VALUES (11,48);
INSERT INTO opening_hours_range_restaurant VALUES (13,48);
INSERT INTO opening_hours_range_restaurant VALUES (1,49);
INSERT INTO opening_hours_range_restaurant VALUES (3,49);
INSERT INTO opening_hours_range_restaurant VALUES (5,49);
INSERT INTO opening_hours_range_restaurant VALUES (7,49);
INSERT INTO opening_hours_range_restaurant VALUES (9,49);
INSERT INTO opening_hours_range_restaurant VALUES (11,49);
INSERT INTO opening_hours_range_restaurant VALUES (13,49);
INSERT INTO opening_hours_range_restaurant VALUES (1,50);
INSERT INTO opening_hours_range_restaurant VALUES (3,50);
INSERT INTO opening_hours_range_restaurant VALUES (5,50);
INSERT INTO opening_hours_range_restaurant VALUES (7,50);
INSERT INTO opening_hours_range_restaurant VALUES (9,50);
INSERT INTO opening_hours_range_restaurant VALUES (11,50);
INSERT INTO opening_hours_range_restaurant VALUES (13,50);--50

-- photos path: '..\Image' da definire→↓

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
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('RISTORANTE 2010 (25).JPG','Animali Dal Pescatore',1,3,'2016-10-08T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('DAL PESCATORE (5).jpg','Interni Dal Pescatore',1,2,'2016-10-06T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('Dal Pescatore 271.jpg','Cantone Dal Pescatore',1,5,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s1.jpg','Uno dei piatti serviti',12,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s2.jpg','Uno dei piatti serviti',13,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s3.jpg','Uno dei piatti serviti',14,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s4.jpg','Uno dei piatti serviti',15,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s9.jpg','Uno dei piatti serviti',16,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s5.jpg','Uno dei piatti serviti',17,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s6.jpg','Uno dei piatti serviti',18,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s7.jpg','Uno dei piatti serviti',19,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s8.jpg','Uno dei piatti serviti',20,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s10.jpg','Uno dei piatti serviti',21,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s11.jpg','Uno dei piatti serviti',22,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s12.jpg','Uno dei piatti serviti',23,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s13.jpg','Uno dei piatti serviti',24,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s14.jpg','Uno dei piatti serviti',25,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s19.jpg','Uno dei piatti serviti',26,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s15.jpg','Uno dei piatti serviti',27,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s16.jpg','Uno dei piatti serviti',28,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s17.jpg','Uno dei piatti serviti',29,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s18.jpg','Uno dei piatti serviti',30,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s20.jpg','Uno dei piatti serviti',31,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s21.jpg','Uno dei piatti serviti',32,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s22.jpg','Uno dei piatti serviti',33,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s23.jpg','Uno dei piatti serviti',34,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s24.jpg','Uno dei piatti serviti',35,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s29.jpg','Uno dei piatti serviti',36,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s25.jpg','Uno dei piatti serviti',37,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s26.png','Uno dei piatti serviti',38,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s27.jpg','Uno dei piatti serviti',39,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s28.jpg','Uno dei piatti serviti',40,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s30.jpg','Uno dei piatti serviti',41,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s31.png','Uno dei piatti serviti',42,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s32.jpg','Uno dei piatti serviti',43,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s33.jpg','Uno dei piatti serviti',44,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s34.jpg','Uno dei piatti serviti',45,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s39.jpg','Uno dei piatti serviti',46,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s35.jpg','Uno dei piatti serviti',47,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s36.jpg','Uno dei piatti serviti',48,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s37.jpg','Uno dei piatti serviti',49,13,'2016-10-02T09:46:48+00:00');
INSERT INTO photos (name, description, id_restaurant, id_user,data_creation) VALUES ('s38.jpg','Uno dei piatti serviti',50,13,'2016-10-02T09:46:48+00:00');

-- reviews (utenti registrati id [7,12])

INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-23 12:00:00',1,7);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(5,5,4,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-14 12:00:00',1,8);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,5,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-02 12:00:00',1,9);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,5,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',1,10);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',2,11);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,3,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-19 12:00:00',2,12);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,5,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',3,7);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',3,9);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,3,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-19 12:00:00',3,11);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-23 12:00:00',4,7);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(5,5,4,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-14 12:00:00',4,8);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',4,11);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,5,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',4,3);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-23 12:00:00',4,2);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(5,5,4,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-14 12:00:00',4,12);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',4,10);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,5,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',4,5);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,2,5,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',6,3);-- 18
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',7,10);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,5,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',7,12);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,2,5,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',7,4);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,3,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-19 12:00:00',8,12);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-23 12:00:00',8,9);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,2,5,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',8,3);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,5,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-02 12:00:00',9,9);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(3,4,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-29 12:00:00',10,10);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,3,3,3,4,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-19 12:00:00',10,12);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,3,4,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-23 12:00:00',11,2);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,2,5,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',11,7);
INSERT INTO reviews(global_value,food,service,value_for_money,atmosphere,name,description,data_creation,id_restaurant,id_creator) VALUES(4,4,2,5,3,'Buon Cibo','È sempre un piacere andarci a cena! L''atmosfera e'' intima, la cucina e'' ottima, dai primi tipici della tradizione ai secondi di carne, e gli alimenti sono sempre scelti attentamente.','2016-09-09 12:00:00',11,3);

-- replies con conferma di admin[1,6]

INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',1,3,'2016-09-30 12:00:30',1); -- 1,3
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',2,3,'2016-09-30 12:00:30',2); -- 1,3
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',5,2,'2016-09-30 12:00:30',3); -- 2,2
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',7,1,'2016-09-30 12:00:30',4); -- 3,1
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',8,1,'2016-09-30 12:00:30',5); -- 3,1
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',11,4,'2016-09-30 12:00:30',6); -- 4,4
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',12,4,'2016-09-30 12:00:30',1); -- 4,4
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',13,4,'2016-09-30 12:00:30',2); -- 4,4
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',14,4,'2016-09-30 12:00:30',2); -- 4,4
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',15,4,'2016-09-30 12:00:30',3); -- 4,4
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',18,6,'2016-09-30 12:00:30',5); -- 6,6
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',22,1,'2016-09-30 12:00:30',5); -- 8,1
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',25,3,'2016-09-30 12:00:30',6); -- 9,3
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',26,2,'2016-09-30 12:00:30',4); -- 10,2
INSERT INTO replies(description,data_creation,id_review,id_owner,date_validation,id_validator) VALUES('Sono Contento le sia piaciuto','2016-09-03 22:35:45',28,3,'2016-09-30 12:00:30',4); -- 11,3

-- replies senza conferma

INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',3,3);-- 1
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',6,2);-- 2
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',9,1);-- 3
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',10,4);-- 4
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',19,2);-- 7
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',20,2);-- 7
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',21,2);-- 7
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',23,1);-- 8
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',27,2);-- 10
INSERT INTO replies(description,data_creation,id_review,id_owner) VALUES('Sono Contento le sia piaciuto','2016-10-01 15:30:47',29,3);-- 11

-- user_review_likes [0,1] 1 -> +1 / 0 -> -1

INSERT INTO user_review_likes VALUES(10,3,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(8,3,0,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(9,3,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(11,6,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(7,7,0,'2016-09-25 13:45:56');
INSERT INTO user_review_likes VALUES(9,12,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(11,12,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(7,15,0,'2016-10-01 21:25:56');
INSERT INTO user_review_likes VALUES(4,18,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(11,18,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(7,18,0,'2016-09-25 13:45:56');
INSERT INTO user_review_likes VALUES(9,18,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(12,18,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(1,18,0,'2016-10-01 21:25:56');
INSERT INTO user_review_likes VALUES(9,28,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(5,28,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(3,28,0,'2016-09-25 13:45:56');
INSERT INTO user_review_likes VALUES(8,28,1,'2016-09-25 12:00:00');
INSERT INTO user_review_likes VALUES(11,28,1,'2016-10-03 12:00:00');
INSERT INTO user_review_likes VALUES(7,28,0,'2016-10-01 21:25:56');