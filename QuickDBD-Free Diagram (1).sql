﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Z9rw6A
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" varchar(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title" VARCHAR(30)   NOT NULL,
    "birth_date" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(30)   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_manager" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

