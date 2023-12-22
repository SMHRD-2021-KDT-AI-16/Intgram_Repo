> 데이터베이스 설계순서?

  요구사항분석 > 개념설계 > 논리설계 >  물리설계 > 데이터베이스구현 (개.눈.물)


운송수단 : '자동차/기차/선박/비행기'  --> '자동차'

사용연료 : '휘발류/ 경유/ 항공유'    --> '경유'

주행거리 : ** km.                  --> '105km'




연료 :

순발열량 : 

배출계수 ---> CO2배출량 




> 오라클 시퀀스와 트리거의 이해

-- Auto Increment를 위한 Sequence 추가 SQL - tb_table.id
CREATE SEQUENCE tb_table_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_table.id
CREATE OR REPLACE TRIGGER tb_table_AI_TRG
BEFORE INSERT ON tb_table 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_table_SEQ.NEXTVAL
    INTO :NEW.id
    FROM DUAL;
END;


> 오라클 트리거를 이용한 욕설 게시판 삭제글 백업 구현

CREATE OR REPLACE TRIGGER TRG_POST_DELETE
BEFORE DELETE ON TBL_POST
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN
    -- TBL_POST의 삭제되기 직전 마지막을 글을 TBL_POST_DELETE 테이블로 복제함. 
    
    INSERT INTO tbl_post_deleted (post_seq, post_title, post_content, posted_at, user_id, deleted_at) 
    VALUES (:OLD.post_seq, :OLD.post_title, :OLD.post_content, :OLD.posted_at, :OLD.user_id, sysdate);
END;

DELETE FROM TBL_POST WHERE POST_SEQ = 3;




> CHALLEGE POINT #1

(문제) 탄소배출량 구하기..에서 문제머
(해결) 오라클 데이터베이스 트리거를 사용하여 해결함.

CREATE OR REPLACE TRIGGER TRG_CARBON_CAL
BEFORE INSERT ON TBL_MEMBER_CO2
REFERENCING NEW AS NEW FOR EACH ROW
DECLARE 
    
    V_NET  NUMBER(12,4); -- TBL_CO2_REF.NET_CALORIFIC_VAL%TYPE; 
    V_CO2  NUMBER(12,4);
    V_CH4  NUMBER(12,4);
    V_N2O  NUMBER(12,4);
    
    RESULT_CO2 NUMBER(12,4);
    RESULT_CH4 NUMBER(12,4);
    RESULT_N2O NUMBER(12,4);
    

BEGIN
    SELECT NET_CALORIFIC_VAL, CO2_E_FACTOR, CH4_E_FACTOR, N2O_E_FACTOR
    INTO V_NET, V_CO2, V_CH4, V_N2O
    FROM TBL_CO2_REF
    WHERE FUEL_NAME = :NEW.MEM_FUEL_NAME AND TRANSPORTATION = :NEW.TRANSPORTATION;
    
    RESULT_CO2 := :NEW.FUEL_AMOUNT * V_NET * V_CO2 * 0.000001;
    RESULT_CH4 := :NEW.FUEL_AMOUNT * V_NET * V_CH4 * 0.000021;
    RESULT_N2O := :NEW.FUEL_AMOUNT * V_NET * V_N2O * 0.000310;
    
    :NEW.CO2_EMISSION := RESULT_CO2 * 0.001;
    :NEW.CH4_EMISSION := RESULT_CH4 * 0.001;
    :NEW.N2O_EMISSION := RESULT_N2O * 0.001;
    :NEW.TOTAL_EMISSION := :NEW.CO2_EMISSION + :NEW.CH4_EMISSION + :NEW.N2O_EMISSION;

   
END;



INSERT INTO tbl_member_co2 (mem_id, transportation, mem_fuel_name, fuel_amount, co2_emission, ch4_emission, n2o_emission, total_emission, driving_date) 
VALUES ('mem_id 01', '차량', '경유', 200.0, 1.0, 1.0, 1.0, 1.0, sysdate);



> 트리거를 이용하여 체질량지수(BMI)를 자동 계산하기 

-- 테이블 생성 SQL - tbl_bmi
CREATE TABLE tbl_bmi
(
    bmi_seq    NUMBER(18, 0)    NOT NULL, 
    height     NUMBER(5, 1)     NOT NULL, 
    weight     NUMBER(5, 1)     NOT NULL, 
    bmi_idx    NUMBER(5, 2)     NOT NULL, 
    PRIMARY KEY (bmi_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tbl_bmi.bmi_seq
CREATE SEQUENCE tbl_bmi_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tbl_bmi.bmi_seq
CREATE OR REPLACE TRIGGER tbl_bmi_AI_TRG
BEFORE INSERT ON tbl_bmi 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_bmi_SEQ.NEXTVAL
    INTO :NEW.bmi_seq
    FROM DUAL;
END;

-- DROP TRIGGER tbl_bmi_AI_TRG; 

-- DROP SEQUENCE tbl_bmi_SEQ; 

-- 테이블 Comment 설정 SQL - tbl_bmi
COMMENT ON TABLE tbl_bmi IS '체질량지수';

-- 컬럼 Comment 설정 SQL - tbl_bmi.bmi_seq
COMMENT ON COLUMN tbl_bmi.bmi_seq IS 'BMI순번';

-- 컬럼 Comment 설정 SQL - tbl_bmi.height
COMMENT ON COLUMN tbl_bmi.height IS '키';

-- 컬럼 Comment 설정 SQL - tbl_bmi.weight
COMMENT ON COLUMN tbl_bmi.weight IS '체중';

-- 컬럼 Comment 설정 SQL - tbl_bmi.bmi_idx
COMMENT ON COLUMN tbl_bmi.bmi_idx IS 'BMI지수';

(트리거)
CREATE OR REPLACE TRIGGER TRG_BMI
BEFORE INSERT ON TBL_BMI
FOR EACH ROW 

BEGIN 
    :NEW.BMI_IDX := :NEW.WEIGHT / ((:NEW.HEIGHT/100) * (:NEW.HEIGHT/100));
END;


(테스트)
INSERT INTO tbl_bmi (height, weight, bmi_idx) VALUES (178.5, 66.3, 1);

--------------------------------------------------------------------------------------
> 핵심프로젝트 오라클 SQL문
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- tbl_company Table Create SQL
-- 테이블 생성 SQL - tbl_company
CREATE TABLE tbl_company
(
    com_id           VARCHAR2(50)     NOT NULL, 
    com_name         VARCHAR(200)     NOT NULL, 
    com_addr         VARCHAR(1000)    NOT NULL, 
    com_type         VARCHAR(50)      NOT NULL, 
    com_employees    NUMBER(12, 0)    NOT NULL, 
     PRIMARY KEY (com_id)
);

-- 테이블 Comment 설정 SQL - tbl_company
COMMENT ON TABLE tbl_company IS '중소기업정보';

-- 컬럼 Comment 설정 SQL - tbl_company.com_id
COMMENT ON COLUMN tbl_company.com_id IS '기업 아이디';

-- 컬럼 Comment 설정 SQL - tbl_company.com_name
COMMENT ON COLUMN tbl_company.com_name IS '기업 명';

-- 컬럼 Comment 설정 SQL - tbl_company.com_addr
COMMENT ON COLUMN tbl_company.com_addr IS '기업 주소';

-- 컬럼 Comment 설정 SQL - tbl_company.com_type
COMMENT ON COLUMN tbl_company.com_type IS '기업 형태';

-- 컬럼 Comment 설정 SQL - tbl_company.com_employees
COMMENT ON COLUMN tbl_company.com_employees IS '사원수';


-- tbl_member Table Create SQL
-- 테이블 생성 SQL - tbl_member
CREATE TABLE tbl_member
(
    mem_id          VARCHAR2(50)    NOT NULL, 
    mem_pw          VARCHAR2(50)    NOT NULL, 
    mem_name        VARCHAR2(50)    NOT NULL, 
    mem_position    VARCHAR2(50)    NOT NULL, 
    com_id          VARCHAR2(50)    NOT NULL, 
    mem_joindate    DATE            NOT NULL, 
     PRIMARY KEY (mem_id)
);

-- 테이블 Comment 설정 SQL - tbl_member
COMMENT ON TABLE tbl_member IS '회원 정보';

-- 컬럼 Comment 설정 SQL - tbl_member.mem_id
COMMENT ON COLUMN tbl_member.mem_id IS '회원 아이디';

-- 컬럼 Comment 설정 SQL - tbl_member.mem_pw
COMMENT ON COLUMN tbl_member.mem_pw IS '회원 비밀번호';

-- 컬럼 Comment 설정 SQL - tbl_member.mem_name
COMMENT ON COLUMN tbl_member.mem_name IS '회원 이름';

-- 컬럼 Comment 설정 SQL - tbl_member.mem_position
COMMENT ON COLUMN tbl_member.mem_position IS '회원 직급';

-- 컬럼 Comment 설정 SQL - tbl_member.com_id
COMMENT ON COLUMN tbl_member.com_id IS '기업 아이디';

-- 컬럼 Comment 설정 SQL - tbl_member.mem_joindate
COMMENT ON COLUMN tbl_member.mem_joindate IS '회원 가입일자';

-- Foreign Key 설정 SQL - tbl_member(com_id) -> tbl_company(com_id)
ALTER TABLE tbl_member
    ADD CONSTRAINT FK_tbl_member_com_id_tbl_compa FOREIGN KEY (com_id)
        REFERENCES tbl_company (com_id) ;

-- Foreign Key 삭제 SQL - tbl_member(com_id)
-- ALTER TABLE tbl_member
-- DROP CONSTRAINT FK_tbl_member_com_id_tbl_compa;


-- tbl_post_deleted Table Create SQL
-- 테이블 생성 SQL - tbl_post_deleted
CREATE TABLE tbl_post_deleted
(
    delete_seq      NUMBER(18, 0)    NOT NULL, 
    post_seq        NUMBER(18, 0)    NOT NULL, 
    post_title      VARCHAR(550)     NOT NULL, 
    post_content    VARCHAR(4000)    NOT NULL, 
    posted_at       DATE             NOT NULL, 
    user_id         VARCHAR2(50)     NOT NULL, 
    deleted_at      DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (delete_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tbl_post_deleted.delete_seq
CREATE SEQUENCE tbl_post_deleted_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tbl_post_deleted.delete_seq
CREATE OR REPLACE TRIGGER tbl_post_deleted_AI_TRG
BEFORE INSERT ON tbl_post_deleted 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_post_deleted_SEQ.NEXTVAL
    INTO :NEW.delete_seq
    FROM DUAL;
END;

-- DROP TRIGGER tbl_post_deleted_AI_TRG; 

-- DROP SEQUENCE tbl_post_deleted_SEQ; 

-- 테이블 Comment 설정 SQL - tbl_post_deleted
COMMENT ON TABLE tbl_post_deleted IS '게시판 삭제글';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.delete_seq
COMMENT ON COLUMN tbl_post_deleted.delete_seq IS '삭제 순번';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.post_seq
COMMENT ON COLUMN tbl_post_deleted.post_seq IS '글 번호';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.post_title
COMMENT ON COLUMN tbl_post_deleted.post_title IS '글 제목';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.post_content
COMMENT ON COLUMN tbl_post_deleted.post_content IS '글 내용';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.posted_at
COMMENT ON COLUMN tbl_post_deleted.posted_at IS '글 작성일자';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.user_id
COMMENT ON COLUMN tbl_post_deleted.user_id IS '글 작성자';

-- 컬럼 Comment 설정 SQL - tbl_post_deleted.deleted_at
COMMENT ON COLUMN tbl_post_deleted.deleted_at IS '삭제 시간';


-- tbl_post Table Create SQL
-- 테이블 생성 SQL - tbl_post
CREATE TABLE tbl_post
(
    post_seq        NUMBER(18, 0)    NOT NULL, 
    post_title      VARCHAR(550)     NOT NULL, 
    post_content    VARCHAR(4000)    NOT NULL, 
    posted_at       DATE             NOT NULL, 
    user_id         VARCHAR2(50)     NOT NULL, 
     PRIMARY KEY (post_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tbl_post.post_seq
CREATE SEQUENCE tbl_post_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tbl_post.post_seq
CREATE OR REPLACE TRIGGER tbl_post_AI_TRG
BEFORE INSERT ON tbl_post 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_post_SEQ.NEXTVAL
    INTO :NEW.post_seq
    FROM DUAL;
END;

-- DROP TRIGGER tbl_post_AI_TRG; 

-- DROP SEQUENCE tbl_post_SEQ; 

-- 테이블 Comment 설정 SQL - tbl_post
COMMENT ON TABLE tbl_post IS '게시판';

-- 컬럼 Comment 설정 SQL - tbl_post.post_seq
COMMENT ON COLUMN tbl_post.post_seq IS '글 번호';

-- 컬럼 Comment 설정 SQL - tbl_post.post_title
COMMENT ON COLUMN tbl_post.post_title IS '글 제목';

-- 컬럼 Comment 설정 SQL - tbl_post.post_content
COMMENT ON COLUMN tbl_post.post_content IS '글 내용';

-- 컬럼 Comment 설정 SQL - tbl_post.posted_at
COMMENT ON COLUMN tbl_post.posted_at IS '글 작성일자';

-- 컬럼 Comment 설정 SQL - tbl_post.user_id
COMMENT ON COLUMN tbl_post.user_id IS '글 작성자';


-- tb_table Table Create SQL
-- 테이블 생성 SQL - tb_table
CREATE TABLE tb_table
(
    id    INT    NOT NULL, 
     PRIMARY KEY (id)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tb_table.id
CREATE SEQUENCE tb_table_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tb_table.id
CREATE OR REPLACE TRIGGER tb_table_AI_TRG
BEFORE INSERT ON tb_table 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tb_table_SEQ.NEXTVAL
    INTO :NEW.id
    FROM DUAL;
END;

-- DROP TRIGGER tb_table_AI_TRG; 

-- DROP SEQUENCE tb_table_SEQ; 

-- 테이블 Comment 설정 SQL - tb_table
COMMENT ON TABLE tb_table IS '예비 테이블';

-- 컬럼 Comment 설정 SQL - tb_table.id
COMMENT ON COLUMN tb_table.id IS '아이디';


-- tbl_member_co2 Table Create SQL
-- 테이블 생성 SQL - tbl_member_co2
CREATE TABLE tbl_member_co2
(
    user_co2_seq      NUMBER(18, 0)    NOT NULL, 
    mem_id            VARCHAR2(50)     NOT NULL, 
    transportation    VARCHAR2(50)     NOT NULL, 
    mem_fuel_name     VARCHAR2(50)     NOT NULL, 
    fuel_amount       NUMBER(12,1)     NOT NULL, 
    co2_emission      NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    ch4_emission      NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    n2o_emission      NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    total_emission    NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    driving_date      DATE             DEFAULT SYSDATE NOT NULL, 
     PRIMARY KEY (user_co2_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tbl_member_co2.user_co2_seq
CREATE SEQUENCE tbl_member_co2_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tbl_member_co2.user_co2_seq
CREATE OR REPLACE TRIGGER tbl_member_co2_AI_TRG
BEFORE INSERT ON tbl_member_co2 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_member_co2_SEQ.NEXTVAL
    INTO :NEW.user_co2_seq
    FROM DUAL;
END;

-- DROP TRIGGER tbl_member_co2_AI_TRG; 

-- DROP SEQUENCE tbl_member_co2_SEQ; 

-- 테이블 Comment 설정 SQL - tbl_member_co2
COMMENT ON TABLE tbl_member_co2 IS '회원 탄소배출량';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.user_co2_seq
COMMENT ON COLUMN tbl_member_co2.user_co2_seq IS '탄소배출 순번';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.mem_id
COMMENT ON COLUMN tbl_member_co2.mem_id IS '회원 아이디';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.transportation
COMMENT ON COLUMN tbl_member_co2.transportation IS '운송 수단';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.mem_fuel_name
COMMENT ON COLUMN tbl_member_co2.mem_fuel_name IS '연료명';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.fuel_amount
COMMENT ON COLUMN tbl_member_co2.fuel_amount IS '연료량';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.co2_emission
COMMENT ON COLUMN tbl_member_co2.co2_emission IS '이산화탄소 배출량';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.ch4_emission
COMMENT ON COLUMN tbl_member_co2.ch4_emission IS '매탄 배출량';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.n2o_emission
COMMENT ON COLUMN tbl_member_co2.n2o_emission IS '이산화질소 배출량';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.total_emission
COMMENT ON COLUMN tbl_member_co2.total_emission IS '탄소배출량(합계)';

-- 컬럼 Comment 설정 SQL - tbl_member_co2.driving_date
COMMENT ON COLUMN tbl_member_co2.driving_date IS '운행 일자';

-- Foreign Key 설정 SQL - tbl_member_co2(mem_id) -> tbl_member(mem_id)
ALTER TABLE tbl_member_co2
    ADD CONSTRAINT FK_tbl_member_co2_mem_id_tbl_m FOREIGN KEY (mem_id)
        REFERENCES tbl_member (mem_id) ;

-- Foreign Key 삭제 SQL - tbl_member_co2(mem_id)
-- ALTER TABLE tbl_member_co2
-- DROP CONSTRAINT FK_tbl_member_co2_mem_id_tbl_m;


-- tbl_co2_ref Table Create SQL
-- 테이블 생성 SQL - tbl_co2_ref
CREATE TABLE tbl_co2_ref
(
    co2_seq              NUMBER(18, 0)    NOT NULL, 
    transportation       VARCHAR2(50)     NOT NULL, 
    fuel_name            VARCHAR2(50)     NOT NULL, 
    fuel_unit            VARCHAR2(20)     NULL, 
    net_calorific_val    NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    co2_e_factor         NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    ch4_e_factor         NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
    n2o_e_factor         NUMBER(10,2)     DEFAULT 0.0 NOT NULL, 
     PRIMARY KEY (co2_seq)
);

-- Auto Increment를 위한 Sequence 추가 SQL - tbl_co2_ref.co2_seq
CREATE SEQUENCE tbl_co2_ref_SEQ
START WITH 1
INCREMENT BY 1;

-- Auto Increment를 위한 Trigger 추가 SQL - tbl_co2_ref.co2_seq
CREATE OR REPLACE TRIGGER tbl_co2_ref_AI_TRG
BEFORE INSERT ON tbl_co2_ref 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT tbl_co2_ref_SEQ.NEXTVAL
    INTO :NEW.co2_seq
    FROM DUAL;
END;

-- DROP TRIGGER tbl_co2_ref_AI_TRG; 

-- DROP SEQUENCE tbl_co2_ref_SEQ; 

-- 테이블 Comment 설정 SQL - tbl_co2_ref
COMMENT ON TABLE tbl_co2_ref IS '탄소 배출 계산 참조';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.co2_seq
COMMENT ON COLUMN tbl_co2_ref.co2_seq IS '계수 순번';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.transportation
COMMENT ON COLUMN tbl_co2_ref.transportation IS '운송 수단';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.fuel_name
COMMENT ON COLUMN tbl_co2_ref.fuel_name IS '연료 명';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.fuel_unit
COMMENT ON COLUMN tbl_co2_ref.fuel_unit IS '연료 단위';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.net_calorific_val
COMMENT ON COLUMN tbl_co2_ref.net_calorific_val IS '순 발열량';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.co2_e_factor
COMMENT ON COLUMN tbl_co2_ref.co2_e_factor IS '배출 계수(CO2)';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.ch4_e_factor
COMMENT ON COLUMN tbl_co2_ref.ch4_e_factor IS '배출 계수(CH4)';

-- 컬럼 Comment 설정 SQL - tbl_co2_ref.n2o_e_factor
COMMENT ON COLUMN tbl_co2_ref.n2o_e_factor IS '배출 계수(N2O)';


