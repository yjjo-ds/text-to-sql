


-- 5 table
-- 월 CLM 개인 회원 통합 정보
CREATE TABLE mm_clm_psmb_intg_info (
    mbr_csno PRIMARY KEY TEXT -- 고객번호
);
-- TL_CLM_고객_혜택_상세_실적
CREATE TABLE tl_clm_cust_bnft_dtl_rsl (
    mbr_csno  PRIMARY KEY TEXT, -- 고객번호
    mcno TEXT, --가맹점 번호 
    card_prdt_cd TEXT, -- 카드상품코드
    pchs_prdt_cd TEXT, -- 매출상품코드
    bnft_amt, -- 혜택금액
    FOREIGN KEY (card_prdt_cd) REFERENCES ld_card_prdt_clas_ogt(card_prdt_cd),
    FOREIGN KEY (pchs_prdt_cd) REFERENCES pchs_prdt_cd(pchs_prdt_cd)
    FOREIGN KEY (mcno) REFERENCES mm_mrch_info(mcno),
    FOREIGN KEY (mbr_csno) REFERENCES mm_clm_psmb_intg_info(mbr_csno),
);
-- 월 가맹점 정보
CREATE TABLE mm_mrch_info (
    mcno PRIMARY KEY TEXT,
    cuof_ymn TEXT, -- 기준년월
    mccb_lcl_cd, -- 가맹점업종대분류코드
    mccb_mcl_cd, -- 가맹점업종중분류코드
    mccb_cd, -- 가맹점업종코드
    FOREIGN KEY (mccb_mcl_cd) REFERENCES mccb_mcl_cd(mccb_mcl_cd),
    FOREIGN KEY (MCCB_lcl_cd) REFERENCES MCCB_lcl_cd(mccb_lcl_cd)
);

-- 월 TS 카드 매출
CREATE TABLE mm_ts_card_pchs (
    mbr_csno PRIMARY KEY TEXT, -- 고객번호
    mrch_nm TEXT, -- 가맹점명 
    mccb_cd, -- 가맹점업종코드
    FOREIGN KEY (mcno) REFERENCES mm_mrch_info(mcno),
    FOREIGN KEY (mbr_csno) REFERENCES REFERENCES mm_clm_psmb_intg_info(mbr_csno)
);
