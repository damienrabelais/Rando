DROP DATABASE IF EXISTS Rando;

CREATE DATABASE IF NOT EXISTS Rando;
USE Rando;
# -----------------------------------------------------------------------------
#       TABLE : APPORTEURDESPONSORS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPORTEURDESPONSORS
 (
   NOCONTRIBUTEUR INTEGER NOT NULL  
   , PRIMARY KEY (NOCONTRIBUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CONTRIBUTEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTRIBUTEUR
 (
   NOCONTRIBUTEUR INTEGER NOT NULL AUTO_INCREMENT ,
   NOM VARCHAR(50) NOT NULL  ,
   PRENOM VARCHAR(50) NOT NULL  ,
   EMAIL VARCHAR(50) NULL  ,
   TELPORTABLE VARCHAR(15) NULL  ,
   TELFIXE VARCHAR(15) NULL  ,
   ADRESSE VARCHAR(128) NULL  ,
   CODEPOSTAL INTEGER NULL  ,
   VILLE VARCHAR(50) NULL  
   , PRIMARY KEY (NOCONTRIBUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ADMINISTRATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADMINISTRATEUR
 (
   NOCONTRIBUTEUR INTEGER NOT NULL  ,
   MOTDEPASSE VARCHAR(50) NOT NULL  ,
   PROFIL VARCHAR(50) NOT NULL  
   , PRIMARY KEY (NOCONTRIBUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPANT
 (
   NOPARTICIPANT INTEGER NOT NULL AUTO_INCREMENT ,
   NOM VARCHAR(50) NULL  ,
   PRENOM VARCHAR(50) NULL  ,
   DATEDENAISSANCE DATE NULL  ,
   SEXE CHAR(1) NULL  
   , PRIMARY KEY (NOPARTICIPANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : BENEVOLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS BENEVOLE
 (
   NOCONTRIBUTEUR INTEGER NOT NULL  
   , PRIMARY KEY (NOCONTRIBUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : RANDONNEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RANDONNEUR
 (
   NOPARTICIPANT INTEGER NOT NULL  ,
   MAIL VARCHAR(50) NULL  ,
   TELPORTABLE VARCHAR(15) NULL  
   , PRIMARY KEY (NOPARTICIPANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EQUIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPE
 (
   NOEQUIPE INTEGER NOT NULL AUTO_INCREMENT ,
   NORESPONSABLE INTEGER NOT NULL  ,
   NOMEQUIPE VARCHAR(128) NOT NULL  
   , PRIMARY KEY (NOEQUIPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EQUIPE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EQUIPE_RESPONSABLE
     ON EQUIPE (NORESPONSABLE ASC);

# -----------------------------------------------------------------------------
#       TABLE : RESPONSABLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESPONSABLE
 (
   NOPARTICIPANT INTEGER NOT NULL  ,
   MOTDEPASSE VARCHAR(50) NOT NULL  ,
   MAIL VARCHAR(50) NOT NULL  ,
   TELPORTABLE VARCHAR(15) NOT NULL  
   , PRIMARY KEY (NOPARTICIPANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ANNEE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ANNEE
 (
   ANNEE INTEGER NOT NULL  ,
   DATECOURSE DATE NOT NULL  ,
   LIMITEAGE INTEGER NOT NULL  ,
   TARIFINSCRIPTIONADULTE REAL(5,2) NOT NULL  ,
   TARIFINSCRIPTIONENFANT REAL(5,2) NOT NULL  ,
   TARIFREPASENFANT REAL(5,2) NOT NULL  ,
   TARIFREPASADULTE REAL(5,2) NOT NULL  ,
   MAXPARTICIPANTS INTEGER NOT NULL  ,
   DATECLOTUREINSCRIPTION DATE NOT NULL  ,
   MAILORGANISATION VARCHAR(128) NOT NULL  ,
   CHEMINPDFLIVRET VARCHAR(255) NULL  ,
   CHEMINIMAGEAFFICHE VARCHAR(255) NULL  
   , PRIMARY KEY (ANNEE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SPONSOR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SPONSOR
 (
   NOSPONSOR INTEGER NOT NULL AUTO_INCREMENT ,
   NOM VARCHAR(128) NOT NULL  ,
   ADRESSE VARCHAR(128) NULL  ,
   CODEPOSTAL INTEGER NULL  ,
   VILLE VARCHAR(128) NULL  ,
   TELFIXE VARCHAR(15) NULL  ,
   TELPORTABLECONTACT VARCHAR(15) NULL  ,
   MAILCONTACT VARCHAR(128) NULL  ,
   CHEMINIMAGELOGO VARCHAR(255) NULL  
   , PRIMARY KEY (NOSPONSOR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : COMMISSION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMISSION
 (
   NOCOMMISSION SMALLINT NOT NULL  ,
   LIBELLE VARCHAR(128) NOT NULL  
   , PRIMARY KEY (NOCOMMISSION) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARCOURS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARCOURS
 (
   NOPARCOURS SMALLINT NOT NULL  ,
   KILOMETRAGE INTEGER NOT NULL  ,
   NBDEPARTICIPANTSMAXI INTEGER NULL  
   , PRIMARY KEY (NOPARCOURS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPER
 (
   ANNEE INTEGER NOT NULL  ,
   NOCOMMISSION SMALLINT NOT NULL  ,
   NOCONTRIBUTEUR INTEGER NOT NULL  
   , PRIMARY KEY (ANNEE,NOCOMMISSION,NOCONTRIBUTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PARTICIPER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PARTICIPER_ANNEE
     ON PARTICIPER (ANNEE ASC);

CREATE  INDEX I_FK_PARTICIPER_COMMISSION
     ON PARTICIPER (NOCOMMISSION ASC);

CREATE  INDEX I_FK_PARTICIPER_BENEVOLE
     ON PARTICIPER (NOCONTRIBUTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : APPORTER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPORTER
 (
   NOCONTRIBUTEUR INTEGER NOT NULL  ,
   NOSPONSOR INTEGER NOT NULL  
   , PRIMARY KEY (NOCONTRIBUTEUR,NOSPONSOR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPORTER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPORTER_APPORTEURDESPONSORS
     ON APPORTER (NOCONTRIBUTEUR ASC);

CREATE  INDEX I_FK_APPORTER_SPONSOR
     ON APPORTER (NOSPONSOR ASC);

# -----------------------------------------------------------------------------
#       TABLE : CONTRIBUER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTRIBUER
 (
   NOSPONSOR INTEGER NOT NULL  ,
   ANNEE INTEGER NOT NULL  ,
   MONTANT REAL(5,2) NULL  
   , PRIMARY KEY (NOSPONSOR,ANNEE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTRIBUER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTRIBUER_SPONSOR
     ON CONTRIBUER (NOSPONSOR ASC);

CREATE  INDEX I_FK_CONTRIBUER_ANNEE
     ON CONTRIBUER (ANNEE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CHOISIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CHOISIR
 (
   NOEQUIPE INTEGER NOT NULL  ,
   ANNEE INTEGER NOT NULL  ,
   NOPARCOURS SMALLINT NOT NULL  ,
   VAGUE INTEGER NULL  
   , PRIMARY KEY (NOEQUIPE,ANNEE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CHOISIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CHOISIR_EQUIPE
     ON CHOISIR (NOEQUIPE ASC);

CREATE  INDEX I_FK_CHOISIR_PARCOURS
     ON CHOISIR (NOPARCOURS ASC);

CREATE  INDEX I_FK_CHOISIR_ANNEE
     ON CHOISIR (ANNEE ASC);

# -----------------------------------------------------------------------------
#       TABLE : SINSCIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SINSCIRE
 (
   NOEQUIPE INTEGER NOT NULL  ,
   ANNEE INTEGER NOT NULL  ,
   DATEVALIDATION DATETIME NULL  ,
   MONTANTPAYE REAL(5,2) NULL  ,
   MONTANTREMBOURSE REAL(5,2) NULL  ,
   MODEREGLEMENT VARCHAR(128) NULL  
   , PRIMARY KEY (NOEQUIPE,ANNEE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE SINSCIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_SINSCIRE_EQUIPE
     ON SINSCIRE (NOEQUIPE ASC);

CREATE  INDEX I_FK_SINSCIRE_ANNEE
     ON SINSCIRE (ANNEE ASC);

# -----------------------------------------------------------------------------
#       TABLE : MEMBREDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBREDE
 (
   NOPARTICIPANT INTEGER NOT NULL  ,
   ANNEE INTEGER NOT NULL  ,
   NOEQUIPE INTEGER NOT NULL  ,
   REPASSURPLACE BOOL NOT NULL  
   , PRIMARY KEY (NOPARTICIPANT,ANNEE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEMBREDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEMBREDE_EQUIPE
     ON MEMBREDE (NOEQUIPE ASC);

CREATE  INDEX I_FK_MEMBREDE_PARTICIPANT
     ON MEMBREDE (NOPARTICIPANT ASC);

CREATE  INDEX I_FK_MEMBREDE_ANNEE
     ON MEMBREDE (ANNEE ASC);

# -----------------------------------------------------------------------------
#       TABLE : H_DATEVALIDATION_SINSCIRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS H_DATEVALIDATION_SINSCIRE
 (
   ANNEE INTEGER NOT NULL  ,
   NOEQUIPE INTEGER NOT NULL  ,
   DATE_HISTO DATE NOT NULL  ,
   DATEVALIDATION DATETIME NULL  
   , PRIMARY KEY (ANNEE,NOEQUIPE,DATE_HISTO) 
 ) 
 comment = "Table d'historisation des modifications de la table SINSCIRE";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE H_DATEVALIDATION_SINSCIRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_H_DATEVALIDATION_SINSCIRE_SINSCIRE
     ON H_DATEVALIDATION_SINSCIRE (ANNEE ASC,NOEQUIPE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE APPORTEURDESPONSORS 
  ADD FOREIGN KEY FK_APPORTEURDESPONSORS_CONTRIBUTEUR (NOCONTRIBUTEUR)
      REFERENCES CONTRIBUTEUR (NOCONTRIBUTEUR) ;


ALTER TABLE ADMINISTRATEUR 
  ADD FOREIGN KEY FK_ADMINISTRATEUR_BENEVOLE (NOCONTRIBUTEUR)
      REFERENCES BENEVOLE (NOCONTRIBUTEUR) ;


ALTER TABLE BENEVOLE 
  ADD FOREIGN KEY FK_BENEVOLE_CONTRIBUTEUR (NOCONTRIBUTEUR)
      REFERENCES CONTRIBUTEUR (NOCONTRIBUTEUR) ;


ALTER TABLE RANDONNEUR 
  ADD FOREIGN KEY FK_RANDONNEUR_PARTICIPANT (NOPARTICIPANT)
      REFERENCES PARTICIPANT (NOPARTICIPANT) ;


ALTER TABLE EQUIPE 
  ADD FOREIGN KEY FK_EQUIPE_RESPONSABLE (NORESPONSABLE)
      REFERENCES RESPONSABLE (NOPARTICIPANT) ;


ALTER TABLE RESPONSABLE 
  ADD FOREIGN KEY FK_RESPONSABLE_PARTICIPANT (NOPARTICIPANT)
      REFERENCES PARTICIPANT (NOPARTICIPANT) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_ANNEE (ANNEE)
      REFERENCES ANNEE (ANNEE) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_COMMISSION (NOCOMMISSION)
      REFERENCES COMMISSION (NOCOMMISSION) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_BENEVOLE (NOCONTRIBUTEUR)
      REFERENCES BENEVOLE (NOCONTRIBUTEUR) ;


ALTER TABLE APPORTER 
  ADD FOREIGN KEY FK_APPORTER_APPORTEURDESPONSORS (NOCONTRIBUTEUR)
      REFERENCES APPORTEURDESPONSORS (NOCONTRIBUTEUR) ;


ALTER TABLE APPORTER 
  ADD FOREIGN KEY FK_APPORTER_SPONSOR (NOSPONSOR)
      REFERENCES SPONSOR (NOSPONSOR) ;


ALTER TABLE CONTRIBUER 
  ADD FOREIGN KEY FK_CONTRIBUER_SPONSOR (NOSPONSOR)
      REFERENCES SPONSOR (NOSPONSOR) ;


ALTER TABLE CONTRIBUER 
  ADD FOREIGN KEY FK_CONTRIBUER_ANNEE (ANNEE)
      REFERENCES ANNEE (ANNEE) ;


ALTER TABLE CHOISIR 
  ADD FOREIGN KEY FK_CHOISIR_EQUIPE (NOEQUIPE)
      REFERENCES EQUIPE (NOEQUIPE) ;


ALTER TABLE CHOISIR 
  ADD FOREIGN KEY FK_CHOISIR_PARCOURS (NOPARCOURS)
      REFERENCES PARCOURS (NOPARCOURS) ;


ALTER TABLE CHOISIR 
  ADD FOREIGN KEY FK_CHOISIR_ANNEE (ANNEE)
      REFERENCES ANNEE (ANNEE) ;


ALTER TABLE SINSCIRE 
  ADD FOREIGN KEY FK_SINSCIRE_EQUIPE (NOEQUIPE)
      REFERENCES EQUIPE (NOEQUIPE) ;


ALTER TABLE SINSCIRE 
  ADD FOREIGN KEY FK_SINSCIRE_ANNEE (ANNEE)
      REFERENCES ANNEE (ANNEE) ;


ALTER TABLE MEMBREDE 
  ADD FOREIGN KEY FK_MEMBREDE_EQUIPE (NOEQUIPE)
      REFERENCES EQUIPE (NOEQUIPE) ;


ALTER TABLE MEMBREDE 
  ADD FOREIGN KEY FK_MEMBREDE_PARTICIPANT (NOPARTICIPANT)
      REFERENCES PARTICIPANT (NOPARTICIPANT) ;


ALTER TABLE MEMBREDE 
  ADD FOREIGN KEY FK_MEMBREDE_ANNEE (ANNEE)
      REFERENCES ANNEE (ANNEE) ;


ALTER TABLE H_DATEVALIDATION_SINSCIRE 
  ADD FOREIGN KEY FK_H_DATEVALIDATION_SINSCIRE_SINSCIRE (ANNEE,NOEQUIPE)
      REFERENCES SINSCIRE (ANNEE,NOEQUIPE) ;

