
select organ_nm
, sigungu as sigungu_nm
, oper_org_cd
, case nvi(dev_odr_cd, 'null') when '00' then '20년 댁내‘
when 10 then 21년 댁내'
when 20' then 22년 댁내'
when 'null then '미설정'
when 전체 then '전체
else 'X' end as dev_odr_cd
. (NVL(emer_cancle_cnt, 0) + NVL(emer_fire_cnt, 0) + NVL(emer_gas_cnt,
0) + NVL(emer_119_cnt, 0) + NVL(g_119_cnt, 0)
+ NVLemer_call_cnt, 0) + NVL(emer_callout_cnt, 0) +
NVL(emer_lone_death_cnt,O) + NVL(emer_safety_accident_cnt, 0)
+ NVL(emer _disease_cnt, 0) + NVL(emer_nb_cnt,O) + NVL(emer_stop_cnt, 0)
+ NVL(emer_mcall_cnt, 0) + NVL(emer_etc_cnt, 0)
) emer_total
• NVL(emer_cancle_cnt, 0) emer_cancle_cnt
, nvl(emer_fire_cnt, 0) emer_fire_cnt
, nvl(emer_gas_cnt, 0) emer_gas_cnt
, nvi(emer_119_cnt, 0) emer_119_cnt
, NVL(g_119_cnt, 0) g_119_cnt
, nvi(emer_call_cnt, 0) emer_call_cnt
, NVL(emer_callout_cnt, 0) emer_callout_cnt
, nvl(emer_lone_death_cnt, 0) emer_lone_death_cnt
, nvlemer_safety_accident_cnt, 0) emer_safety_accident_cnt , nvlemer_disease_cnt, 0) emer_disease_cnt
NVL(emer_b_cnt, 0) emer_nb_cnt
, NVL(emer_stop_cnt, 0) emer_stop_cnt|
, NVL(emer_mcall_cnt, 0) emer_mcall_cnt
, nvl(emer_etc_cnt, 0) emer_etc_cnt
, nvl(emer_cnt, 0) emer_cnt
, nvl(no_emer_cnt, 0) no_emer_cnt
, nvitest _cnt, 0) test_cnt
, nvl(safe_cnt, 0) safe_cnt
nvl(spot_cnt, 0) spot_cnt
• nvhspt|_cnt, O) hsptl_cnt
, nvl(death_cnt, 0) death_cnt
, nvl(safe_119_cnt, 0) safe_119_cnt
, nvl(safe_emer_cnt, 0) safe_emer_cnt
, nvl(gout_119_cnt, 0) gout_119_cnt
nvl(gout_emer_cnt, 0) gout_emer_cnt

nv(normal_nt, 0) normal_cnt
, nvI(unnormal_cnt, 0) unnormal_cnt
, nvl(empty_cnt, 0) empty_cnt
from ( select organ_nm
sigungu . oper_org_cd
, decode(grouping(dev_odr_cd), 1, {I*|*, dev_odr_cd) as dev_odr_cd
, sum(case em.emerg_sittn_cd when '0000' then 1 else 0 end) as emer_cancle_cnt
, sum(case em.emerg_sittn_cd when '0002' then 1 else 0 end) as emer_fire_cnt
, sum(case em.emerg_sittn_cd when '0003' then 1 else 0 end) as emer_gas_cnt
, sum(case em.emerg_sittn_cd when 0004' then 1 else 0 end) as emer_119_cnt
, sum(case em.emerg_sittn_d when *0005' then 1 else 0 end) as emer_call_cnt
, sum(case em.emerg_sittn_cd when '0006' then 1 else 0 end) as emer_callout_cnt
, sum(case em.emerg_sittn_cd when '0007' then 1 else 0 end) as emer_lone_death_cnt
, sum(case em.emerg_sittn_cd when '0008' then 1 else 0 end) as emer_safety_accident_cnt
, sum(case em.emerg_sittn_cd when '0009' then 1 else 0 end) as emer_disease_cnt
, sum(case em.emerg_sittn_cd when '0010' then 1 else 0 end) as emer_nb_cnt
, sumicase em.emerg_sittn_cd when '0011' then 1 else 0 end) as emer_stop_cnt
, sum(case em.emerg_sittn_cd when '0012' then 1 else 0 end) as emer_mcall cnt|
, sum(case em.emerg_sittn_cd when '0013' then 1 else 0 end) as 9_119_cnt
, sum(case em.emerg_sittn_cd when '0099' then 1 else 0 end) as emer_etc_cnt
, sum(case ep.emerg_se_cd when '0006' then 1 else 0 end) as emer_cnt , sum(case ep.emerg_se_cd when '0007' then 1 else 0 end) as no_emer_cnt , sum(case ep.emerg_se_cd when '0008' then 1 else 0 end) as test_cnt , sum(case when ep.no_emerg_se_cd in ('7012', '7013", '7014*, *7015',
       7021') then 1 else 0 end) as normal cnt
, sum(case when ep.no _emerg_se_cd in ('7016', '7017', '7018, '7020') then 1 else 0 end) as unnormal_cnt
safe _cnt|
, sum(case ep.safe_confrm_se_d when '01' then 1 else 0 end) as

, sum(case ep.spot_gut_se_cd when '01' then 1 else 0 end) as spot_cnt , sum(case ep.hsptl_trnsf
_se_cd when '01' then 1 else 0 end) as
hsptl_cnt
, sum(case ep.death_at_cd when '02' then 1 else 0 end) as death_cnt , sum(case em.safe_119 when '01' then 1 else 0 end) as safe_119_cnt , sum(case em.safe_emer when '02' then 1 else 0 end) as safe_emer_cnt , sum(case em.gout_119 when '01' then 1 else 0 end) as gout_119_cnt , sum(case em.gout-emer when '02' then 1 else 0 end) as gout_emer_cnt

<choose>
<when test='dupExcYn != null and dupExcYn == "N" '> ‹choose>
<when test='dtselection == "emerg_reg_dt">
. (select count(1)
from TIBERO1.tb_gt_emerg_new
where oper_org_cd=em.oper_org_cd
and emerg_reg_t between #(searchSdate) || 'O' and #(searchEdate} I| and n(prs_yn, N'= N) as empty_cnt
</when>
<otherwise>
, (
select count (1)
from TIBERO1.tb_gt_emerg_new
where oper_org_cd=em.oper_org_cd
  and emera cur de between tsearchdate)
  and searchEdate)
    </otherwise
    >
    </choose
    >
    </ when
    >
    <otherwise
    >
    empty_cnt
    </otherwise
    >
    , sum (case when ep.prs_emerg_id is null then 1 else 0 end) as
    </choose
    >
from ( select lo.organ_m
    Is.sigungu, em.DEV_ODR_CD, em.oper_org_cd
        , em.emerg_id
        , em.emerg_sittn_cd
        , em.emerg_sittn_type_cd
        , em.emerg_occur_dt
        , em.emerg_reg_dt
        , em.emerg_chk_dt
        , em.prs_emerg_id
        , (select detail_item_se_cd from TIBERO1.tb_gt_emerg_detail where
    pr_emerg_id = em.prs_emerg_id and item_se_cd = 'LN0504' and
    detail_item_se_cd = '01') as safe_119
        , (select detail item_se_cd from TIBERO1.tb_gt_emerg_detail where
    prs_emerg_id = em.prs_emerg_id and item_se_cd = 'LN0506' and
    detail item_se_cd = '01') as gout_119
        , (select detail_item_se_cd from TIBERO1.tb_gt_emerg_detail where
    prs_emerg_id = em.prs_emerg_id and item_se_cd = 'LN0504' and
    detail item_se_cd = '02') as safe_emer • (select detail item_se_cd from TIBERO1 tb _gt_emerg_detail where
prs_emerg_id = em.prs_emerg_id and item_se_cd = "LN0506* and
detail item_se_cd = '02") as gout_emer
from <if
test="(tgtprTypeCd != null and !tgtprTypeCd.equals*)) or (edYn != null and !edYn.equals("›)"»
TIBERO1.tb_gt_tgtpr_svc ts,
</if>
tb_ In_organ lo to_In_ser loc Is
. TIBERO1.tb_gt_emerg_new em
where
1= 1
<-- 20230810 장비차수 조회 -->
‹ choose >
<when test="schDevOdrCd!= null and !schDevOdrCd.equals(")">
and em.DEV_ODR_CD = #(schDevOdrCd}
</when>
<otherwise>
^… 20~23년 댁내만 조회 >
and em.DEV_ODR_CD in ('00, 10', 20)
</otherwise> ‹/choose>
<!-- 20210831 이재봉 bzlypeCd 추가 start >
<if test="bzTypeCd! =null and bzTypeCd.equals(*")">
and lo.bz_type_cd = #(bzTypeCd}
</ify
<-- 20210831 이재봉 bzlypeCd 추가 end ->
cif
test="(tgtprTypeCd != null and !tgtprTypeCd.equals")) or (edYn!= null and ledYn.equals(*))">
and em.tgtpr_id = ts.tgtpr_id
<if test="tgtprTypeCd != null and !tgtprTypeCd.equals(*) ">
</it>
and em.svc_kind_cd = #{tgtprTypeCd)
<if test="edYn!= null and !edYn.equals*) ">
</if>
and ts.ed_yn = #(edYn}

</if>

</it> ‹choose >
<when test= dtselection == "emerg_reg_dt*»
and em.emerg_reg_dt between #(searchSdate) || 'O' and #{searchEdate) ||
9
</when>
< otherwise>
and em.emerg_occur_de between #(searchSdate) and #(searchEdate)
</otherwise >
</choose>
< choose>
< when test="searchExclnstt!= null and searchExcInstt.equals(*) ">
/** 지역센터 **/
and em.oper_org_cd = #[searchExcInstt}
</when>
<when test="searchSiGnGun != null and !searchSiGnGun.equals(") ">
/** 시군구 코드 **/
and lo.sido_cd in (select retire_d from tb_In_svc_area_mapp where
area_center_cd = #(searchSiGnGun} and use_yn = 'Y')
</when>
< otherwise>
/** 시도 **/
</otherwise>
and lo.sido_d like substr#{searchSido),1,2) || '%'
</choose>
and em.oper_org_cd = lo.organ_id
and lo.sido_cd = Is.ser_loc_cd
) em
left outer join TIBERO1.tb_gt_emerg_prs ep on em.prs_emserg_id =
ep.prs_emerg_id
where
1= 1
<if test='emergSeCd!= null and emergSeCd!= "**>
and ep.emerg_se_cd = #(emergSeCd}
</if >
<if test=dupExcYn!= null and dupExcYn == "N" ›
</if>
and em.emerg_id = ep.main_emerg_id
<-- 소방서조치 여부 -->
<if test=u119PrsYn != "'' and u119PrsYn != null'>

<if test='u119PrsYn ==. "y''>
and em.gout_119 = '01! ≤/it
<if test='u119PrsYn == "N"'> and em.gout_119 is null
</if> </if>
21-- 20230810 장비차수 조회 > ‹choose >
<when test="schDevOdrCd != null and !schDevOdrCd.equals(*)" > group by em.organ_nm, em.sigungu, em.oper_org_cd, em.DEV_ODR_CD </when> <otherwise >
group by rollup (em.sigungu, (em.organ_nm, em.DEV_ODR_CD, em.oper_org_cd))
having grouping_id(em.sigungu, em.DEV_ODR_CD) in (0,1) </otherwise> </choose> ) er
order by organ_nm, sigungu </
select>