CREATE  TABLE "public".ingredient ( 
	id                   varchar(7)  NOT NULL  ,
	designation          varchar(50)  NOT NULL  ,
	unite                numeric(2,0)  NOT NULL  ,
	prixunitaire         double precision  NOT NULL  ,
	CONSTRAINT pk_ingredient PRIMARY KEY ( id )
 );

CREATE  TABLE "public".mouvementstock ( 
	id                   bigint  NOT NULL  ,
	id_ingredient        varchar(7)  NOT NULL  ,
	montant              double precision  NOT NULL  ,
	nombre               numeric(3,0)  NOT NULL  ,
	CONSTRAINT pk_mouvementstock PRIMARY KEY ( id ),
	CONSTRAINT fk_mouvementstock_ingredient FOREIGN KEY ( id_ingredient ) REFERENCES "public".ingredient( id )   
 );

CREATE  TABLE "public".serveur ( 
	id                   varchar(10)  NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	CONSTRAINT pk_serveur PRIMARY KEY ( id )
 );

CREATE  TABLE "public".typeplat ( 
	id                   smallint  NOT NULL  ,
	designation          varchar(20)  NOT NULL  ,
	CONSTRAINT pk_typeplat PRIMARY KEY ( id )
 );

CREATE  TABLE "public".plat ( 
	id                   varchar(10)  NOT NULL  ,
	designation          varchar(50)  NOT NULL  ,
	"type"               smallint  NOT NULL  ,
	CONSTRAINT pk_plat PRIMARY KEY ( id ),
	CONSTRAINT fk_plat_typeplat FOREIGN KEY ( "type" ) REFERENCES "public".typeplat( id )   
 );

CREATE  TABLE "public".ingredientplat ( 
	id                   bigint  NOT NULL  ,
	id_plat              varchar(10)  NOT NULL  ,
	id_ingredient        varchar(7)  NOT NULL  ,
	CONSTRAINT pk_ingredientplat PRIMARY KEY ( id ),
	CONSTRAINT fk_ingredientplat_ingredient FOREIGN KEY ( id_ingredient ) REFERENCES "public".ingredient( id )   ,
	CONSTRAINT fk_ingredientplat_plat FOREIGN KEY ( id_plat ) REFERENCES "public".plat( id )   
 );

