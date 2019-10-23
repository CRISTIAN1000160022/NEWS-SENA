drop database if exists proyecto_grupal;
create database proyecto_grupal;
use proyecto_grupal; 
-- Cración de tablas...
-- 1
create table persona 
(
id_persona varchar(13) not null,
pkfk_cod_td_p varchar(5) not null,
p_nombre_p char(15) not null,
s_nombre_p char(15) null,
p_apellido_p char(20) not null,
s_apellido_p char(15) null,
estado_p tinyint(1) not null,
primary key (id_persona,pkfk_cod_td_p)
);
-- 2
  create table tipo_documento
(
cod_td varchar(5) not null,
desc_td char(35) not null,
estado_td tinyint(1) not null,
primary key (cod_td)
);
-- 3
  create table empresa
(
nit_empresa varchar(15) not null,
nombre_empresa char(30) not null,
estado_e tinyint(1) not null,
primary key (nit_empresa)
);  
-- 4 
create table instructor
(
pkfk_id_persona_i varchar(13) not null,
pkfk_cod_td_i varchar(5) not null,
estado_i tinyint(1) not null,
primary key(pkfk_id_persona_i ,pkfk_cod_td_i)
);  
-- 5 
create table encargado
(
pkfk_id_persona_e varchar(13) not null,
pkfk_cod_td_e varchar(5) not null,
cargo_e char(20) not null,
estado_e tinyint(1) not null,
primary key (pkfk_id_persona_e,pkfk_cod_td_e)
);  
-- 6
create table ficha (
  cod_ficha varchar(13) not null,
  fk_cod_jornada_f varchar(10) not null,
  fk_cod_programa_f varchar(10) not null,
  estado_ficha tinyint(1) not null,
  primary key(cod_ficha)
);
-- 7
create table programa (
  cod_programa varchar(10) not null,
  fk_cod_tp_p varchar(10) not null,
  sigla_programa char(7) not null,
  desc_programa char(50) not null,
  estado_programa tinyint(1) not null,
  primary key(cod_programa)
);
-- 8
create table tipo_programa (
  cod_tp varchar(10) not null primary key,
  descripcion_tp varchar(15) not null,
  estado_tp tinyint(1) not null
);
-- 9
create table jornada (
  cod_jornada varchar(15) not null primary key,
  estado_programa tinyint(1) not null
);
-- 10
create table causa(
  cod_causa varchar(13) not null primary key,                                                                                                                                                                                                                   
  desc_causa char(45) not null,
  estado_causa tinyint(1) not null
);
-- 11
create table novedad 
(
cod_novedad  varchar(13) not null,
fk_id_persona_n varchar(13) not null,
fk_cod_tp_n varchar(5) not null,
fk_cod_sede_n varchar(10) not null,
fk_cod_causa_n varchar(13) not null,
cod_tipo_novedad varchar(15) not null,
fecha_novedad date not null,
formato_retiro varchar(50) not null,
estado_sofia_plus varchar(50) not null,
fk_aprendiz_ficha_id_persona_a varchar(13) not null,
fk_aprendiz_ficha_cod_td_a varchar(5) not null,
fk_aprendiz_ficha_ficha_cod_ficha_a varchar(13) not null,
estado_novedad tinyint(1) not null,
primary key (cod_novedad)
);
-- 12
create table sede
(
cod_sede varchar (10) not null,
desc_sede char (25) not null,
direccion_sede varchar (35) not null,
estado_sede tinyint(1) not null,
primary key(cod_sede) 
);
-- 13 
create table aprendiz 
(
pkfk_id_persona_a varchar (13) not null,
pkfk_cod_td_a varchar (5) not null,
fk_nit_empresa_a varchar (15) not null,
cel_tel_a varchar (15) not null,
direccion_a char (80) not null,
email_a char (80) not null,
estado_aprendiz tinyint(1) not null,
primary key(pkfk_id_persona_a,pkfk_cod_td_a)
);
-- 14 
create table instructor_ficha
(
pkfk_id_persona_if varchar(13) not null,
pkfk_cod_td_if varchar(5) not null,
pkfk_cod_ficha_if varchar (13) not null,
estado_if tinyint(1) not null,
primary key (pkfk_id_persona_if,pkfk_cod_td_if,pkfk_cod_ficha_if)
);  
-- 15 
create table aprendiz_ficha
(
pkfk_id_persona_af varchar (13) not null,
pkfk_cod_td_af varchar (5) not null,
pkfk_cod_ficha_af varchar (13) not null,
estado_af tinyint(1) not null,  
primary key (pkfk_id_persona_af,pkfk_cod_td_af,pkfk_cod_ficha_af)
);
-- 16
create table tipo_novedad
(
cod_tn varchar(15) not null primary key,
descripcion_tn varchar(40) not null,
estado_tn tinyint(1) not null
);
-- 17
create table usuario 
(
pkfk_id_usuario varchar(13) not null,
pkfk_cod_td_u varchar(5) not null,
fk_cod_ps_u varchar(5) not null,
respuesta_ps_u varchar(50) not null,
contrasena_u varchar(20) not null,
estado_u tinyint(1) not null,
primary key(pkfk_id_usuario,pkfk_cod_td_u)
);
-- 18
create table pregunta_seguridad
(
cod_ps varchar(5) not null primary key,
desc_ps varchar(55) not null,
estado_ps tinyint(1) not null
);
-- Fin de cración de tablas
-- Formulas para la creación de llaves foraneas

-- 1 
alter table persona add constraint pkfk_cod_td_p
  foreign key (pkfk_cod_td_p) references tipo_documento (cod_td);

-- adicional
alter table usuario add constraint pkfk_id_usuario_pkfk_cod_td_u
  foreign key (pkfk_id_usuario ,pkfk_cod_td_u) references persona  (id_persona,pkfk_cod_td_p);

-- 2 
alter table instructor add constraint pkfk_id_persona_i_pkfk_cod_td_i
  foreign key (pkfk_id_persona_i,pkfk_cod_td_i) references usuario (pkfk_id_usuario ,pkfk_cod_td_u);

-- 3 
alter table encargado add constraint pkfk_id_persona_e_pkfk_cod_td_e
  foreign key (pkfk_id_persona_e,pkfk_cod_td_e) references usuario (pkfk_id_usuario ,pkfk_cod_td_u);

-- 4
  alter table aprendiz add constraint pkfk_id_persona_a_pkfk_cod_td_a
  foreign key (pkfk_id_persona_a,pkfk_cod_td_a) references persona (id_persona,pkfk_cod_td_p);

-- 5 
alter table programa add constraint fk_cod_tp_p
  foreign key (fk_cod_tp_p) references tipo_programa (cod_tp);

-- 6  
alter table novedad  add constraint fk_id_persona_n_fk_cod_tp_n
  foreign key (fk_id_persona_n,fk_cod_tp_n) references encargado (pkfk_id_persona_e,pkfk_cod_td_e);

-- 7  
alter table novedad  add constraint fk_cod_sede_n
  foreign key (fk_cod_sede_n) references sede (cod_sede);

-- 8 
alter table novedad  add constraint fk_cod_causa_n
   foreign key (fk_cod_causa_n) references causa (cod_causa);

-- 9
alter table aprendiz_ficha add constraint pkfk_id_persona_af
   foreign key (pkfk_id_persona_af,pkfk_cod_td_af) references aprendiz (pkfk_id_persona_a,pkfk_cod_td_a);

-- 10
alter table  novedad add constraint fk_aprendiz_ficha_id_persona_a
   foreign key (fk_aprendiz_ficha_id_persona_a,fk_aprendiz_ficha_cod_td_a,fk_aprendiz_ficha_ficha_cod_ficha_a) references aprendiz_ficha (pkfk_id_persona_af,pkfk_cod_td_af,pkfk_cod_ficha_af);

   -- 17
alter table novedad add constraint cod_tipo_novedad 
   foreign key (cod_tipo_novedad) references tipo_novedad (cod_tn);

-- 11 
alter table aprendiz  add constraint fk_nit_empresa_a 
   foreign key (fk_nit_empresa_a) references empresa (nit_empresa);

-- 12 
alter table instructor_ficha  add constraint pkfk_id_persona_if_pkfk_cod_td_if 
   foreign key (pkfk_id_persona_if,pkfk_cod_td_if) references instructor (pkfk_id_persona_i,pkfk_cod_td_i);

-- 13 
alter table instructor_ficha  add constraint pkfk_cod_ficha_if
   foreign key (pkfk_cod_ficha_if) references ficha (cod_ficha);

-- 14
alter table aprendiz_ficha add constraint pkfk_cod_ficha_af
   foreign key (pkfk_cod_ficha_af) references ficha (cod_ficha);

-- 15 
alter table ficha add constraint fk_cod_jornada_f
   foreign key (fk_cod_jornada_f) references jornada (cod_jornada);

-- 16 
alter table ficha add constraint fk_cod_programa_f 
   foreign key (fk_cod_programa_f ) references programa (cod_programa);

-- ADICIONAL
alter table usuario add constraint cod_ps_u 
   foreign key (fk_cod_ps_u) references pregunta_seguridad (cod_ps);
-- Fin de las formulas para crear llaves foraneas
-- Inicio de DML
-- 1
insert into tipo_documento (cod_td ,desc_td ,estado_td) values
("CC","CEDULA DE CUIDADANIA" ,1 );
insert into tipo_documento (cod_td ,desc_td ,estado_td) values
("CE" ,"TARJETA DE IDENTIDAD" ,1 );
insert into tipo_documento (cod_td ,desc_td ,estado_td) values
("TI" ,"CEDULA DE EXTRANJERIA" ,1 );

-- 2
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "860002964-4","BANCO DE BOGOTA" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "860036532-2","LADRILLERA PRISMA SAS" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "830090035-2","ZUE SAS" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "800181749-4","SUBOCOL SA" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "810002605-3","ARIADNA SAS" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "830045567-9","DESIGNER SOFTWARE LIMITADA" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "156488523-7","A3SEC S.A.S" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "830515291-9","SUMMIT SYSTEMS S A S" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "830075303-1","ARIA PSW S.A.S" ,1 );
insert into  empresa(nit_empresa ,nombre_empresa ,estado_e) values
( "669542315-1","SERVISOFT S A" ,1 );/*10*/

-- 3
insert into tipo_programa (cod_tp ,descripcion_tp ,estado_tp) values
("001" ,"TECNICO" ,1 ),

("002" ,"TECNOLOGO" ,1 ),

("003" ,"ESPECIALIZACION" ,1 );/*3*/

-- 4
insert into jornada (cod_jornada ,estado_programa) values
( "DIURNA",1 ),

( "NOCTURNA",1 ),

( "FIN DE SEMANA",1 ),

( "MIXTA",1 );/*4*/

-- 5
insert into causa (cod_causa ,desc_causa ,estado_causa) values
("101" ,"Dedicacion a otros estudios o actividades" ,1),

("102" ,"Problemas de salud" ,1),

("103" ,"Maternidad" ,1),

("104" ,"Problemas familiares o personales" ,1),

("105" ,"Problemas laborales" ,1),

("106" ,"Problemas economicos" ,1),

("107" ,"Problemas de domicilio" ,1),

("108" ,"Otra" ,1);

-- 6
insert into sede (cod_sede ,desc_sede ,direccion_sede ,estado_sede) values
("01" ,"COMPLEJO SUR" ,"Av. 1 de Mayo #33-98" ,1 );
insert into sede (cod_sede ,desc_sede ,direccion_sede ,estado_sede) values
("02" ,"COLOMBIA" ,"Calle 69 No 20-30-36 " ,1 );
insert into sede (cod_sede ,desc_sede ,direccion_sede ,estado_sede) values
("03" ,"ALAMOS" ,"Carrera 89a # 64c-33 " ,1 );
  insert into sede (cod_sede ,desc_sede ,direccion_sede ,estado_sede) values
("04" ,"RICAURTE" ,"Calle 12 #30-18" ,1 );
insert into sede (cod_sede ,desc_sede ,direccion_sede ,estado_sede) values
("05" ,"RESTREPO" ,"Av. 1 de Mayo No. 12d-68 " ,1 );

-- 7
insert into tipo_novedad (cod_tn ,descripcion_tn ,estado_tn ) values
( "TN1","RETIRO VOLUNTARIO" ,1),

( "TN2","DESERCION" ,0),

( "TN3","APLAZAMIENTO" ,0),

( "TN4","TRASLADO" ,0);

-- 8
 -- APRENDICES--
 insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1013576818", "CC","ANA" ,"JUDITH" ,"BAYONA" ,"RODRIGUEZ" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003944373", "CE","ANDRES" ,"FELIPE" ,"PIRE" ,"CASTELBLANCO" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1145619760", "TI","BRANDON " ,"STIVEN" ,"MORA" ,"FURQUE" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003456330", "CC","BRANDON" ,"STWARD" ,"GOMEZ" ,"ANDRADE" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1001218567", "CE","CAMILO" ,"ANDRES" ,"MARIN" ,"LINARES" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1345678047", "TI","DANIEL" ,"SANTIAGO" ,"GOMEZ" ,"BONILLA" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1001435633", "CC","DANIELA" ,"ALEJANDRA" ,"RODRIGUEZ" ,"BETANCOURT" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1045326261", "CE","JEFFERSON" ,"STEWART" ,"BUITRAGO" ,"CUMBE" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1056423466", "TI","JEREMY" ,"JOSUE" ,"BORDA" ,"FIGUEROA" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1000861913", "CC","JOHAN" ,"DAVID" ,"FORERO" ,"PARDO" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1015479947", "CE","JOHAN" ,"SEBASTIAN" ,"GOMEZ" ,"GOMEZ" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1034519161", "TI","JUAN" ,"DIEGO" ,"CHARRY" ,"LAGUNA" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1014375430", "CC","JUAN" ,"ESTEBAN" ,"CARDENAS" ,"TORRES" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1455672239", "CE","JULIAN" ,"LEONARDO" ,"HIGUERA" ,"SIERRA" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003245930", "TI","KAREN" ,"TATIANA" ,"ROMERO" ,"PALACIOS" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1056754880", "CC","KEVIN" ,"ESTEBAN" ,"RODRIGUEZ" ,"LEON" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1000345845", "CC","LINA" ,"ALEJANDRA" ,"PEREZ" ,"ESPINOSA" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1020830270", "CC","MARILYN" ,"TATIANA" ,"MATIZ " ," MUÑOZ" , 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1074276638", "CC","MARIO" ,"NICOLAS " ,"RODRIGUEZ" ,"BERTIERI", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1010155810", "TI","MIGUEL" ,"ANGEL" ,"GONZALEZ " ,"TORRES", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1200774385", "CC","SOFIA" ,"ALEJANDRA" ,"NOGUERA" ," ALDANA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1245502523", "CE","TOM" ,"HANS" ,"GRANADOS" ,"CISEROS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1022647361", "CC","VALENTINA",null,"SALGADO","CARDONA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1926595766", "TI","WEISSMAN",null,"CACAIS","CHICO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1045677657", "CE","YAROD ","ESLEY","PEREZ","BOLAÑOS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1026556974", "TI","CAMILO","JOSE","BELTRAN","CASTELLANOS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1054677621", "CE","CHRISTIAN","DANIEL","OROZCO","MARTINEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1026456339", "CC","CHRISTIAN","ANDRES","AYALA","MESTRA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1066818183", "TI","FRANK",null,"RAMIREZ","ROMERO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1015342740", "CE","JULIAN",null,"PARADA ","RODRIGUEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1022432114", "CC","JULIAN ","CAMILO","VEGA","ESTEBAN", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1015433173", "CC","KAREN ","JINETH","MENDEZ","ZARATE", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1019094394", "CC","PAOLA ",null,"VARGAS","GONZALEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values

( "1004550362", "CC","LISBETH",null,"GONZALEZ","ESPITIA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1210689285", "CC","EDWAR","FERNEY","ORTIZ","MELO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1000320913", "CC","JOE","ALEJANDRO","SIERRA","OCASSAL", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1006228542", "TI","KELLY","JOHANA","CAPERA","MORA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1035211653", "CC","HELMER","NORBERTO","TIQUE","CUMACO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "33202742", "CC","JUAN","MIGUEL","CARRILLO","NOREÑA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "89052586", "TI","BRAYAN","DANIEL","REYES","DIAZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1014442305", "CC","JESUS","ALMEIRO","PEREZ","URBANO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1013347538", "CC","JHOAN","ALEXANDER","RODRIGUEZ ","SANCHEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1012211232", "CC","CESAR","AUGUSTO","ARIZA","DUARTE", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1013602380", "TI","MAGALY","ALEXA","GOMEZ ","SALAZAR", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1018512323", "TI","NICOLAS","DAVID","VILLAVECES","LARA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1014282057", "CC","DAVID","NICOLAS","VARGAS","AGUILAR", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1012231262", "CE","MORIS","SANTIAGO","GONZALEZ","RICO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1020234761", "CC","DANIEL","CAMILO","CADAVID","NEUTA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1022316365", "CC","DANIELA",null,"FLOREZ","SUAREZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1022423129", "CC","MICHAEL","ANDRES","BELTRAN","NIÑO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1023312826", "CE","LUVER","ESTEBAN","SANCHEZ","GALINDO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1023958213", "CC","LUIS ","EDGAR","VELASQUEZ ","SIGUA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1024524630", "CC","JOSE ","ALBEIRO","FRANCO  ","GRANADOS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values

( "1011125995", "TI","YENY","PAOLA","ALVAREZ","ROMERO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1234596764", "CC","JESSICA ","NATALIA","BECERRA","BECERRA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "43100257", "CC","CRUZ","CECILIA","BRODRIGUEZ","CCARREÑOORDOBA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1233683439", "CC","MICHAEL","STEVEN","CACERES","PORRAS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1036795650", "CC","OMAR","ANDRES","CAMCHO","PLAZAS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1102725899", "CC","LICETH","FERNANDA","CARDENAS","VELASQUEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "90199424", "CC","JORGE","HERNAN","CASTAÑEDA",null, 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "2098894", "CC","CARLOS","JULIO","CUADROS","PEREZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003426258", "TI","ALISSON","VALENTINA","DIAZ DEL CASTILLO","RESTREPO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1006569835", "TI","MICHELLE","KATERINE","FRANCO","RODRIGUEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1004564152", "TI","DAIRON","SANTIAGO","GACHARNA","CORTINEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1001454696", "TI","JHONNY","ALEXANDER","GARCIA","BELTRAN", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1233099384", "CC","NINEDLY","SIGLINDY","HUEPA","DUCUARA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1005200943", "TI","LUIS","JAVIER","LEON","RUIZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1234560935", "CC","DIEGO","SEBASTIAN","LOZANO","HERNANDEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1127949002", "CC","JONATHAN","LEONIDAS","MORENO","TROCHEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1234729594", "TI","SARAHY ","DUBILLYN","OCAMPO","SALCEDO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "98726374", "CC","HENRY","ANDRES","ORTEGA","CETINA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1023650538", "CC","DAVID","SANTIAGO","PALACIOS","MORALES", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "97112900656", "TI","ROICE ","ALEXANDER","QUINTERO","RONDON", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values

( "1005432289", "TI","JEIMI","KATHERINE","ALVAREZ","RIAÑO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1005344402", "TI","LUZ","ESPERANZA","BARBOSA","BARBOSA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1034574441", "CC","ADRIANA ","LUCIA","BAUTISTA","FORERO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1043427760", "CC","SERGIO","ANDRES","BUITRAGO","GARCIA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1024533595", "CC","JUAN","MANUEL","CARRION","ALFONSO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1193323992", "CC","HAROL","STEVEN","CHISCO","DUEÑAS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1004465587", "TI","JOAN","SEBASTIAN","CORREDOR","HERRERA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003432902", "TI","JHON","ANDERSON","CRUZ","GOMEZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1023441884", "CC","DIEGO","ARMANDO","GALVIS","CELIS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1003242973", "TI","DIEGO","NICOLAS","GARZON","SANABRIA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1032473206", "CC","ANA","KATHERINE","HERNANDEZ","SINISTERRA", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "1342423162", "TI","KEVIN ","ALEXANDER","LEON","MONTAÑO", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "77323740", "CC","ARNOLD ","MAURICIO","MUÑOZ","CORREDOR", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "10343258819", "TI","BRAYAN ","ARNULFO","MURILLO","CRUZ", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
( "10034290172", "TI","SEBASTIAN ",null,"PARRA","BUSTOS", 1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values

("75079807","CC","EDWAR", "FELIPE", "LOPEZ", "RODRIGUEZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("28111912","TI","GABRIELA", "LOPEZ", "HERREÑO",NULL,1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("90248129869","TI","ANYI", "LIZETH", "MURICA", "AGUILAR",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("384651493","CC","ASENOHER", "MARTINEZ", "SANCHEZ",NULL,1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("1299848900","TI","JOHN", "SEBASTIAN", "MONTAÑA", "RODRIGUEZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("197857063","TI","ERICK", "SANTIAGO", "MURICA", "MESA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("35284177","CC","ALEJANDRO",NULL, "RODRIGUEZ", "RODRIGUEZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("6354536","CC","ANDY", "DANIEL", "FRANCO", "RUA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("34950236","TI","MARIA", "ALEJANDRA", "QUINTERO", "TORRES",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("9786290113","TI","CRISTIAN", "DAVID", "SABOGAL", "HERNANDEZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("64005726","TI","JAVIER", "ANDRES", "GAMEZ", "YARA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("830593514","TI","LUIS", "ALEJANDRO", "VENEGAS", "VERGEL",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("625308770","TI","OSCAR", "FABIAN", "WILCHES", "DURAN",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("8830079095","TI","JAMILTON", "ESTID", "PRECIADO", "MOSQUERA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("951281034","CC","MAIKOL", "FERNEY", "GOMEZ", "FARFAN",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("6846210","TI","BLANCA", "ROSA", "RUIZ", "ARIAS",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("205055514","TI","BRAYAN", "STEVEN", "PABON", "CARDENAS",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("201812315","CC","JUAN", "PABLO", "MONTOYA", "RIAÑO",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("689194026","TI","CRISTIAN", "DANIEL", "VILLALBA", "MORA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("763902763","CC","JUAN", "MANUEL", "PULIDO", "ROZO",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("85132176","TI","VALENTINA", "VARGAS", "VILLAMIL",NULL,1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("1850819462","TI","JUAN", "OROMANSIS", "GOMEZ", "FlOREZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("305957019","TI","LAURA", "DANIELA", "PEREZ", "NOVOA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("725927028","TI","YOHAN", "SEBASTIAN", "HERNANDEZ", "ESCORCIA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("35811448013","TI","BRANDOM", "ESTEBAN", "GUTIERREZ", "TRUJILLO",1);

-- INSTRUCTORES --
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("57934890","CC","JAVIER", "LEONARDO", "PINEDA", "URIBE",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("78497389","CC","RAUL", "ERNESTO", "ORTIZ", "GARZON",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("53456473","CC","DANIEL", NULL, "MORA", "DIAZ",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("89748234","CC","CLAUDIA", "JANETH", "YAYA", "HOYOS",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("93867423","CC","YENNY", "CAROLINA", "ROJAS", "TURGA",1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("52841534","CC","EDUER", "PABON", "MORALES", NULL,1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("64324235","CC","JUSTO", "RUFINO", "MENA", "ROVIRA",1);

-- COORDINACION --
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("10006661","CC","DIANA", "CAROLINA", "PINZON", NULL,1);
insert into persona (id_persona ,pkfk_cod_td_p ,p_nombre_p ,s_nombre_p ,p_apellido_p ,s_apellido_p ,estado_p) values
("19875364","CC","JANETH", "CECILIA", "RODRIGUEZ", "CARREÑO",1);

-- 17

insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values 
("PS" ,"¿COMO SE LLAMO TU PRIMERA MASCOTA?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS2" ,"¿CUAL ES TU ANIMAL FAVORITO?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS3" ,"¿COMO SE LLAMA TU PRIMER AMOR?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS4" ,"¿CUAL ES TU COMIDA FAVORITA?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS5" ,"¿CUAL ES TU PAIS FAVORITO?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS6" ,"¿CUAL ES EL PRIMER NOMBRE DE SU MAMA?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS7" ,"¿EN QUE CIUDAD NACIO TU PAPA?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS8" ,"¿CUAL ES EL PRIMER NOMBRE DE SU ABUELA MATERNA?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS9" ,"¿EN QUE COLEGIO SE GRADUO?" ,1 );
insert into pregunta_seguridad(cod_ps ,desc_ps ,estado_ps ) values
("PS10" ,"¿NOMBRE DE LA PRIMERA EMPRESA EN LA QUE TRABAJO?" ,1 );
-- 18
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("57934890", "CC", "PS", "LULU","JAVIER4890" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("78497389", "CC", "PS2", "SURICATO","RAUL7389" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("53456473", "CC", "PS3", "RAULITA","DANIEL6473" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("89748234", "CC", "PS4", "PATATAS","CLAUDIA8234" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("93867423", "CC", "PS5", "MONGOLIA","YENNY7423" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("52841534", "CC", "PS6", "MAGDALENA","EDUER6678" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("64324235", "CC", "PS7", "CARACAS","JUSTO4235" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("10006661", "CC", "PS8", "SUSANA","DIANA6661" , 1);
insert into usuario (pkfk_id_usuario ,pkfk_cod_td_u ,fk_cod_ps_u ,respuesta_ps_u ,contrasena_u ,estado_u) values
("19875364", "CC", "PS9", "BOSA PORVENIR","JANETH5364" , 1);
-- 9
insert into instructor (pkfk_id_persona_i ,pkfk_cod_td_i ,estado_i) values
("57934890","CC",1),

("78497389","CC",1),

("53456473","CC",1),

("89748234","CC",1),

("93867423","CC",1),

("52841534","CC",1),

("64324235","CC",1);/*7*/
-- 10
insert into encargado (pkfk_id_persona_e ,pkfk_cod_td_e ,cargo_e ,estado_e) values
("10006661" ,"CC" , "APOYO DE BIENESTAR", 1 ),

("19875364" ,"CC" , "COORDINACION", 1 );/*2*/

-- 11
insert into programa (cod_programa ,fk_cod_tp_p ,sigla_programa ,desc_programa ,estado_programa) values
("10" ,"001" ,"TPM" ,"PRODUCCION MULTIMEDIA" , 1),

("11" ,"002" ,"ADSI" ,"ANALISIS Y DESARROLLO EN SISTEMAS DE INFORMACION" , 1),

("12" ,"001" ,"TPS" ,"PRODUCCION DE SISTEMAS" ,1 );/*3*/

-- 12
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1803182 G2" ,"DIURNA" ,"11", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1803177" ,"DIURNA" ,"10", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1803172" ,"DIURNA" ,"10", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1906643" ,"NOCTURNA" ,"11", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1906648" ,"NOCTURNA" ,"11", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1906678" ,"MIXTA" ,"12", 1 );
insert into ficha (cod_ficha ,fk_cod_jornada_f ,fk_cod_programa_f ,estado_ficha) values
("1827651" ,"MIXTA" ,"12", 1 );/*7*/

-- 14
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1013576818","CC","860002964-4","3151304048","777-8158 Sem St.
","ajbayona8@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003944373", "CE","860036532-2","3103337305","P.O. Box 590, 5056 Mattis Rd.
","afpire@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003456330", "CC","800181749-4","3188546337","Ap #196-1373 Auctor, Ave
","bsmora0@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1001218567", "CE","810002605-3","3116292113","898-6145 Eu Street
","bsgomez03@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1345678047", "TI","830045567-9","3187636920","Ap #814-7702 Tristique St.
","camarin8858@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1001435633", "CC","156488523-7","3126881295","6902 Duis Av.
","dsgomez740@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1045326261", "CE","830515291-9","3175136753","9826 Metus St.
","darodriguez330@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1056423466", "TI","830075303-1","3128183130","Ap #130-2636 Eu, St.
","jjborda66@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1000861913", "CC","669542315-1","3113756446","Ap #736-2508 Dictum Rd.
","jdforero31@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1015479947", "CE","860002964-4","3101941000","Ap #235-4495 Suspendisse Street
","jsgomez642@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1034519161", "TI","860036532-2","3169313713","5972 Elit, Av.
","jcharry16@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1014375430", "CC","830090035-2","3149328963","1569 Nulla Rd.
","jecardenas063@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1455672239", "CE","800181749-4","3176409135","322-2638 Donec Rd.
","jlhiguera9@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003245930", "TI","810002605-3","3127657171","9481 Id Rd.
","ktromero03@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1056754880", "CC","830045567-9","3156065635","Ap #102-518 Donec Road
","kerodriguez088@misena.edu.co",1);

/*ficha 1*/
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1000345845", "CC","669542315-1","3103684118","P.O. Box 245, 7464 Amet Road
",  "laperez5485@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1020830270", "CC","860002964-4","3191945877","Ap #344-387 Ac, Rd.
",      "mtmatiz@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1074276638", "CC","860036532-2","3159723223","974-1405 Ipsum Rd.
", "mngonzalez85@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1010155810", "TI","830090035-2","3185807351","6353 Enim Av.
","magonzalez018@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1200774385", "CC","800181749-4","3124621418","Ap #216-7510 Sed Street
",   "sanoguera5@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1245502523", "CE","810002605-3","3191523504","598-8565 Cras Rd.
",   "thgranados@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1022647361", "CC","830045567-9","3135914502","9515 Cras Road
",     "vsalgado@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1926595766", "TI","156488523-7","3155644405","Ap #890-2643 Id, Rd.
",     "wcacais3@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1045677657", "CE","830515291-9","3117554519","8107 A Rd.
","yperezbolanos@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1026556974", "TI","830075303-1","3154087276","3924 Montes, Rd.
",  "cjbeltran47@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1054677621", "CE","669542315-1","3133356021","Ap #960-7321 Scelerisque Road
",  "cdorozco126@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1026456339", "CC","860002964-4","3113060252","668-9815 Tristique Rd.
",     "cayala93@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1066818183", "TI","860036532-2","3151661380","345-3254 Metus. Avenue
", "fjramirez381@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1015342740", "CE","830090035-2","3151264721","Ap #801-7231 Non, Avenue
",    "jparada04@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1022432114", "CC","800181749-4","3116581202","142-7370 Vulputate, St.
",    "jcvega411@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1015433173", "CC","810002605-3","3131367568","106-739 Iaculis Road
",   "kjmendez37@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1019094394","CC","830045567-9" ,"3142750511", "Ap #25-698 Consectetuer Street", " pvargas49@misena.edu.co",1);


/*ficha 2*/
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1004550362", "CC","860002964-4","3122051191","8388 Nec, Avenue
",       "gonzalezespitia13@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1210689285", "CC","860036532-2","3195926867","Ap #447-5583 Nibh. St.
",          "benllamin72318@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1000320913", "CC","830090035-2","3118516031","162-3179 Eget Ave
",              "david.gsr5@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1006228542", "TI","800181749-4","3174410967","4142 Luctus, Av.
",         "yohanacape-12@hotmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1035211653", "CC","810002605-3","3192112803","P.O. Box 203, 3830 Nec Rd.
",              "helmer12tc@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("33202742", "CC"  ,"830045567-9","3124925094","Ap #470-1207 Cursus Ave
","juanmiguelcarrillo2011@hotmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("89052586", "TI"  ,"156488523-7","3147402563","P.O. Box 630, 5766 Class Street
",         "adrianasosuarez@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1014442305", "CC","830515291-9","3106807443","5339 Dolor Ave
",                "japu2305@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1013347538", "CC","830075303-1","3102459326","Ap #155-5449 Pellentesque Avenue
",               "jametalrs@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1012211232", "CC","669542315-1","3177072674","Ap #896-3359 Enim Rd.
",           "cesar.ariza34@yahoo.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1013602380", "TI","860002964-4","3145677262","P.O. Box 687, 4990 Lacinia Rd.
",         "magalygomez1108@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1018512323", "TI","860036532-2","3134054864","P.O. Box 756, 3360 Lobortis Rd.
",       "ndvillaveces9@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1014282057", "CC","830090035-2","3194204038","P.O. Box 824, 7172 Fusce St.
",        "davidnvargas1250@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1012231262", "CE","800181749-4","3174815046","P.O. Box 254, 1733 Neque St.
",           "santiagog.sst@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1020234761", "CC","810002605-3","3198323979","Ap #647-6536 Vitae Rd.
",              "dacane1998@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1022316365", "CC","830045567-9","3168624429","2758 Leo. Ave
",          "dflorez56@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1022423129", "CC","830090035-2","3121936552","739-6347 Dis Avenue
",           "spidercol13@hotmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1023312826", "CE","800181749-4","3129728728","P.O. Box 373, 5821 Auctor Av.
",      "luversanchez1992@hotmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1023958213", "CC","810002605-3","3151001199","3235 Vehicula Road
",       "luisvelasquez9261@gmail.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1024524630", "CC","830045567-9","3113494173","489-7867 Eleifend, Av.
",         "jose.arleck91@hotmail.com",1);

/*ficha 3*/
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1011125995", "TI","860002964-4","3164761131","P.O. Box 135, 450 Faucibus Av.
",   "ypalvarez59@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1234596764", "CC","860036532-2","3193774307","P.O. Box 925, 8703 Egestas Road
",    "jnbecerra2@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("43100257", "CC",  "830090035-2","3166552157","Ap #405-4708 Facilisis Rd.
",    "ccblandon7@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1233683439", "CC","800181749-4","3144971228","P.O. Box 161, 3035 Diam Avenue
",   "mscaceres93@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1036795650", "CC","810002605-3","3175952704","P.O. Box 501, 8650 Suspendisse Rd.
",   "oacamacho05@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1102725899", "CC","830045567-9","3147223457","816-1758 Eget, St.
",  "lfcardenas99@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("90199424", "CC",  "156488523-7","3193160319","7904 Felis. Av.
", "jhcastaneda42@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("2098894", "CC",   "830515291-9","3127350589","P.O. Box 551, 2148 Praesent St.
",    "cjcuadros4@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003426258", "TI","830075303-1","3137631606","786-107 Nulla St.
",       "avdiazd@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1006569835", "TI","669542315-1","3133142480","P.O. Box 255, 7028 Nisl. Street
",    "mkfranco53@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1004564152", "TI","860002964-4","3137657383","369-2462 Nibh. St.
",   "dsgacharna2@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1001454696", "TI","860036532-2","3142435876","P.O. Box 899, 8655 Id, St.
",   "jagarcia696@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1233099384", "CC","830090035-2","3108997435","Ap #841-8315 Sodales Rd.
",       "nshuepa@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1005200943", "TI","800181749-4","3117198069","P.O. Box 264, 4468 Donec St.
",      "ljleon34@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1234560935", "CC","810002605-3","3108583986","883-8855 Vulputate Street
",    "dslozano53@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1127949002", "CC","830045567-9","3106478924","Ap #991-9521 Donec Avenue
",    "jlmoreno24@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1234729594", "TI","860002964-4","3127158342","1292 Proin Rd.
",     "sdocampo4@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("98726374", "CC"  ,"860036532-2","3159749789","P.O. Box 762, 8500 Aliquet. Rd.
",    "haortega47@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1023650538", "CC","830090035-2","3195796942","309-730 Ligula Avenue
",   "dspalacios8@misena.edu.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("97112900656","TI","800181749-4","3167636172","Ap #607-7472 Nec Avenue
", "raquintero366@misena.edu.co",1);

/*ficha 4*/
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1005432289", "TI","830515291-9","3181242509","P.O. Box 211, 2874 Lacus Avenue","Aenean@faucibusorciluctus.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1005344402", "TI","830075303-1","3108220157","P.O. Box 656, 1512 Nascetur Ave
",                    "vestibulum.neque@dui.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1034574441", "CC","669542315-1","3107540189","1630 Eu, Rd.
",                      "Donec.felis@velitSed.edu",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1043427760", "CC","860002964-4","3139865973","680-6856 Velit Road
",                "elit.erat@Nullamsuscipitest.ca",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1024533595", "CC","860036532-2","3165282341","4551 Erat Rd.
",                                    "ac@Sed.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1193323992", "CC","830090035-2","3178061532","848 Erat St.
","Duis.dignissim.tempor@magnaPraesentinterdum.ca",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1004465587", "TI","800181749-4","3184448780","8027 Mollis Av.
",                 "vestibulum@cursusdiamat.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003432902", "TI","810002605-3","3184917932","Ap #218-182 Et Avenue
",            "Aliquam.fringilla.cursus@varius.ca",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1023441884", "CC","830045567-9","3199369371","6651 Ipsum Street
",   "tincidunt.neque.vitae@urnaUttincidunt.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1003242973", "TI","860002964-4","3132871842","Ap #741-9913 Porttitor St.
",          "bibendum.ullamcorper.Duis@semper.net",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1032473206", "CC","860036532-2","3117703431","Ap #402-1893 Amet St.
",              "Lorem.ipsum.dolor@quispede.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1342423162", "TI","830090035-2","3105644369","3362 Eu St.
",            "amet.faucibus.ut@mipedenonummy.edu",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("77323740", "CC",  "800181749-4","3112400032","716-8531 Orci. Street
",                               "luctus@elit.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("10343258819","TI","810002605-3","3187033997","411-5624 Penatibus Rd.
",                 "eget.lacus.Mauris@ipsum.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("10034290172","TI","830045567-9","3148212348","734-9175 Scelerisque St.
",                                 "ut@feugiat.ca",1);

/*ficha 5*/
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("75079807","CC","669542315-1","3122407765","P.O. Box 962 252 Facilisis ", "ukullamcorper@euismod.jh",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("28111912","TI",   "860002964-4","3196950941","P.O. Box 347, 9344 Et St.", "bnamet@eueuismodac.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("90248129869","TI", "860036532-2","3176337581","770-8354 Sit Av.", "vel@velitQuquevarius.edu",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("384651493","CC",  "830090035-2","3158308850","254-8162 Curabitur Road", "fringilla@maurisipsum.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1299848900","TI", "800181749-4","3102132984","284-1311 Proin Avenue", "sdfsdfss.non.dui@loborti",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("197857063","TI",  "810002605-3","3173596453","P.O. Box 685, 2559 Integer St.", "sdat.Nulla@viverra.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("35284177","CC",   "830045567-9","3139572748","P.O. Box 188, 2474 Urna. St.", "jmbned.dictum@accumsan.n",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("6354536","CC",    "860002964-4","3174297131","420-6782 Aenean Street", "sdgfrhbere@Donecvitaeera",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("34950236","TI",   "860036532-2","3179849850","P.O. Box 891, 3484 Habitant Rd.", "fsntum.dui@semperdui.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("9786290113","TI", "830090035-2","3122210445","Ap #839-9703 Cursus St.", "adfgghglectus@faucibus.o",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("64005726","TI",   "800181749-4","3192375717","1177 Nullam St.", "fsdisse@Crasdictum.co.uk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("830593514","TI",  "810002605-3","3166432264","181-4506 Non, St.", "sdfffrabitur@dolorFu.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("625308770","TI",  "830045567-9","3127496183","Ap #246-6569 Maecenas Avenue", "lla.Donec.non@velit.chjk",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("8830079095","TI", "156488523-7","3142134703","P.O. Box 418, 4878 Non Rd.", "hjum@imperdietdictum.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("951281034","CC",  "830515291-9","3115698662","487-5685 Leo. Rd.", "ghjgDonec@magnaatortor.c",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("6846210","TI",    "830075303-1","3198628441","P.O. Box 903, 9465 Euismod Street", "jhjtellus@justoeuarcu.ca",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("205055514","TI",  "669542315-1","3162856287","Ap #417-2892 Ac Avenue", "ldolor@rhoncusmvelit.edu",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("201812315","CC",  "860002964-4","3159271692","9000 Montes, St.", "ujjsit@ipsumSuspendis.co",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("689194026","TI",  "860036532-2","3157352711","Ap #551-8362 Libero Street", "liis@dignissimtempor.net",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("763902763","CC",  "830090035-2","3115357440","Ap #310-2254 Sodales. Av.", "iaculis.quis@feugiat.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("85132176","TI",   "800181749-4","3191888109","Ap #423-5375 Semper Avenue", "rtwmontes@urnaNullam.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1850819462","TI", "810002605-3","3139682741","P.O. Box 827, 5971 Ante Street", "ñhjbemper@Nuncsedorci.or",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("305957019","TI",  "830045567-9","3151191028","Ap #234-3850 Vehicula Ave", "sdi@erosNamconsequat.com",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("725927028","TI",  "810002605-3","3187287580","P.O. Box 473, 7793 Bibendum. Avenue", "sdffDonec.non@mollis.org",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("35811448013","TI","830045567-9","3186351125","P.O. Box 568, 5205 Ligula. St.", "nbmntEeger@Sedcongue.net",1);
insert into aprendiz (pkfk_id_persona_a ,pkfk_cod_td_a ,fk_nit_empresa_a ,cel_tel_a ,direccion_a ,email_a ,estado_aprendiz) values
("1145619760","TI","830045567-9","3186351125","P.O. Box 568, 5205 Ligula. St.", "nbmntEeger@Sedcongue.net",1);

-- 16
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1013576818", "CC","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003944373", "CE","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("1145619760", "TI","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003456330", "CC","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1001218567", "CE","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1345678047", "TI","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1001435633", "CC","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1045326261", "CE","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1056423466", "TI","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1000861913", "CC","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1015479947", "CE","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1034519161", "TI","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1014375430", "CC","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1455672239", "CE","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003245930", "TI","1803177",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1056754880", "CC","1803177",1);

insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1000345845", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1020830270", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1074276638", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1010155810", "TI","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1200774385", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1245502523", "CE","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1022647361", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1926595766", "TI","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1045677657", "CE","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1026556974", "TI","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1054677621", "CE","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1026456339", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1066818183", "TI","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1015342740", "CE","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1022432114", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1015433173", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1019094394", "CC","1803172",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1004550362", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1210689285", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1000320913", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1006228542", "TI","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1035211653", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "33202742", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "89052586", "TI","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1014442305", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1013347538", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1012211232", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1013602380", "TI","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1018512323", "TI","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1014282057", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1012231262", "CE","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1020234761", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1022316365", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1022423129", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1023312826", "CE","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1023958213", "CC","1906643",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1024524630", "CC","1906643",1);

insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1011125995", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1234596764", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "43100257", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1233683439", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1036795650", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1102725899", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "90199424", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "2098894", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003426258", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1006569835", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1004564152", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1001454696", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1233099384", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1005200943", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1234560935", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1127949002", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1234729594", "TI","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "98726374", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1023650538", "CC","1906648",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "97112900656", "TI","1906648",1);

insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1005432289", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1005344402", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1034574441", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1043427760", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1024533595", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1193323992", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1004465587", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003432902", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1023441884", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1003242973", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1032473206", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "1342423162", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "77323740", "CC","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "10343258819", "TI","1906678",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
( "10034290172", "TI","1906678",1);

insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("75079807","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("28111912","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("90248129869","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("384651493","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("1299848900","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("197857063","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("35284177","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("6354536","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("34950236","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("9786290113","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("64005726","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("830593514","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("625308770","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("8830079095","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("951281034","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("6846210","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("205055514","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("201812315","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("689194026","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("763902763","CC","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("85132176","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("1850819462","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("305957019","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("725927028","TI","1827651",1);
insert into aprendiz_ficha (pkfk_id_persona_af ,pkfk_cod_td_af ,pkfk_cod_ficha_af,estado_af) values
("35811448013","TI","1827651",1);

-- 15
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("57934890","CC","1803177",1);
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("78497389","CC","1803172",1);
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("53456473","CC","1906643",1);
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("89748234","CC","1906648",1);
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("52841534","CC","1906678",1);
insert into instructor_ficha (pkfk_id_persona_if ,pkfk_cod_td_if ,pkfk_cod_ficha_if ,estado_if) values
("64324235","CC","1827651",1);/*7*/

-- 13
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N1","19875364", "CC","01" ,"101" ,"TN1" ," 2019-06-12" ,"RETIRO_ANA.PNG" ,"ESTADOSOFIA_ANA.PNG" ,"1013576818" ,"CC" ,"1803177" ,1 );
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N2","10006661", "CC","02" ,"102" ,"TN1" ," 2019-07-12" ,"RETIRO_LINA.PNG" ,"ESTADOSOFIA_LINA.PNG" ,"1000345845", "CC","1803172" ,1 );
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N3","19875364", "CC","03" ,"104" ,"TN1" ," 2019-08-12" ,"RETIRO_LISBETH.PNG" ,"ESTADOSOFIA_LISBETH.PNG" ,"1004550362", "CC","1906643" ,1 );
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N4","10006661", "CC","04" ,"105" ,"TN1" ," 2019-09-12" ,"RETIRO_YENY.PNG" ,"ESTADOSOFIA_YENY.PNG" ,"1011125995", "TI","1906648" ,1 );
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N5","19875364", "CC","05" ,"106" ,"TN1" ," 2019-10-12" ,"RETIRO_JEIMI.PNG" ,"ESTADOSOFIA_JEIMI.PNG" ,"1005432289", "TI","1906678" ,1 );
insert into novedad (cod_novedad,fk_id_persona_n,fk_cod_tp_n ,fk_cod_sede_n ,fk_cod_causa_n ,cod_tipo_novedad ,fecha_novedad ,formato_retiro ,estado_sofia_plus ,fk_aprendiz_ficha_id_persona_a ,fk_aprendiz_ficha_cod_td_a ,fk_aprendiz_ficha_ficha_cod_ficha_a ,estado_novedad) values
("N6","10006661", "CC","01" ,"107" ,"TN1" ," 2019-11-12" ,"RETIRO_EDWAR.PNG" ,"ESTADOSOFIA_EDWAR.PNG" ,"75079807","CC","1827651" ,1 );/*6*/
-- Fin de DML
