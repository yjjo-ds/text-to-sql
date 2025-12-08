


-- 5 table
-- 월 CLM 개인 회원 통합 정보
CREATE TABLE mm_clm_psmb_intg_info (
    mbr_csno PRIMARY KEY TEXT
);
-- TL_CLM_고객_혜택_상세_실적
CREATE TABLE tl_clm_cust_bnft_dtl_rsl (
    mbr_csno  PRIMARY KEY TEXT,
    mcno TEXT,
    card_prdt_cd TEXT,
    pchs_prdt_cd TEXT,
    FOREIGN KEY (card_prdt_cd) REFERENCES ld_card_prdt_clas_ogt(card_prdt_cd),
    FOREIGN KEY (pchs_prdt_cd) REFERENCES pchs_prdt_cd(pchs_prdt_cd)
    FOREIGN KEY (mcno) REFERENCES mm_mrch_info(mcno),
    FOREIGN KEY (mbr_csno) REFERENCES mm_clm_psmb_intg_info(mbr_csno),
);
-- 월 가맹점 정보
CREATE TABLE mm_mrch_info (
    mcno PRIMARY KEY TEXT,
    cuof_ymm TEXT,
    mccb_lcl_cd,
    mccb_mcl_cd,
    mccb_cd,
    FOREIGN KEY (mccb_mcl_cd) REFERENCES mccb_mcl_cd(mccb_mcl_cd),
    FOREIGN KEY (MCCB_lcl_cd) REFERENCES MCCB_lcl_cd(mccb_lcl_cd)
);
