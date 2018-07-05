/*
Created		04/07/2018
Modified		04/07/2018
Project		
Model			
Company		
Author		
Version		
Database		PostgreSQL 8.1 
*/


/* Create Tables */


Create table Ediles
(
	id_edil Integer NOT NULL,
	Nombre Varchar NOT NULL,
	id_localidad Integer NOT NULL,
	id_muninicipio Integer NOT NULL,
constraint pk_Ediles primary key (id_edil)
) Without Oids;


Create table Departamentos
(
	id_dpto Integer NOT NULL,
	Nombre Varchar NOT NULL,
constraint pk_Departamentos primary key (id_dpto)
) Without Oids;


Create table Municipios
(
	id_muninicipio Integer NOT NULL,
	id_dpto Integer NOT NULL,
	Nombre Varchar NOT NULL,
constraint pk_Municipios primary key (id_muninicipio)
) Without Oids;


Create table Localidades
(
	id_localidad Serial NOT NULL,
	Nombre Varchar NOT NULL,
	id_muninicipio Integer NOT NULL,
constraint pk_Localidades primary key (id_localidad,id_muninicipio)
) Without Oids;


Create table Proyectos
(
	id_proyecto Integer NOT NULL,
	Nombre Varchar NOT NULL,
	id_tipoproyecto Integer NOT NULL,
	fechainicio Date NOT NULL,
	fechafinal Date NOT NULL,
	presupuesto Double precision NOT NULL,
	ubicacion Varchar NOT NULL,
	id_localidad Integer NOT NULL,
	id_muninicipio Integer NOT NULL,
constraint pk_Proyectos primary key (id_proyecto)
) Without Oids;


Create table TiposProyecto
(
	id_tipoproyecto Serial NOT NULL,
	Descripcion Varchar NOT NULL,
constraint pk_TiposProyecto primary key (id_tipoproyecto)
) Without Oids;


Create table Contratistas
(
	id_contratista Integer NOT NULL,
	Nombre Varchar NOT NULL,
constraint pk_Contratistas primary key (id_contratista)
) Without Oids;


Create table proyectosxcontratistas
(
	id_proyecto Integer NOT NULL,
	id_contratista Integer NOT NULL,
constraint pk_proyectosxcontratistas primary key (id_proyecto,id_contratista)
) Without Oids;


Create table Interventores
(
	id_interventor Integer NOT NULL,
	Nombre Varchar NOT NULL,
constraint pk_Interventores primary key (id_interventor)
) Without Oids;


Create table proyectosxinterventor
(
	id_proyecto Integer NOT NULL,
	id_interventor Integer NOT NULL,
constraint pk_proyectosxinterventor primary key (id_proyecto,id_interventor)
) Without Oids;


Create table Funcionario
(
	id_funcionario Integer NOT NULL,
	Nombre Varchar NOT NULL,
constraint pk_Funcionario primary key (id_funcionario)
) Without Oids;


Create table funcionariosxproyecto
(
	id_proyecto Integer NOT NULL,
	id_funcionario Integer NOT NULL,
constraint pk_funcionariosxproyecto primary key (id_proyecto,id_funcionario)
) Without Oids;


Create table Actividades
(
	id_actividad Serial NOT NULL,
	id_localidad Integer NOT NULL,
	id_muninicipio Integer NOT NULL,
	descripion Varchar NOT NULL,
	fecha Date NOT NULL,
constraint pk_Actividades primary key (id_actividad)
) Without Oids;


Create table actividadesxedil
(
	id_edil Integer NOT NULL,
	id_actividad Integer NOT NULL,
	ubicacion Varchar NOT NULL,
constraint pk_actividadesxedil primary key (id_edil,id_actividad)
) Without Oids;


Create table bitacora
(
	id_bitacora Serial NOT NULL,
	fecha Date NOT NULL,
	descripcion Varchar,
	id_proyecto Integer NOT NULL,
constraint pk_bitacora primary key (id_bitacora)
) Without Oids;


Create table equipo
(
	id_integrante Integer NOT NULL,
	Nombre Varchar,
	id_edil Integer NOT NULL,
constraint pk_equipo primary key (id_integrante)
) Without Oids;


Create table agenda
(
	id_edil Integer NOT NULL,
	id_agenda Serial NOT NULL,
	fecha Date NOT NULL,
	asunto Varchar NOT NULL,
constraint pk_agenda primary key (id_agenda)
) Without Oids;


Create table ciudadanos
(
	id_ciudadano Integer NOT NULL,
	nombre Varchar NOT NULL,
	usuario Varchar NOT NULL,
	password Varchar NOT NULL,
constraint pk_ciudadanos primary key (id_ciudadano)
) Without Oids;


Create table acividadesxciudadanos
(
	id_ciudadano Integer NOT NULL,
	id_actividad Integer NOT NULL,
constraint pk_acividadesxciudadanos primary key (id_ciudadano,id_actividad)
) Without Oids;


Create table denuncias
(
	id_denuncia Serial NOT NULL,
	id_localidad Integer NOT NULL,
	id_muninicipio Integer NOT NULL,
	nombre Varchar NOT NULL,
	fecha Date,
	denuncia Text NOT NULL,
constraint pk_denuncias primary key (id_denuncia)
) Without Oids;


Create table evidencias
(
	id_evidencia Serial NOT NULL,
	archivo Varchar NOT NULL,
	id_denuncia Integer NOT NULL,
constraint pk_evidencias primary key (id_evidencia,id_denuncia)
) Without Oids;


Create table seguimiento
(
	id_seguimiento Serial NOT NULL,
	id_denuncia Integer NOT NULL,
	fecha Date NOT NULL,
	descripcion Text NOT NULL,
	id_funcionario Integer NOT NULL,
constraint pk_seguimiento primary key (id_seguimiento)
) Without Oids;


Create table blog
(
	id_blog Serial NOT NULL,
	contenido Text NOT NULL,
	activo Boolean NOT NULL,
	fecha Date NOT NULL,
constraint pk_blog primary key (id_blog)
) Without Oids;


Create table beneficios
(
	id_beneficio Serial NOT NULL,
	descripcion Varchar NOT NULL,
	valor Integer NOT NULL,
constraint pk_beneficios primary key (id_beneficio)
) Without Oids;


Create table beneficiosxciudadano
(
	id_ciudadano Integer NOT NULL,
	id_beneficio Integer NOT NULL,
constraint pk_beneficiosxciudadano primary key (id_ciudadano,id_beneficio)
) Without Oids;



/* Create Alternate Keys */



/* Create Foreign Keys */
Create index IX_Relationship16 on actividadesxedil (id_edil);
Alter table actividadesxedil add Constraint Relationship16 foreign key (id_edil) references Ediles (id_edil) on update restrict on delete restrict;
Create index IX_Relationship19 on equipo (id_edil);
Alter table equipo add Constraint Relationship19 foreign key (id_edil) references Ediles (id_edil) on update restrict on delete restrict;
Create index IX_Relationship20 on agenda (id_edil);
Alter table agenda add Constraint Relationship20 foreign key (id_edil) references Ediles (id_edil) on update restrict on delete restrict;
Create index IX_Relationship1 on Municipios (id_dpto);
Alter table Municipios add Constraint Relationship1 foreign key (id_dpto) references Departamentos (id_dpto) on update restrict on delete restrict;
Create index IX_Relationship2 on Localidades (id_muninicipio);
Alter table Localidades add Constraint Relationship2 foreign key (id_muninicipio) references Municipios (id_muninicipio) on update restrict on delete restrict;
Create index IX_Relationship3 on Ediles (id_localidad,id_muninicipio);
Alter table Ediles add Constraint Relationship3 foreign key (id_localidad,id_muninicipio) references Localidades (id_localidad,id_muninicipio) on update restrict on delete restrict;
Create index IX_Relationship14 on Proyectos (id_localidad,id_muninicipio);
Alter table Proyectos add Constraint Relationship14 foreign key (id_localidad,id_muninicipio) references Localidades (id_localidad,id_muninicipio) on update restrict on delete restrict;
Create index IX_Relationship15 on Actividades (id_localidad,id_muninicipio);
Alter table Actividades add Constraint Relationship15 foreign key (id_localidad,id_muninicipio) references Localidades (id_localidad,id_muninicipio) on update restrict on delete restrict;
Create index IX_Relationship23 on denuncias (id_localidad,id_muninicipio);
Alter table denuncias add Constraint Relationship23 foreign key (id_localidad,id_muninicipio) references Localidades (id_localidad,id_muninicipio) on update restrict on delete restrict;
Create index IX_Relationship8 on proyectosxcontratistas (id_proyecto);
Alter table proyectosxcontratistas add Constraint Relationship8 foreign key (id_proyecto) references Proyectos (id_proyecto) on update restrict on delete restrict;
Create index IX_Relationship10 on proyectosxinterventor (id_proyecto);
Alter table proyectosxinterventor add Constraint Relationship10 foreign key (id_proyecto) references Proyectos (id_proyecto) on update restrict on delete restrict;
Create index IX_Relationship12 on funcionariosxproyecto (id_proyecto);
Alter table funcionariosxproyecto add Constraint Relationship12 foreign key (id_proyecto) references Proyectos (id_proyecto) on update restrict on delete restrict;
Create index IX_Relationship18 on bitacora (id_proyecto);
Alter table bitacora add Constraint Relationship18 foreign key (id_proyecto) references Proyectos (id_proyecto) on update restrict on delete restrict;
Create index IX_Relationship6 on Proyectos (id_tipoproyecto);
Alter table Proyectos add Constraint Relationship6 foreign key (id_tipoproyecto) references TiposProyecto (id_tipoproyecto) on update restrict on delete restrict;
Create index IX_Relationship9 on proyectosxcontratistas (id_contratista);
Alter table proyectosxcontratistas add Constraint Relationship9 foreign key (id_contratista) references Contratistas (id_contratista) on update restrict on delete restrict;
Create index IX_Relationship11 on proyectosxinterventor (id_interventor);
Alter table proyectosxinterventor add Constraint Relationship11 foreign key (id_interventor) references Interventores (id_interventor) on update restrict on delete restrict;
Create index IX_Relationship13 on funcionariosxproyecto (id_funcionario);
Alter table funcionariosxproyecto add Constraint Relationship13 foreign key (id_funcionario) references Funcionario (id_funcionario) on update restrict on delete restrict;
Create index IX_Relationship27 on seguimiento (id_funcionario);
Alter table seguimiento add Constraint Relationship27 foreign key (id_funcionario) references Funcionario (id_funcionario) on update restrict on delete restrict;
Create index IX_Relationship17 on actividadesxedil (id_actividad);
Alter table actividadesxedil add Constraint Relationship17 foreign key (id_actividad) references Actividades (id_actividad) on update restrict on delete restrict;
Create index IX_Relationship22 on acividadesxciudadanos (id_actividad);
Alter table acividadesxciudadanos add Constraint Relationship22 foreign key (id_actividad) references Actividades (id_actividad) on update restrict on delete restrict;
Create index IX_Relationship21 on acividadesxciudadanos (id_ciudadano);
Alter table acividadesxciudadanos add Constraint Relationship21 foreign key (id_ciudadano) references ciudadanos (id_ciudadano) on update restrict on delete restrict;
Create index IX_Relationship28 on beneficiosxciudadano (id_ciudadano);
Alter table beneficiosxciudadano add Constraint Relationship28 foreign key (id_ciudadano) references ciudadanos (id_ciudadano) on update restrict on delete restrict;
Create index IX_Relationship25 on evidencias (id_denuncia);
Alter table evidencias add Constraint Relationship25 foreign key (id_denuncia) references denuncias (id_denuncia) on update restrict on delete restrict;
Create index IX_Relationship26 on seguimiento (id_denuncia);
Alter table seguimiento add Constraint Relationship26 foreign key (id_denuncia) references denuncias (id_denuncia) on update restrict on delete restrict;
Create index IX_Relationship29 on beneficiosxciudadano (id_beneficio);
Alter table beneficiosxciudadano add Constraint Relationship29 foreign key (id_beneficio) references beneficios (id_beneficio) on update restrict on delete restrict;





