-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Region" (
    "Region_id" int   NOT NULL,
    "City_name" string   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "Region_id"
     )
);

CREATE TABLE "User" (
    "User_id" int   NOT NULL,
    "Preferred_region" int   NOT NULL,
    "Name" string   NOT NULL,
    "Account" string   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "User_id"
     )
);

CREATE TABLE "Post" (
    "Post_id" int   NOT NULL,
    "Title" string   NOT NULL,
    "Text" string   NOT NULL,
    "User" int   NOT NULL,
    "Location" string   NOT NULL,
    "PostReg_id" int   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "Post_id"
     )
);

CREATE TABLE "Category" (
    "Category_id" int   NOT NULL,
    "Categoty" string   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "Category_id"
     )
);

CREATE TABLE "Post_Category" (
    "Id" int   NOT NULL,
    "Post_id" int   NOT NULL,
    "Cat_id" int   NOT NULL,
    CONSTRAINT "pk_Post_Category" PRIMARY KEY (
        "Id"
     )
);

ALTER TABLE "User" ADD CONSTRAINT "fk_User_Preferred_region" FOREIGN KEY("Preferred_region")
REFERENCES "Region" ("Region_id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_User" FOREIGN KEY("User")
REFERENCES "User" ("User_id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_PostReg_id" FOREIGN KEY("PostReg_id")
REFERENCES "Region" ("Region_id");

ALTER TABLE "Post_Category" ADD CONSTRAINT "fk_Post_Category_Post_id" FOREIGN KEY("Post_id")
REFERENCES "Post" ("Post_id");

ALTER TABLE "Post_Category" ADD CONSTRAINT "fk_Post_Category_Cat_id" FOREIGN KEY("Cat_id")
REFERENCES "Category" ("Category_id");

