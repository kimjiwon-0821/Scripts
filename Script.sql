SELECT * FROM tab;

SELECT * FROM EMPLOYEES;
SELECT * FROM REGIONS ;

SELECT * FROM JOBS;

--승진정보
SELECT * FROM JOB_HISTORY;

SELECT * FROM DEPARTMENTS ;
SELECT * FROM LOCATIONS;
SELECT * FROM COUNTRIES;
SELECT * FROM REGIONS;
SELECT COUNT(EMPLOYEE_ID) AS GROUPNAME FROM EMPLOYEES WHERE DEPARTMENT_ID =100; 

SELECT *
FROM LOCATIONS;
SELECT *
FROM EMPLOYEES;

SELECT CITY,POSTAL_CODE
FROM LOCATIONS;

---사원의 성, 이름, 월급, 입사일
SELECT FIRST_NAME, LAST_NAME, SALARY ,SALARY *12 AS "YEAR SALARY",(SALARY*12)-5000 TATAL, HIRE_DATE 입사일
FROM EMPLOYEES;

--함수호출
SELECT SUM(SALARY)/COUNT(EMPLOYEE_ID), AVG(SALARY)  
FROM EMPLOYEES ;

--중복제거
SELECT DISTINCT DEPARTMENT_ID ,EMPLOYEE_ID  FROM EMPLOYEES;

-- || 은 자바의 문자열 더하기와 같은 형질
SELECT STATE_PROVINCE ||'의 도시명은'|| CITY
FROM LOCATIONS;

--WHERE
SELECT DEPARTMENT_ID, JOB_ID , HIRE_DATE ,SALARY 
FROM EMPLOYEES WHERE SALARY >=8000 AND DEPARTMENT_ID =100;

SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

--사원의 모든 정보
--급여가 8000이상 1500이하

SELECT * FROM EMPLOYEES 
WHERE SALARY >=8000 AND SALARY <=15000;

--BETWEEN 이상,이하
SELECT *FROM EMPLOYEES
WHERE SALARY BETWEEN 8000 AND 15000;

--사원의 모든 정보
--부서 번호가 60, 100인 사원들
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID =60 OR DEPARTMENT_ID =100;

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(60,100);

--사원의 모든 정보
--LAST_NAME이 OSTINE인 사람
SELECT * FROM EMPLOYEES
WHERE LAST_NAME = 'Austin'

--사원의 모든 정보 20004-1-1 이후 입사한 사원들
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE >='2006?01?01'; -- 정상출력
--형태만 구분되면 가능

SELECT * FROM EMPLOYEES
WHERE LAST_NAME LIKE'%k%';

--WHERE 컬럼명 LIKE '%#%%' ESCAPE '#' ->구분 지정자 문자는 아무거나 상관없음

SELECT LAST_NAME , SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC;

SELECT LAST_NAME, SALARY FROM EMPLOYEES
ORDER BY LAST_NAME ASC;

--사원의 모든 정보 입사 순
SELECT * FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

SELECT EMPLOYEE_ID ,FIRST_NAME ,LAST_NAME, SALARY ,JOB_ID ,HIRE_DATE ,MANAGER_ID  FROM EMPLOYEES; 
SELECT FIRST_NAME, LAST_NAME, SALARY, (SALARY*12)+100 AS "Increased Ann_Salary",
(SALARY+100)*12 AS "Increased Salary" FROM EMPLOYEES;
SELECT FIRST_NAME ,LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY NOT BETWEEN 7000 AND 10000 
ORDER BY SALARY ASC;
SELECT * FROM EMPLOYEES WHERE LAST_ NAME LIKE '%e%'AND LAST_NAME LIKE'%o%';

SELECT FIRST_NAME ,LAST_NAME, SALARY ,JOB_ID,COMMISSION_PCT  FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC, COMMISSION_PCT DESC;

SELECT * FROM DEPARTMENTS  WHERE DEPARTMENT_ID  = 3000;

SELECT *  FROM LOCATIONS  WHERE STREET_ADDRESS LIKE '%c%';
SELECT EMPLOYEE_ID ,FIRST_NAME , LAST_NAME , JOB_ID , DEPARTMENT_ID FROM EMPLOYEES ORDER BY HIRE_DATE DESC;


--100번 부서에 근무하는 사원들의 평균 급여와 그 부서의 급여가 제일 높은 금액과 가장 낮은 금액 출력
SELECT AVG(SALARY) AS AVG, MAX(SALARY) AS MAX, MIN(SALARY) AS MIN FROM EMPLOYEES WHERE DEPARTMENT_ID =100;

--평균 급여, 큰금액, 적은 금액 부서별 , 평균급여가 100000이상
SELECT DEPARTMENT_ID ,AVG(SALARY) AS AVG, MAX(SALARY) AS MAX, MIN(SALARY) AS MIN FROM EMPLOYEES 
WHERE MANAGER_ID IS NOT NULL GROUP BY DEPARTMENT_ID HAVING AVG(SALARY)>=10000 ORDER BY 1 DESC;

--매니저별 사원수
SELECT MANAGER_ID ,COUNT(EMPLOYEE_ID) AS EMPLOYEE_MEMBER FROM EMPLOYEES --WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID HAVING MANAGER_ID IS NOT NULL ORDER BY 1 ASC;



---------------- INSERT ---------------------
--INSERT INTO 테이블명 (컬럼1, 컬럼2,...) VALUES (값1, 값2,...)
INSERT INTO REGIONS(REGION_ID, REGION_NAME) VALUES (5,'Test');
SELECT *FROM REGIONS ;
INSERT INTO REGIONS (REGION_NAME, REGION_ID) VALUES('Test2',6);
INSERT INTO REGIONS (REGION_ID,REGION_NAME) VALUES(7,NULL);
INSERT INTO REGIONS (REGION_ID) VALUES(8);

--ERROR 발생 (객수를 맞춰야함)
--INSERT INTO REGIONS (REGION_ID,REGION_NAME) VALUES (9)

--REGION_ID는 PK로 NOTNULL 오류
--INSERT INTO REGIONS (REGION_ID,REGION_NAME) VALUES (NULL,NULL);

ROLLBACK;
--AUTO-COMMIT 맞는듯  , ORACLE은 AUTO-COMMIT이랬는뎅,,,
COMMIT;

INSERT INTO REGIONS VALUES (9,'Test3');
INSERT INTO REGIONS VALUES(10,NULL);
--COLUMN값이 부족한 오류
--INSERT INTO REGIONS VALUES(11);

---------------- DELETE ---------------------
DELETE REGIONS WHERE REGION_NAME IS NULL;
DELETE REGIONS WHERE REGION_ID IN (7,8,10);
DELETE REGIONS WHERE REGION_ID>4;
DELETE REGIONS WHERE REGION_NAME = 'Test';
DELETE REGIONS WHERE REGION_NAME LIKE '%Test%';



SELECT*FROM COUNTRIES;
INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME,REGION_ID) VALUES('ZZ','Test',2);
--INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES('ZZA','Test',2);
--INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES('ZA','Test2',10);

--DELETE REGIONS WHERE REGION_ID = 2;

SELECT * FROM DEPARTMENTS ;
SELECT * FROM SEQ;

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID)
VALUES (DEPARTMENTS_SEQ.NEXTVAL,'TEST',NULL,1700);

UPDATE DEPARTMENTS SET MANAGER_ID = 200 WHERE DEPARTMENT_ID = 120;
UPDATE DEPARTMENTS SET DEPARTMENT_NAME = 'ITTest' , MANAGER_ID =NULL WHERE DEPARTMENT_ID =290;

---------------- FUNCTION ---------------------
SELECT 1+1 FROM DUAL; --계산식이나 함수 테스트 해볼때 (테이블이 없을 때 ) 가상의 더미 테이블을 사용할 수 있음

SELECT SUM(SALARY) FROM EMPLOYEES ;

SELECT SUM(SALARY), AVG(SALARY) FROM EMPLOYEES;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES;
SELECT SUM(COMMISSION_PCT), AVG(COMMISSION_PCT) ,COUNT(COMMISSION_PCT) FROM EMPLOYEES;
SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID),AVG(COMMISSION_PCT) FROM EMPLOYEES;

SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;
SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEES;
SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEES;
--SELECT AVG(HIRE_DATE) FROM EMPLOYEES; 

--2. 단일 함수
SELECT * FROM DEPARTMENTS;
--NULL함수
SELECT DEPARTMENT_NAME ,NVL(MANAGER_ID,200) FROM DEPARTMENTS; --데이터를 변경하는 것이 아닌 SELECT할때만 변경하여 보여주는 것
SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID) AS AVG , AVG(COMMISSION_PCT) AS AVG2 FROM EMPLOYEES; --AVG 함수는 NULL값을 제외함
SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID) AS AVG, AVG(NVL(COMMISSION_PCT,0)) AS AVG2 FROM EMPLOYEES; -- NVL : NULL인 값을 컬럼값으로 변경하여 SELECT하겟습니다.
SELECT DEPARTMENT_NAME , NVL2(MANAGER_ID,MANAGER_ID ,300) FROM DEPARTMENTS; -- JAVA의 조건식?값1:값2 (삼항연산식)과 비슷한 결과를 도출한다.

--숫자함수
SELECT ABS(-2.3) FROM DUAL; --절대값 출력 함수
SELECT FLOOR(3.123) FROM DUAL; -- 소숫점 아래 버림 함수
SELECT ROUND(3.723,1) FROM DUAL; --반올림 함수

--문자함수
SELECT DEPARTMENT_ID , UPPER(DEPARTMENT_NAME)  FROM DEPARTMENTS; -- DEPARTMENT_NAME 대문자로 변형 함수

SELECT RPAD('ABC',10,'*') FROM DUAL;
SELECT LPAD('ABC',10,'%') FROM DUAL;

--'myData'   m*****
SELECT RPAD('m',6,'*') FROM DUAL;
SELECT RPAD(SUBSTR('myData',0,1),LENGTH('myData'),'*') FROM DUAL;

SELECT EMPLOYEE_ID ,RPAD(LOWER(SUBSTR(FIRST_NAME,0,1)),LENGTH (FIRST_NAME),'*') AS NAME FROM EMPLOYEES;

SELECT SYSDATE , SYSTIMESTAMP , CURRENT_DATE , CURRENT_TIMESTAMP  FROM DUAL;

SELECT SYSDATE, SYSDATE +3, SYSDATE -2 FROM DUAL;

SELECT ADD_MONTHS(SYSDATE,-1) FROM DUAL; 

SELECT FLOOR(MONTHS_BETWEEN(SYSDATE ,HIRE_DATE))  FROM EMPLOYEES;
SELECT NEXT_DAY(SYSDATE,4) FROM DUAL; 

--TO_CHAR
SELECT SYSDATE , TO_CHAR(SYSDATE,'YYYY/ MM/ DD DAY') FROM DUAL; 
SELECT TO_CHAR(1234,'999')  FROM DUAL;

==TO_NUMBER
SELECT TO_NUMBER('123')*2 FROM DUAL;
SELECT TO_NUMBER('1,234','9,999')*2 FROM DUAL;
SELECT TO_NUMBER('1.23')*2 FROM DUAL; 

--TO_DATE
SELECT TO_DATE('2022/3/12') FROM DUAL; 

SELECT * FROM EMPLOYEES WHERE LAST_NAME ='King';
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID =90 OR DEPARTMENT_ID =80;
SELECT LOCATION_ID  FROM DEPARTMENTS WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME = 'King');

SELECT * FROM LOCATIONS l  ;
SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS;
--KING이 근무하는 대륙을 출력
SELECT REGION_NAME  FROM REGIONS WHERE REGION_ID  
IN(SELECT REGION_ID  FROM COUNTRIES WHERE COUNTRY_ID  
IN (SELECT COUNTRY_ID  FROM LOCATIONS  WHERE LOCATION_ID  
IN(SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID 
IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME = 'King'))));

--도시명이 시애틀에 근무하는 사원드르이 정보를 출력
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN(SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE LOCATION_ID 
IN(SELECT LOCATION_ID FROM LOCATIONS WHERE CITY = 'Seattle'));

SELECT REGION_NAME E FROM REGIONS r  WHERE REGION_ID = 
(SELECT REGION_ID FROM COUNTRIES c  WHERE COUNTRY_ID = 
(SELECT COUNTRY_ID FROM LOCATIONS l  WHERE LOCATION_ID = 
( SELECT LOCATION_ID FROM DEPARTMENTS d WHERE DEPARTMENT_ID = 
( SELECT DEPARTMENT_ID FROM EMPLOYEES e WHERE LAST_NAME ='Austin'))));

---사원들의 정보 평균 급여보다 많이 받는 사원들의 정보
SELECT * FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES );
--FIRST_NAME JOHN의 FIRST_NAME
SELECT FIRST_NAME FROM EMPLOYEES e WHERE EMPLOYEE_ID  = (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME ='Lex');

--사원들 중에서 급여를 제일 많이 받는 사원과 같은 부서에 근무하는 사원들의 평균 급여
SELECT AVG(SALARY) FROM EMPLOYEES e2  WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID  FROM EMPLOYEES e WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES));

--신입사원 이름과 가장 오래된 사람의 이름 출력
SELECT (SELECT FIRST_NAME FROM EMPLOYEES e WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE)FROM EMPLOYEES)), 
(SELECT FIRST_NAME FROM EMPLOYEES e3 WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEES )) FROM DUAL ;

SELECT * FROM REGIONS;
INSERT INTO REGIONS (REGION_ID,REGION_NAME) VALUES((SELECT MAX(REGION_ID) FROM REGIONS r )+1,'MARS');

SELECT A.SALARY*2 FROM (SELECT LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES) A; --A라는 가상의 테이블을 생성하는 것


--1번 예제
SELECT REGION_NAME FROM REGIONS r WHERE REGION_ID 
IN(SELECT REGION_ID FROM COUNTRIES c  WHERE COUNTRY_ID 
IN (SELECT COUNTRY_ID FROM LOCATIONS l  WHERE LOCATION_ID
IN (SELECT LOCATION_ID  FROM DEPARTMENTS WHERE DEPARTMENT_ID 
IN(SELECT DEPARTMENT_ID  FROM EMPLOYEES e  WHERE EMPLOYEE_ID =198))));
--2번 예제
SELECT DEPARTMENT_NAME FROM DEPARTMENTS d WHERE DEPARTMENT_ID  
IN(SELECT DEPARTMENT_ID  FROM EMPLOYEES WHERE LAST_NAME = 'Khoo');
--3번 예제
SELECT COUNTRY_NAME FROM COUNTRIES c WHERE COUNTRY_ID 
IN(SELECT COUNTRY_ID FROM LOCATIONS l WHERE LOCATION_ID 
IN(SELECT LOCATION_ID FROM DEPARTMENTS d  WHERE DEPARTMENT_ID 
IN(SELECT DEPARTMENT_ID  FROM EMPLOYEES e3  WHERE EMPLOYEE_ID  
IN(SELECT EMPLOYEE_ID FROM EMPLOYEES e2 WHERE MANAGER_ID 
IN (SELECT MANAGER_ID FROM EMPLOYEES e WHERE EMPLOYEE_ID =199)))));
--4번 예제
SELECT CITY FROM LOCATIONS l  WHERE LOCATION_ID 
IN(SELECT LOCATION_ID FROM DEPARTMENTS d WHERE DEPARTMENT_ID 
IN(SELECT DEPARTMENT_ID FROM EMPLOYEES e  d2 WHERE EMPLOYEE_ID
IN (SELECT EMPLOYEE_ID  FROM EMPLOYEES WHERE SALARY =(SELECT MIN(SALARY) FROM EMPLOYEES ))));

--7번예제
SELECT DISTINCT  * FROM EMPLOYEES e WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEES e2 GROUP BY DEPARTMENT_ID) ;

SELECT MIN(SALARY), DEPARTMENT_ID  FROM EMPLOYEES e2 GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID ASC;


SELECT  DISTINCT DEPARTMENT_ID FROM EMPLOYEES e ORDER BY DEPARTMENT_ID ASC ;
--8번예제
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID
IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS d WHERE LOCATION_ID
IN (SELECT LOCATION_ID FROM LOCATIONS l WHERE CITY LIKE 'S%')) ;









