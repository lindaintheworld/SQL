-- 이게 코멘트 작성
-- DAY2 수업내용
/*여러 줄에 대한 코멘트 작성할 때*/

/*
NUMBER : 정수 + 실수
문자와 문자열 구분 X
->JAVA에서는 STRING으로 처리
NUMBER(7,2) : 기본형
CHAR() : 괄호 안에 꼭 숫자 표기해야함!, 고정길이로 남은 부분은 공백처리
NUMBER는 생략 가능
한글은 한 글자에 2바이트
VARCHAR2() : 괄호 안에 꼭 숫자 표기해야함!, 가변길이라서 남은 부분 공백처리 되지 않는다.
DATE : 날짜가 숫자로 처리 되기 때문에 비교 및 계산 가능
*/

/*
오라클 자료형
- NUMBER(정수, 실수), VARCHAR2(가변길이 문자열), 
    CHAR(고정길이 문자열), DATE(날짜, 시간), LONG(가변길이 문자열이고 2기가까지 처리 가능)
    
- NUMBER : 기본은 정수형임, 기본 자릿수 : 7
    NUMBER(자릿수) => NUMBER(12) : 정수를 최대 12자리까지 기록
    NUMBER(최대기록자릿수, 소수점아래 자릿수) : 실수형 값 기록
    => NUMBER(10, 2) : 실수형 값을 최대 10자리까지 기록
                                소수점 아래 자릿수는 2자리까지 기록 가능
                                
- CHAR(지정자릿수) : 지정한 글자 바이트 사이즈만큼의 글자를 기록
    CHAR(10) : 무조건 10바이트 기록함. 만약, 나머지 바이트는 공백문자로 채움.
    
- VARCHAR2(최대기록글자바이트수) : 지정한 바이트사이즈 이하의 글자를 기록함
    VARCHAR2(15) : 최대 15바이트 이내의 글자로 기록
    
- DATE : 날짜와 시간 처리용
    세기, 년, 월, 일, 시, 분, 초, 오전/오후, 요일 처리
    한국어일 때는 포멧이 YY/MM/DD
    영어일 때는 포멧이 DD/MM/YY


    

    



*/

--날짜 포맷 확인
SELECT SYSDATE
FROM DUAL;

--오라클 데이터베이스 환경설정 변수 값 확인
SELECT *
FROM V$NLS_PARAMETERS;

--한글 바이트 크기 확인하기
SELECT LENGTH('오라 클'), LENGTHB('오라클'), LENGTHB('가')
FROM DUAL;

--날짜 데이터 계산 가능함
SELECT SYSDATE + 100 FROM DUAL; --오늘부터 100일 뒤에 날짜
SELECT SYSDATE - 300 FROM DUAL; --오늘 날짜에서 300일 전

SELECT SYSDATE - HIRE_DATE --오늘 -입사일 : 날짜수(근무일수)
FROM EMPLOYEE;

SELECT SYSDATE + 120 / 24 FROM DUAL; --오늘 날짜에서 120시간 뒤에 날짜 조회

-- SELECT 문 ***********************************************
-- DQL(Data Query Language)
-- 데이터베이스에서 테이블의 형태로 기록된 데이터를 조회할 때 사용하는 구문임

-- 사용 1
-- 직원 테이블(EMPLOYEE)에서 사번(EMP_ID), 사원명(EMP_NAME), 전화번호(PHONE) 컬럼값 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE;

-- 사용 2
-- 직원 테이블에서 관리자 사번이 100인(팀장인 한선기) 직원 조회
SELECT * 
FROM EMPLOYEE
WHERE MGR_ID = '100';

-- 사용 3
-- 직원 테이블에서 한선기 팀장(사번이 100)의 관리를 받고 있는 직원 조회
-- 사번, 이름, 전화번호, 부서코드 조회
SELECT EMP_ID, EMP_NAME, PHONE, DEPT_ID
FROM EMPLOYEE
WHERE MGR_ID = '100';

-- 사용 4
-- 직원 테이블과 부서 테이블(DEPARTMENT)에서 정보 조회
-- 사번, 이름, 급여, 부서명
Select Emp_Id, Emp_Name, Salary, Dept_Name
From  Employee
Join    Department Using (Dept_Id)
WHERE DEPT_ID = '50'
ORDER BY EMP_NAME ASC; --ASC로 정렬

-- SELECT 구문 형식 ***********************************
/*
SELECT * ㅣ [DISTINCT] 조회할 컬럼명 ㅣ 계산식 [AS] 별칭(Alias)
FROM 조회에 사용할 테이블명;

*/

-- * : 모든 컬럼 (테이블이 가진 컬럼 전부 다)
SELECT * 
FROM EMPLOYEE;

-- EMPLOYEE테이블에서 사번, 사원명, 급여 정보를 조회할 경우
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- DISTINCT 컬럼 명
SELECT JOB_ID
FROM EMPLOYEE;

SELECT DISTINCT JOB_ID
FROM EMPLOYEE;
-- DISTINCT는 SELECT 절에 딱 1번만 사용 가능

SELECT DISTINCT JOB_ID, DISTINCT DEPT_ID
FROM EMPLOYEE; --ERROR

SELECT DISTINCT JOB_ID, DEPT_ID
FROM EMPLOYEE; --두 가지를 하나로 묶어서 중복인지 아닌지를 체크함

-- SLECT 절에 계산식을 사용할 수도 있음
SELECT (23 + 31) / 5
FROM DUAL; -- DUAL : DUMMY(가짜) 테이블

-- 직원 테이블에서 사번, 사원명, 급여, 1년치 급여
SELECT EMP_ID, EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- 직원 테이블에서 사번, 사원명, 급여, 보너스포인트, 보너스포인트가 적용된 연봉 조회
-- 계산식 : 급여 + (급여 * 보너스 포인트)  * 12
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT, (SALARY + (SALARY * BONUS_PCT)) * 12
FROM EMPLOYEE;
-- 계산값에 NULL이 있으면, 결과도 NULL이 됨.

-- 계산식에 함수 사용할 수 있음
-- 컬럼의 값이 NULL인 경우에 다른 값으로 바꾸는 함수 : NVL
-- NVL(컬럼명, 바꿀값) : 
SELECT EMP_ID, EMP_NAME, SALARY, BONUS_PCT,
            (SALARY + (SALARY * NVL(BONUS_PCT , 0))) * 12
FROM EMPLOYEE;

-- SELECT 절에 나열된 컬럼명 또는 계산식 뒤에 별칭(Alias) 사용할 수도 있음 -> 계산식을 가림
-- 별칭에 반드시 "별칭"(큰따옴표)로 묶어야 하는 경우 : 별칭에 공백이나 숫자, 기호문자
SELECT EMP_ID 사번, EMP_NAME 이름, SALARY AS "급여(원)", -- AS는 안 써도 됌
            SALARY * 12 AS "1년 급여", BONUS_PCT "보너스 포인트",
            BONUS_PCT, (SALARY + (SALARY * BONUS_PCT)) * 12 "보너스포인트적용연봉"
            
FROM EMPLOYEE;

-- SELECT 절에 리터럴(LITERAL : 값)을 사용할 수도 있음
SELECT EMP_ID 사번, EMP_NAME 이름, '재직' 상태 -- 임의의 값 설정
FROM EMPLOYEE;


-- WHERE : 조건절
-- 1. FROM절(TABLE 찾는다) 2. WHERE절(일치하는 조건의 행을 골라냄)
/*
WHERE 절 사용

3. SELECT  컬럼명 별칭,     ........
1. FROM 테이블명
2. WHERE 컬럼명 비교연산자 비교값

- WHERE는 반드시 FROM 절 다음에 사용해야 함
- 테이블에서 조건과 일치하는 값을 가진 행들을 골라냄
- >, <, >=, <=, =,
!=, <>, ^=(일치하지 않는 같지 않은)
- AND, OR, NOT
*/

-- 부서코드가 90인 직원들만 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90';

-- 직급코드가 'J7'인 직원들만 조회
SELECT *
FROM EMPLOYEE
WHERE JOB_ID = 'J7';

-- 급여가 400만을 초과하는 직원들만 조회
SELECT *
FROM EMPLOYEE
WHERE SALARY > 4000000;

-- 급여가 2백만이상 4백만이하인 직원들만 조회
SELECT EMP_ID 사번 , EMP_NAME 이름, SALARY 급여, JOB_ID 직급코드, DEPT_ID 부서코드
FROM EMPLOYEE
-- WHERE SALARY >= 2000000 AND SALARY <= 4000000;
WHERE SALARY BETWEEN 2000000 AND 4000000; 

-- 날짜 데이터에도 컬럼명 BETWEEN 작은값 AND 큰값 적용할 수 있음
-- 입사일이 1995년 1월 1일부터 2000년 12월 31일 사이에 입사한
-- 직원의 사번, 이름, 입사일, 부서코드 조회, 별칭 처리
-- 날짜데이터 표기 시에는 데이트베이스가 정한 날짜 포맷에 맞춰서
-- '날짜형식' 묶어서 표기해야 함
SELECT SYSDATE FROM DUAL; --'18/12/31' 표현하면 됨

SELECT EMP_ID 사번, EMP_NAME 이름, HIRE_DATE 입사일, DEPT_ID 부서코드
FROM EMPLOYEE
-- WHERE HIRE_DATE >= '95/01/01' AND HIRE_DATE <=  '00/12/31';
WHERE HIRE_DATE BETWEEN '95/01/01' AND '00/12/31';

-- 부서코드 '90'이면서, 급여가 2백만을 초과하는 직원 조회
-- 90번 부서에 소속된 직원 중에서 급여가 2백만이 넘는 직원
SELECT *
FROM EMPLOYEE
WHERE DEPT_ID = '90' AND SALARY >= 200000;

-- 부서코드가 90 또는 20인 직원 조회
SELECT *
FROM EMPLOYEE
--WHERE DEPT_ID = '90' OR DEPT_ID =  '20';
WHERE DEPT_ID IN ('20', '90');

-- 연결 연산자 : || (자바의 문자열 합치기 하는 +와 같은 의미의 연산자임)
-- SELECT 절에서 조회한 컬럼값들을 하나로 합치거나, 컬럼값과 리터럴을 합칠 경우
SELECT EMP_NAME ||  ' 직원의 급여는 ' || SALARY || ' 입니다.' AS 급여정보
FROM EMPLOYEE
WHERE DEPT_ID = '90'

-- 2000년 1월 1일 이후에 입사한 직원 중에서
-- 기혼인 직원의 이름, 입사일, 직급코드, 부서코드, 급여, 결혼여부 조회, 별칭 처리
-- 급여값 뒤에는 '(원)' 리터럴 붙여줌
-- 결혼여부는 리터럴을 채움
SELECT EMP_NAME 이름, HIRE_DATE 입사일, JOB_ID 직급코드, DEPT_ID 부서코드, SALARY  || '(원)' 급여 , '기혼' 결혼여부
FROM EMPLOYEE
WHERE HIRE_DATE >= '00/01/01' AND MARRIAGE = 'Y';

-- 급여를 2백만보다 적게 받거나, 4백만보다 많이 받는 직원 조회
-- 이름, 급여 조회
SELECT *
FROM EMPLOYEE
--WHERE SALARY < 2000000 OR SALARY > 4000000;
--WHERE NOT (SALARY >= 2000000 AND SALARY <= 4000000);
--WHERE SALARY NOT BETWEEN 2000000 AND 4000000;
WHERE NOT SALARY  BETWEEN 2000000 AND 4000000;



