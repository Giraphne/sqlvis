CREATE TABLE customer ( 
    cID Integer,
    cName Text,
    street Text,
    city Text,
    PRIMARY KEY (cID));

CREATE TABLE store ( 
    sID Integer,
    sName Text,
    street Text,
    city Text,
    PRIMARY KEY (sID));
    
CREATE TABLE product ( 
    pID Integer,
    pName Text,
    suffix Text,
    PRIMARY KEY (pID));
    
CREATE TABLE purchase (
    tID Integer,
    cID Integer,
    sID Integer,
    pID Integer,
    date Date,
    quantity Integer,
    price Decimal(10, 2),
    PRIMARY KEY (tID, pID),
    FOREIGN KEY (cID) REFERENCES customer(cID),
    FOREIGN KEY (sID) REFERENCES store(sID),
    FOREIGN KEY (pID) REFERENCES product(pID));

	
	

INSERT INTO customer VALUES (0,"Noah","Koestraat","Utrecht");
INSERT INTO customer VALUES (1,"Sem","Rozemarijnstraat","Breda");
INSERT INTO customer VALUES (2,"Lucas","Oude Leliestraat","Amsterdam");
INSERT INTO customer VALUES (3,"Finn","Stationsplein","Breda");
INSERT INTO customer VALUES (4,"Daan","Kalverstraat","Amsterdam");
INSERT INTO customer VALUES (5,"Levi","Gasthuisstraat","Utrecht");
INSERT INTO customer VALUES (6,"Milan","Parallelweg","Utrecht");
INSERT INTO customer VALUES (7,"Bram","Schoolstraat","Eindhoven");
INSERT INTO customer VALUES (8,"Liam","Rijsbergseweg","Breda");
INSERT INTO customer VALUES (9,"Thomas","Parallelweg","Amsterdam");
INSERT INTO customer VALUES (10,"Sam","Langestraat","Tilburg");
INSERT INTO customer VALUES (11,"Thijs","Koestraat","Tilburg");
INSERT INTO customer VALUES (12,"Adam","Nieuwstraat","Eindhoven");
INSERT INTO customer VALUES (13,"James","Sint Annastraat","Breda");
INSERT INTO customer VALUES (14,"Max","Eikenlaan","Tilburg");
INSERT INTO customer VALUES (15,"Noud","Koningshoeve","Tilburg");
INSERT INTO customer VALUES (16,"Julian","Prins Bernhardstraat","Eindhoven");
INSERT INTO customer VALUES (17,"Dex","Kasteeldreef","Tilburg");
INSERT INTO customer VALUES (18,"Hugo","Kasteeldreef","Tilburg");
INSERT INTO customer VALUES (19,"Lars","Rijsbergseweg","Breda");
INSERT INTO customer VALUES (20,"Gijs","Heiligeweg","Amsterdam");

INSERT INTO product VALUES (0,"Cashew Nuts","");
INSERT INTO product VALUES (1,"Mixed Nuts","");
INSERT INTO product VALUES (2,"Potatoes","");
INSERT INTO product VALUES (3,"Green Pepper","");
INSERT INTO product VALUES (4,"Onions","");
INSERT INTO product VALUES (5,"Mushrooms","");
INSERT INTO product VALUES (6,"Carrots","");
INSERT INTO product VALUES (7,"Tomatoes","");
INSERT INTO product VALUES (8,"Hot Dog Sausages","");
INSERT INTO product VALUES (9,"Bananas","");
INSERT INTO product VALUES (10,"Water","");
INSERT INTO product VALUES (11,"Milk","");
INSERT INTO product VALUES (12,"Beef","");
INSERT INTO product VALUES (13,"Eggs","");
INSERT INTO product VALUES (14,"Apples","");
INSERT INTO product VALUES (15,"Cucumbers","");
INSERT INTO product VALUES (16,"Rice","");
INSERT INTO product VALUES (17,"Bread","");
INSERT INTO product VALUES (18,"Cheese","");
INSERT INTO product VALUES (19,"Coca","");
INSERT INTO product VALUES (20,"Fanta","");

INSERT INTO store VALUES (0,"Coop","Kalverstraat","Amsterdam");
INSERT INTO store VALUES (1,"Hoogvliet","Rozemarijnstraat","Breda");
INSERT INTO store VALUES (2,"Jumbo","Stadhoudersweg","Rotterdam");
INSERT INTO store VALUES (3,"Sligro","Stadhoudersweg","Rotterdam");
INSERT INTO store VALUES (4,"Hoogvliet","Molenstraat","Eindhoven");
INSERT INTO store VALUES (5,"Sligro","Stationsplein","Breda");
INSERT INTO store VALUES (6,"Coop","Stadhoudersweg","Rotterdam");
INSERT INTO store VALUES (7,"Sligro","Wilhelminastraat","Eindhoven");
INSERT INTO store VALUES (8,"Albert Hein","Molenstraat","Eindhoven");
INSERT INTO store VALUES (9,"Albert Hein","Koestraat","Tilburg");
INSERT INTO store VALUES (10,"Jumbo","Bergselaan","Rotterdam");
INSERT INTO store VALUES (11,"Albert Hein","Hofplein","Rotterdam");
INSERT INTO store VALUES (12,"Lidl","Wilhelminastraat","Eindhoven");
INSERT INTO store VALUES (13,"Coop","Koestraat","Tilburg");
INSERT INTO store VALUES (14,"Coop","Keizersgracht","Amsterdam");
INSERT INTO store VALUES (15,"Lidl","Prinsengracht","Amsterdam");
INSERT INTO store VALUES (16,"Lidl","Ambachtstraat","Utrecht");
INSERT INTO store VALUES (17,"Hoogvliet","Kerkstraat","Eindhoven");
INSERT INTO store VALUES (18,"Sligro","Parallelweg","Tilburg");
INSERT INTO store VALUES (19,"Coop","Karrestraat","Breda");
INSERT INTO store VALUES (20,"Jumbo","Kasteeldreef","Tilburg");

INSERT INTO purchase VALUES (0,0,3,10, date('2018-08-22'),1,0.45);
INSERT INTO purchase VALUES (1,1,20,14, date('2018-08-20'),2,4.65);
INSERT INTO purchase VALUES (2,1,3,16, date('2018-08-20'),3,1.6);
INSERT INTO purchase VALUES (3,1,17,9, date('2018-08-20'),2,1.25);
INSERT INTO purchase VALUES (4,1,2,5, date('2018-08-20'),4,3.95);
INSERT INTO purchase VALUES (5,1,16,20, date('2018-08-20'),4,2.75);
INSERT INTO purchase VALUES (6,1,16,11, date('2018-08-21'),8,0.9);
INSERT INTO purchase VALUES (7,1,3,7, date('2018-08-21'),6,9.1);
INSERT INTO purchase VALUES (8,2,12,20, date('2018-08-16'),1,2.45);
INSERT INTO purchase VALUES (9,2,9,9, date('2018-08-17'),7,1.35);
INSERT INTO purchase VALUES (10,2,13,4, date('2018-08-17'),6,1.1);
INSERT INTO purchase VALUES (11,2,1,13, date('2018-08-17'),4,3.7);
INSERT INTO purchase VALUES (12,2,4,20, date('2018-08-17'),1,1.55);
INSERT INTO purchase VALUES (13,3,14,14, date('2018-08-18'),2,4.3);
INSERT INTO purchase VALUES (14,3,3,6, date('2018-08-19'),2,2.75);
INSERT INTO purchase VALUES (15,3,13,9, date('2018-08-19'),6,1.45);
INSERT INTO purchase VALUES (16,4,17,8, date('2018-08-24'),2,4.15);
INSERT INTO purchase VALUES (17,4,10,2, date('2018-08-24'),9,9.05);
INSERT INTO purchase VALUES (18,4,5,12, date('2018-08-25'),5,13.6);
INSERT INTO purchase VALUES (19,4,20,6, date('2018-08-24'),2,1.05);
INSERT INTO purchase VALUES (20,4,7,13, date('2018-08-25'),9,3.05);
INSERT INTO purchase VALUES (21,4,4,6, date('2018-08-25'),4,2.75);
INSERT INTO purchase VALUES (22,5,4,14, date('2018-08-17'),6,4.7);
INSERT INTO purchase VALUES (23,5,6,8, date('2018-08-22'),6,8.25);
INSERT INTO purchase VALUES (24,5,15,6, date('2018-08-23'),9,1.1);
INSERT INTO purchase VALUES (25,5,1,12, date('2018-08-23'),2,1.55);
INSERT INTO purchase VALUES (26,5,6,16, date('2018-08-23'),2,1.85);
INSERT INTO purchase VALUES (27,5,17,19, date('2018-08-23'),1,2.2);
INSERT INTO purchase VALUES (28,7,3,19, date('2018-08-23'),2,2.1);
INSERT INTO purchase VALUES (29,7,12,2, date('2018-08-23'),6,1.7);
INSERT INTO purchase VALUES (30,7,11,16, date('2018-08-24'),4,1.9);
INSERT INTO purchase VALUES (31,7,12,12, date('2018-08-25'),2,10.75);
INSERT INTO purchase VALUES (32,7,18,6, date('2018-08-26'),4,1.05);
INSERT INTO purchase VALUES (33,7,4,20, date('2018-08-26'),6,2.05);
INSERT INTO purchase VALUES (34,8,3,6, date('2018-08-16'),7,0.95);
INSERT INTO purchase VALUES (35,8,15,8, date('2018-08-16'),5,5.3);
INSERT INTO purchase VALUES (36,10,14,4, date('2018-08-27'),5,3.2);
INSERT INTO purchase VALUES (37,11,0,4, date('2018-08-25'),8,4.1);
INSERT INTO purchase VALUES (38,13,3,0, date('2018-08-17'),5,5.35);
INSERT INTO purchase VALUES (39,13,4,13, date('2018-08-17'),6,2.55);
INSERT INTO purchase VALUES (40,13,16,8, date('2018-08-17'),3,5.4);
INSERT INTO purchase VALUES (41,13,3,17, date('2018-08-25'),5,2);
INSERT INTO purchase VALUES (42,13,5,19, date('2018-08-25'),5,2.4);
INSERT INTO purchase VALUES (43,13,20,10, date('2018-08-25'),4,0.4);
INSERT INTO purchase VALUES (44,13,4,3, date('2018-08-25'),1,1.7);
INSERT INTO purchase VALUES (45,13,16,9, date('2018-08-26'),3,1.65);
INSERT INTO purchase VALUES (46,13,8,5, date('2018-08-27'),6,0.5);
INSERT INTO purchase VALUES (47,15,15,11, date('2018-08-27'),5,0.9);
INSERT INTO purchase VALUES (48,16,5,0, date('2018-08-24'),1,3.7);
INSERT INTO purchase VALUES (49,16,14,12, date('2018-08-24'),3,2.35);
INSERT INTO purchase VALUES (50,16,2,5, date('2018-08-25'),7,0.55);
INSERT INTO purchase VALUES (51,16,2,2, date('2018-08-25'),5,1.9);
INSERT INTO purchase VALUES (52,16,1,2, date('2018-08-25'),7,2.5);
INSERT INTO purchase VALUES (53,16,2,19, date('2018-08-26'),8,3);
INSERT INTO purchase VALUES (54,16,5,16, date('2018-08-27'),8,1.85);
INSERT INTO purchase VALUES (55,16,6,13, date('2018-08-18'),1,2.9);
INSERT INTO purchase VALUES (56,16,13,7, date('2018-08-19'),3,1.8);
INSERT INTO purchase VALUES (57,16,6,7, date('2018-08-19'),2,9.25);
INSERT INTO purchase VALUES (58,17,1,14, date('2018-08-19'),9,3.8);
INSERT INTO purchase VALUES (59,17,4,7, date('2018-08-19'),10,1.65);
INSERT INTO purchase VALUES (60,18,19,20, date('2018-08-16'),4,2.7);
INSERT INTO purchase VALUES (61,18,2,9, date('2018-08-16'),6,1.7);
INSERT INTO purchase VALUES (62,18,6,8, date('2018-08-18'),4,4.45);
INSERT INTO purchase VALUES (63,19,9,0, date('2018-08-17'),1,3.9);
INSERT INTO purchase VALUES (64,19,3,20, date('2018-08-18'),1,2.05);
INSERT INTO purchase VALUES (65,19,2,15, date('2018-08-18'),1,1.05);
INSERT INTO purchase VALUES (66,19,15,3, date('2018-08-18'),4,1.6);
INSERT INTO purchase VALUES (67,20,9,7, date('2018-08-17'),12,2);
INSERT INTO purchase VALUES (68,20,2,0, date('2018-08-18'),3,5.4);
INSERT INTO purchase VALUES (69,20,4,2, date('2018-08-18'),9,7.1);
INSERT INTO purchase VALUES (70,6,1,6, date('2018-08-15'),3,3.45);
INSERT INTO purchase VALUES (71,6,2,13, date('2018-08-16'),3,2.4);
INSERT INTO purchase VALUES (72,6,7,7, date('2018-08-21'),9,7.05);
INSERT INTO purchase VALUES (73,9,2,8, date('2018-08-27'),3,8.05);
INSERT INTO purchase VALUES (74,9,7,10, date('2018-08-28'),6,0.45);
INSERT INTO purchase VALUES (75,14,2,4, date('2018-08-19'),1,3.15);
INSERT INTO purchase VALUES (76,14,0,16, date('2018-08-19'),9,1.4);
INSERT INTO purchase VALUES (77,14,11,18, date('2018-08-20'),1,11.55);
INSERT INTO purchase VALUES (78,14,17,5, date('2018-08-20'),7,0.55);
INSERT INTO purchase VALUES (79,12,5,10, date('2018-08-20'),1,0.6);
INSERT INTO purchase VALUES (80,12,9,7, date('2018-08-20'),4,2.05);
INSERT INTO purchase VALUES (81,12,14,0, date('2018-08-20'),3,4.8);
INSERT INTO purchase VALUES (82,12,16,6, date('2018-08-20'),3,1.15);