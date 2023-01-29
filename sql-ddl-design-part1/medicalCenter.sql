-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "MediCenter" (
    "MediCenter_id" int   NOT NULL,
    "Name" string   NOT NULL,
    "Address" string   NOT NULL,
    "Number" number   NOT NULL,
    CONSTRAINT "pk_MediCenter" PRIMARY KEY (
        "MediCenter_id"
     )
);

CREATE TABLE "Doctor" (
    "Doctor_id" int   NOT NULL,
    "Name" string   NOT NULL,
    "Specialty" string   NOT NULL,
    "MediCenter_id" int   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "Doctor_id"
     )
);

CREATE TABLE "Patient" (
    "Patient_id" int   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "Patient_id"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Relationship" (
    "Relationship_id" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "Doctor_id" int   NOT NULL,
    "Patient_id" int   NOT NULL,
    CONSTRAINT "pk_Relationship" PRIMARY KEY (
        "Relationship_id"
     )
);

CREATE TABLE "Disease" (
    "Disease_id" int   NOT NULL,
    "Name" string   NOT NULL,
    "Discreption" string   NOT NULL,
    CONSTRAINT "pk_Disease" PRIMARY KEY (
        "Disease_id"
     ),
    CONSTRAINT "uc_Disease_Name" UNIQUE (
        "Name"
    )
);

CREATE TABLE "Visit" (
    "Visit_id" int   NOT NULL,
    "Data" date   NOT NULL,
    "Doc_id" int   NOT NULL,
    "Pat_id" int   NOT NULL,
    CONSTRAINT "pk_Visit" PRIMARY KEY (
        "Visit_id"
     )
);

CREATE TABLE "Diagnose" (
    "Diagnose_id" int   NOT NULL,
    "Visit_id" int   NOT NULL,
    "Disease_id" int   NOT NULL,
    "TreatmentNote" string   NOT NULL,
    CONSTRAINT "pk_Diagnose" PRIMARY KEY (
        "Diagnose_id"
     )
);

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_MediCenter_id" FOREIGN KEY("MediCenter_id")
REFERENCES "MediCenter" ("MediCenter_id");

ALTER TABLE "Relationship" ADD CONSTRAINT "fk_Relationship_Doctor_id" FOREIGN KEY("Doctor_id")
REFERENCES "Doctor" ("Doctor_id");

ALTER TABLE "Relationship" ADD CONSTRAINT "fk_Relationship_Patient_id" FOREIGN KEY("Patient_id")
REFERENCES "Patient" ("Patient_id");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_Doc_id" FOREIGN KEY("Doc_id")
REFERENCES "Doctor" ("Doctor_id");

ALTER TABLE "Visit" ADD CONSTRAINT "fk_Visit_Pat_id" FOREIGN KEY("Pat_id")
REFERENCES "Patient" ("Patient_id");

ALTER TABLE "Diagnose" ADD CONSTRAINT "fk_Diagnose_Visit_id" FOREIGN KEY("Visit_id")
REFERENCES "Visit" ("Visit_id");

ALTER TABLE "Diagnose" ADD CONSTRAINT "fk_Diagnose_Disease_id" FOREIGN KEY("Disease_id")
REFERENCES "Disease" ("Disease_id");

